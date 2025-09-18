import re
import sys

def snake_to_camel(name: str) -> str:
    parts = name.split("_")
    return parts[0] + "".join(p.capitalize() for p in parts[1:])

def sanitize_case(name: str) -> str:
    # Handle Swift reserved cases like "none"
    if name == "none":
        return "none_"
    return snake_to_camel(name)

def parse_enum(schema: str, enum_name: str):
    # Allow for optional base type (e.g. : ubyte) and flexible whitespace
    pattern = rf"enum\s+{enum_name}\s*(?::\s*\w+)?\s*\{{(.*?)\}}"
    match = re.search(pattern, schema, re.S)
    if not match:
        raise ValueError(f"Enum {enum_name} not found in schema")

    body = match.group(1)
    entries = []
    for line in body.split("\n"):
        line = line.strip().rstrip(",")
        if not line or line.startswith("//"):
            continue
        name = line.split("=")[0].strip()
        entries.append(name)
    return entries

def generate_swift(enum_name: str, entries):
    swift_enum_name = f"openmeteo_sdk_{enum_name}"
    lines = [f"public extension {swift_enum_name} {{"]

    # string computed property
    lines.append("    var string: String {")
    lines.append("        switch self {")
    for entry in entries:
        swift_case = sanitize_case(entry)
        lines.append(f"        case .{swift_case}:")
        lines.append(f"            return \"{entry}\"")
    lines.append("        }")
    lines.append("    }")
    lines.append("")

    # initializer from string
    lines.append("    init?(rawValue: String) {")
    lines.append("        switch rawValue {")
    for entry in entries:
        swift_case = sanitize_case(entry)
        lines.append(f"        case \"{entry}\":")
        lines.append(f"            self = .{swift_case}")
    lines.append("        default:")
    lines.append("            return nil")
    lines.append("        }")
    lines.append("    }")

    lines.append("}")
    return "\n".join(lines)

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python gen_swift_enum_ext.py <schema.fbs> <EnumName>")
        sys.exit(1)

    schema_file = sys.argv[1]
    enum_name = sys.argv[2]

    with open(schema_file) as f:
        schema = f.read()

    entries = parse_enum(schema, enum_name)
    swift_code = generate_swift(enum_name, entries)
    print(swift_code)