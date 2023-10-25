plugins {
    `java-library`
    `maven-publish`
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