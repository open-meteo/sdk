
# Open-Meteo Python SDK

https://pypi.org/project/openmeteo-sdk/

`pip install openmeteo-sdk`

## Missing sunrise, sunset, moonrise, and moonset timestamps

`VariableWithValues.ValuesInt64AsNumpy()` returns raw Unix timestamps in seconds for `sunrise`, `sunset`, `moonrise`, and `moonset`. When an event does not occur during the local calendar day, the value is the missing timestamp sentinel `INT64_MAX` (`9223372036854775807`).

For pandas, convert the raw accessor result to `NaT` like this:

```python
import numpy as np
import pandas as pd

missing_int64 = np.iinfo(np.int64).max

raw = variable.ValuesInt64AsNumpy()
timestamps = pd.to_datetime(
    pd.Series(raw).mask(raw == missing_int64),
    unit="s",
    utc=True,
)
```
