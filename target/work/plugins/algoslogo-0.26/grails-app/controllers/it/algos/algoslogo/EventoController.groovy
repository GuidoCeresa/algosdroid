/* Created by Algos s.r.l. */
/* Date: mag 2012 */
/* Questo file è stato installato dal plugin AlgosBase */
/* Tipicamente NON verrà più sovrascritto dalle successive release del plugin */
/* in quanto POTREBBE essere personalizzato in questa applicazione */
/* Se vuoi che le prossime release del plugin sovrascrivano questo file, */
/* perdendo tutte le modifiche effettuate qui, */
/* regola a true il flag di controllo flagOverwrite© */
/* flagOverwrite = false */

package it.algos.algoslogo

import org.springframework.dao.DataIntegrityViolationException

class EventoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    } // fine del metodo

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [eventoInstanceList: Evento.list(params), eventoInstanceTotal: Evento.count()]
    }

    def create() {
        [eventoInstance: new Evento(params)]
    } // fine del metodo

    def save() {
        def eventoInstance = new Evento(params)
        if (!eventoInstance.save(flush: true)) {
            render(view: "create", model: [eventoInstance: eventoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'evento.label', default: 'Evento'), eventoInstance.id])
        redirect(action: "show", id: eventoInstance.id)
    } // fine del metodo

    def show(Long id) {
        def eventoInstance = Evento.get(id)
        if (!eventoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'evento.label', default: 'Evento'), id])
            redirect(action: "list")
            return
        }

        [eventoInstance: eventoInstance]
    } // fine del metodo

    def edit(Long id) {
        def eventoInstance = Evento.get(id)
        if (!eventoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'evento.label', default: 'Evento'), id])
            redirect(action: "list")
            return
        }

        [eventoInstance: eventoInstance]
    } // fine del metodo

    def update(Long id, Long version) {
        def eventoInstance = Evento.get(id)
        if (!eventoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'evento.label', default: 'Evento'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (eventoInstance.version > version) {
                eventoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'evento.label', default: 'Evento')] as Object[],
                        "Another user has updated this Evento while you were editing")
                render(view: "edit", model: [eventoInstance: eventoInstance])
                return
            }
        }

        eventoInstance.properties = params

        if (!eventoInstance.save(flush: true)) {
            render(view: "edit", model: [eventoInstance: eventoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'evento.label', default: 'Evento'), eventoInstance.id])
        redirect(action: "show", id: eventoInstance.id)
    } // fine del metodo

    def delete(Long id) {
        def eventoInstance = Evento.get(id)
        if (!eventoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'evento.label', default: 'Evento'), id])
            redirect(action: "list")
            return
        }

        try {
            eventoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'evento.label', default: 'Evento'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'evento.label', default: 'Evento'), id])
            redirect(action: "show", id: id)
        }
    } // fine del metodo

} // fine della controller classe
