plugins {
    `java-library`
    `maven-publish`
    signing
}

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

val signingKey: String? = providers.environmentVariable("SIGNING_KEY").orNull
val signingPassword: String? = providers.environmentVariable("SIGNING_PASSWORD").orNull

signing {
    if (!signingKey.isNullOrBlank() && !signingPassword.isNullOrBlank()) {
        useInMemoryPgpKeys(signingKey, signingPassword)
        sign(configurations.archives.get())
    } else {
        logger.warn("The signing key and password are null. This can be ignored if this is a pull request.")
    }
}