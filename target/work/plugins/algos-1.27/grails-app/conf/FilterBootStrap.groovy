class FilterBootStrap {

    def init = { servletContext ->
        log.debug 'init'

        //--inietta un flag di controllo (statico) nel servletContext
        //--regolando questo flag, le pagine (list) GSP costruiscono i bottoni/menu
        //--di chiamata ai metodi di ricerca, filtro e selezione
        servletContext.usaFilter = true
    }// fine della closure

    def destroy = {
    }// fine della closure

}// fine della classe di tipo BootStrap
