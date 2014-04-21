package it.algos.algosvers

import org.springframework.dao.DataIntegrityViolationException

class VersioneController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: 'list', params: params)
    } // fine del metodo

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [versioneInstanceList: Versione.list(params), versioneInstanceTotal: Versione.count()]
    } // fine del metodo

    def create() {
        [versioneInstance: new Versione(params)]
    } // fine del metodo

    def save() {
        def versioneInstance = new Versione(params)

        if (!versioneInstance.save(flush: true)) {
            render(view: 'create', model: [versioneInstance: versioneInstance])
            return
        }// fine del blocco if e fine anticipata del metodo

        flash.message = message(code: 'default.created.message', args: [message(code: 'versione.label', default: 'Versione'), versioneInstance.id])
        redirect(action: 'show', id: versioneInstance.id)
    } // fine del metodo

    def show(Long id) {
        def versioneInstance = Versione.get(id)

        if (!versioneInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'versione.label', default: 'Versione'), id])
            redirect(action: "list")
            return
        }// fine del blocco if e fine anticipata del metodo

        [versioneInstance: versioneInstance]
    } // fine del metodo

    def edit(Long id) {
        def versioneInstance = Versione.get(id)

        if (!versioneInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'versione.label', default: 'Versione'), id])
            redirect(action: 'list')
            return
        }// fine del blocco if e fine anticipata del metodo

        [versioneInstance: versioneInstance]
    } // fine del metodo

    def update(Long id, Long version) {
        def versioneInstance = Versione.get(id)

        if (!versioneInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'versione.label', default: 'Versione'), id])
            redirect(action: 'list')
            return
        }// fine del blocco if e fine anticipata del metodo

        if (version != null) {
            if (versioneInstance.version > version) {
                    versioneInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                            [message(code: 'versione.label', default: 'Versione')] as Object[],
                            "Another user has updated this Versione while you were editing")
                render(view: 'edit', model: [versioneInstance: versioneInstance])
                return
            }// fine del blocco if e fine anticipata del metodo
        }// fine del blocco if

        versioneInstance.properties = params

        if (!versioneInstance.save(flush: true)) {
            render(view: 'edit', model: [versioneInstance: versioneInstance])
            return
        }// fine del blocco if e fine anticipata del metodo

        flash.message = message(code: 'default.updated.message', args: [message(code: 'versione.label', default: 'Versione'), versioneInstance.id])
        redirect(action: 'show', id: versioneInstance.id)
    } // fine del metodo

    def delete(Long id) {
        def versioneInstance = Versione.get(id)
        if (!versioneInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'versione.label', default: 'Versione'), id])
            redirect(action: 'list')
            return
        }// fine del blocco if e fine anticipata del metodo

        try {
            versioneInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'versione.label', default: 'Versione'), id])
            redirect(action: 'list')
        }// fine del blocco try
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'versione.label', default: 'Versione'), id])
            redirect(action: 'show', id: id)
        }// fine del blocco catch
    } // fine del metodo

} // fine della controller classe
