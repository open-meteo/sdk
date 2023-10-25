plugins {
    `java-library`
    `maven-publish`
    signing
    id("com.gradle.plugin-publish") version "1.1.0" //https://docs.gradle.org/current/userguide/publishing_gradle_plugins.html
    //id("io.github.gradle-nexus.publish-plugin") version "1.3.0"
}

version = "1.0.0"
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
}

repositories {
    mavenCentral()
}

dependencies {
    implementation("com.google.flatbuffers:flatbuffers-java:23.5.26")
}

publishing {
    publications {
        create<MavenPublication>("mavenJava") {
            from(components["java"])
            pom {
                name.set("com.open-meteo.sdk")
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

// https://docs.gradle.org/current/userguide/publishing_gradle_plugins.html
gradlePlugin { 
    website = "https://open-meteo.com" 
    vcsUrl = "https://github.com/open-meteo/sdk"
    plugins { 
        create("sdk") { 
            id = "com.open-meteo.sdk"
            displayName = "Open-Meteo SDK"
            description = "Compiled FlatBuffers schema files for the Open-Meteo Weather API"
            tags = listOf("open-meteo", "weather", "api")
            implementationClass = "com.open_meteo.sdk.ApiResponse"
        }
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