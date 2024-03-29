//
// Per rilasciare il plugin: publish-plugin -repository=algosRepo
//
class AlgoslogoGrailsPlugin {
    // the plugin version
    def version = "0.26"
    // the version or versions of Grails the plugin is designed for
    def grailsVersion = "2.3.7 > *"
    // the other plugins this plugin depends on
    def dependsOn = [:]
    // resources that are excluded from plugin packaging
    def pluginExcludes = [
            "grails-app/conf/ApplicationResources.groovy" ,
            "grails-app/views/layouts/",
            "grails-app/views/error.gsp",
            "grails-app/views/index.gsp",
            "src/templates/",
            "test/"  ,
            "web-app/",
    ]


    // TODO Fill in these fields
    def title = "Algoslogo Plugin" // Headline display name of the plugin
    def author = "Gac"
    def authorEmail = ""
    def description = '''\
Brief summary/description of the plugin.
'''

    // URL to the plugin's documentation
    def documentation = "http://grails.org/plugin/algoslogo"

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
