plugins {
    `java-library`
    `maven-publish`
    signing
    //id("io.github.gradle-nexus.publish-plugin") version "1.3.0"
}

//version = "1.4.0"
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

dependencies {
    api("com.google.flatbuffers:flatbuffers-java:24.3.25")
    api("com.google.code.findbugs:jsr305:3.0.2")
    constraints {
        add("implementation", "com.google.flatbuffers:flatbuffers-java") {
            version {
                prefer("24.3.25")
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
    /*
    Manuel deploy to maven central
    - Enable repo below, set version
    - ./gradlew publishMavenJavaPublicationToLocalRepository
    - delete maven meta data
    - zip com directory in ~/Download/local_repo
    - deployment name "com.open-meteo:sdk:1.4.0"
    */
    /*repositories {
        maven {
            name = "local"
            url = uri("file://Users/patrick/Downloads/local_repo/")
        }
    }*/
}

// GitHub packages requires a github token even to read packages
// Not suitable for an easy workflow
/*publishing {
    repositories {
        maven {
            name = "GitHubPackages"
            url = uri("https://maven.pkg.github.com/open-meteo/sdk")
            credentials {
                username = project.findProperty("gpr.user") as String? ?: System.getenv("GH_TOKEN")
                password = project.findProperty("gpr.key") as String? ?: System.getenv("GH_ACTOR")
            }
        }
    }
    publications {
        register<MavenPublication>("gpr") {
            from(components["java"])
        }
    }
}*/

val signingKey: String? = providers.environmentVariable("GRADLE_SIGNING_KEY").orNull
val signingPassword: String? = providers.environmentVariable("GRADLE_SIGNING_PASSWORD").orNull

signing {
    if (!signingKey.isNullOrBlank() && !signingPassword.isNullOrBlank()) {
        useInMemoryPgpKeys(signingKey, signingPassword)
        sign(configurations.archives.get())
        sign(publishing.publications["mavenJava"])
        //sign(publishing.publications["gpr"])
    } else {
        logger.warn("The signing key and password are null. This can be ignored if this is a pull request.")
    }
}

/*val sonatypeUsername: String? = providers.environmentVariable("SONATYPE_USERNAME").orNull
val sonatypePassword: String? = providers.environmentVariable("SONATYPE_PASSWORD").orNull
nexusPublishing {
    repositories {
        sonatype {
            nexusUrl.set(uri("https://s01.oss.sonatype.org/service/local/"))
            snapshotRepositoryUrl.set(uri("https://s01.oss.sonatype.org/content/repositories/snapshots/"))
            username = sonatypeUsername
            password = sonatypePassword
        }
    }
}*/