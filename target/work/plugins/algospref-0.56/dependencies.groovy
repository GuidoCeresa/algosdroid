grails.servlet.version = "2.5" // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.target.level = 1.6
grails.project.source.level = 1.6

grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits('global') {
    }// fine della closure inherits

    //--log level of Ivy resolver, either:
    //--error
    //--warn
    //--info
    //--debug
    //--verbose
    log 'error'

    //--Whether to verify checksums on resolve
    checksums true

    repositories {
        //--Whether to inherit repository definitions from plugins
        inherits true

        grailsPlugins()
        grailsHome()
        grailsCentral()

        mavenLocal()
        mavenCentral()

        mavenRepo "http://77.43.32.198:8080/artifactory/plugins-release-local/"
    }// fine della closure repositories

    dependencies {
        //--build - dependency that is only needed by the build process
        //--runtime - dependency that is needed to run the application, but not compile it e.g. JDBC implementation for specific database vendor. This would not typically be needed at compile-time because code depends only the JDBC API, rather than a specific implementation thereof
        //--compile - dependency that is needed at both compile-time and runtime. This is the most common case
        //--test - dependency that is only needed by the tests
        //--provided - dependency that is needed at compile-time but should not be packaged with the app (usually because it is provided by the container). An example is the Servlet API
        runtime 'mysql:mysql-connector-java:5.1.27'
    }// fine della closure dependencies

    plugins {
        // plugins for the build system only
        build ':tomcat:7.0.52.1'
        build ":release:2.2.1"

        // plugins for the compile step
        compile ":scaffolding:2.0.3"
        compile ':cache:1.1.1'

        // plugins needed at runtime but not for compilation
        runtime ':hibernate:3.6.10.10'
        runtime ":resources:1.2.7"
    }// fine della closure plugins

}// fine di grails.project.dependency.resolution

grails.project.repos.algosRepo.url = "http://77.43.32.198:8080/artifactory/plugins-release-local/"
grails.project.repos.algosRepo.type = "maven"
grails.project.repos.algosRepo.username = "admin"
grails.project.repos.algosRepo.password = "password"


