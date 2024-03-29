//
// Per rilasciare il plugin: publish-plugin -repository=algosRepo
//
class AlgosGrailsPlugin {
    // the plugin version
    def version = "1.27"

    // the version or versions of Grails the plugin is designed for
    def grailsVersion = "2.3.7 > *"

    // the other plugins this plugin depends on
    def dependsOn = [:]
    // mavenPublisher: "0.8 > *",     // maven-publisher

    // resources that are excluded from plugin packaging
    def pluginExcludes = [
            "grails-app/conf/PluginUrlMappings.groovy",
            "grails-app/conf/ApplicationResources.groovy",
            "grails-app/views/error.gsp",
            "grails-app/controllers/it/algos/algos/ProvaController.groovy",
            "grails-app/domain/it/algos/algos/Prova.groovy",
            "grails-app/views/prova/" ,
    ]

    def author = "Gac & Alex"
    def authorEmail = "gac@algos.it"
    def title = "Libreria di base per Grails"
    def description = 'Libreria di funzionalita comuni a qualsiasi applicazione realizzata con Grails'

    // URL to the plugin's documentation
    def documentation = "http://grails.org/plugin/algosbase"

    // Extra (optional) plugin metadata

    // License: one of 'APACHE', 'GPL2', 'GPL3'
//    def license = "APACHE"

    // Details of company behind the plugin (if there is one)
//    def organization = [ name: "My Company", url: "http://www.my-company.com/" ]

    // Any additional developers beyond the author specified above.
//    def developers = [ [ name: "Joe Bloggs", email: "joe@bloggs.net" ]]

    // Location of the plugin's issue tracker.
//    def issueManagement = [ system: "JIRA", url: "http://jira.grails.org/browse/GPMYPLUGIN" ]

    // Online location of the plugin's browseable source code.
//    def scm = [ url: "http://svn.grails-plugins.codehaus.org/browse/grails-plugins/" ]

    def doWithWebDescriptor = { xml ->
        // TODO Implement additions to web.xml (optional), this event occurs before
    }

    def doWithSpring = {
        // TODO Implement runtime spring config (optional)
    }

    def doWithDynamicMethods = { ctx ->
        // TODO Implement registering dynamic methods to classes (optional)
    }

    def doWithApplicationContext = { applicationContext ->
        // TODO Implement post initialization spring config (optional)
    }

    def onChange = { event ->
        // TODO Implement code that is executed when any artefact that this plugin is
        // watching is modified and reloaded. The event contains: event.source,
        // event.application, event.manager, event.ctx, and event.plugin.
    }

    def onConfigChange = { event ->
        // TODO Implement code that is executed when the project configuration changes.
        // The event is the same as for 'onChange'.
    }

    def onShutdown = { event ->
        // TODO Implement code that is executed when the application shuts down (optional)
    }
}
