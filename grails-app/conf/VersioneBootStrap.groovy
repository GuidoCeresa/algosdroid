import it.algos.algosdroid.Activation

import java.sql.Time

class VersioneBootStrap {

    // utilizzo di un service con la businessLogic per l'elaborazione dei dati
    // il service viene iniettato automaticamente
    def versioneService

    //--metodo invocato direttamente da Grails
    //--tutte le aggiunte, modifiche e patch vengono inserite con una versione
    //--l'ordine di inserimento è FONDAMENTALE
    def init = { servletContext ->
        //--controllo del flusso
        log.debug 'init'

        //--prima installazione del programma
        if (versioneService && versioneService.installaVersione(1)) {
            versioneService.newVersione('Applicazione', 'Installazione iniziale')
        }// fine del blocco if

        //--prima installazione del programma
        if (versioneService && versioneService.installaVersione(2)) {
            fixTimeNull()
        }// fine del blocco if
    }// fine della closure

    private fixTimeNull() {
        String query
        query = "update activation set expiration = null where expiration is not null and not expiration>'0000-00-00 00:00:00'"
        Activation.executeUpdate(query)

        versioneService.newVersione('Database', 'Eliminati valori=0000-00-00 00:00:00 nei campi Time; sostituito con null')
    }// fine del metodo
    //--metodo invocato direttamente da Grails
    def destroy = {
    }// fine della closure

}// fine della classe di tipo BootStrap
