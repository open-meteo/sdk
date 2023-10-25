plugins {
    `java-library`
    `maven-publish`
    signing
    //id("com.gradle.plugin-publish") version "1.1.0" //https://docs.gradle.org/current/userguide/publishing_gradle_plugins.html
}

version = "0.0.0-test"
group = "com.openmeteo"

sourceSets {
    main {
        java {
            setSrcDirs(listOf("java"))
        }
    }
}

java {
    //withJavadocJar()
    withSourcesJar()
}

repositories {
    mavenCentral()
}

dependencies {
    implementation("com.google.flatbuffers:flatbuffers-java:23.5.26")
}

val signingKey: String? = providers.environmentVariable("GRADLE_SIGNING_KEY").orNull
val signingPassword: String? = providers.environmentVariable("GRADLE_SIGNING_PASSWORD").orNull

signing {
    if (!signingKey.isNullOrBlank() && !signingPassword.isNullOrBlank()) {
        useInMemoryPgpKeys(signingKey, signingPassword)
        sign(configurations.archives.get())
    } else {
        logger.warn("The signing key and password are null. This can be ignored if this is a pull request.")
    }
}

/*gradlePlugin { 
    website = "https://open-meteo.com" 
    vcsUrl = "https://github.com/open-meteo/sdk"
    plugins { 
        create("sdk") { 
            id = "com.openmeteo.sdk"
            displayName = "Open-Meteo SDK"
            description = "Compiled FlatBuffers schema files for the Open-Meteo Weather API"
            tags = listOf("openmeteo", "weather", "api")
            implementationClass = "com.openmeteo.sdk.ApiResponse"
        }
    }
}*/