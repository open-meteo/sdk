plugins {
    `java-library`
    `maven-publish`
    signing
    id("com.gradleup.nmcp") version "1.6.2"
    id("com.gradleup.nmcp.aggregation") version "1.6.2"
}

group = "com.open-meteo"

sourceSets {
    main {
        java {
            setSrcDirs(listOf("java"))
        }
    }
}

java {
    withJavadocJar()
    withSourcesJar()
    toolchain {
        languageVersion = JavaLanguageVersion.of(11)
    }
}

repositories {
    mavenCentral()
}

// As of 30th October, 25.9.23 was not available. Keep 25.2.10
dependencies {
    nmcpAggregation(project(":"))
    api("com.google.flatbuffers:flatbuffers-java:25.2.10")
    api("com.google.code.findbugs:jsr305:3.0.2")
    constraints {
        add("implementation", "com.google.flatbuffers:flatbuffers-java") {
            version {
                prefer("25.2.10")
                require("22.10.0")
            }
        }
        add("implementation", "com.google.code.findbugs:jsr305") {
            version {
                prefer("3.0.2")
                require("3.0.0")
            }
        }
    }
}

nmcpAggregation {
    centralPortal {
        username = providers.environmentVariable("MAVEN_CENTRAL_USERNAME")
        password = providers.environmentVariable("MAVEN_CENTRAL_PASSWORD")
        publishingType = "AUTOMATIC"
    }
}

publishing {
    publications {
        create<MavenPublication>("mavenJava") {
            from(components["java"])
            pom {
                name.set("Open-Meteo Java SDK")
                description.set("Compiled FlatBuffers schema files for the Open-Meteo Weather API")
                url.set("https://open-meteo.com")
                licenses {
                    license {
                        name.set("MIT")
                        url.set("https://github.com/open-meteo/sdk/blob/main/LICENSE")
                    }
                }
                developers {
                    developer {
                        id.set("patrick-zippenfenig")
                        name.set("Patrick Zippenfenig")
                        email.set("patrick@zippenfenig.de")
                    }
                }
                scm {
                    connection.set("scm:git:git://github.com/open-meteo/sdk.git")
                    developerConnection.set("scm:git:git://github.com/open-meteo/sdk.git")
                    url.set("https://github.com/open-meteo/sdk")
                }
            }
        }
    }
}

val signingKey: String? = providers.environmentVariable("GRADLE_SIGNING_KEY").orNull
val signingPassword: String? = providers.environmentVariable("GRADLE_SIGNING_PASSWORD").orNull

signing {
    if (!signingKey.isNullOrBlank() && !signingPassword.isNullOrBlank()) {
        useInMemoryPgpKeys(signingKey, signingPassword)
        sign(configurations.archives.get())
        sign(publishing.publications["mavenJava"])
    } else {
        logger.warn("The signing key and password are null. This can be ignored if this is a pull request.")
    }
}
