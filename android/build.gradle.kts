plugins {
    id("com.google.gms.google-services") version "4.3.15" apply false
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
    project.evaluationDependsOn(":app")

    // Fix for plugins that don't declare a namespace (e.g. isar_flutter_libs).
    // Required by AGP 8+. Extracts the package from AndroidManifest.xml.
    project.plugins.whenPluginAdded {
        if (this is com.android.build.gradle.api.AndroidBasePlugin) {
            project.extensions.findByType(com.android.build.gradle.BaseExtension::class.java)?.apply {
                if (namespace.isNullOrEmpty()) {
                    val manifest = project.file("src/main/AndroidManifest.xml")
                    if (manifest.exists()) {
                        val pkg = javax.xml.parsers.DocumentBuilderFactory.newInstance()
                            .newDocumentBuilder()
                            .parse(manifest)
                            .documentElement
                            .getAttribute("package")
                        if (pkg.isNotEmpty()) {
                            namespace = pkg
                        }
                    }
                }
            }
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
