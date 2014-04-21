package it.algos.algospref
import org.springframework.dao.DataIntegrityViolationException

class PrefController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: 'list', params: params)
    } // fine del metodo

    def list(Integer max) {
        params.max = Math.min(max ?: 20, 100)
        def b=params
        def a=Pref.list(params)
        [prefInstanceList: Pref.list(params), prefInstanceTotal: Pref.count()]
    } // fine del metodo

    def create() {
        params.ordine = LibPref.getNewOrdine()
        [prefInstance: new Pref(params)]
    } // fine del metodo

    def save() {
        def prefInstance = new Pref(params)

        if (nuovaInstanzaVuota(prefInstance)) {
            redirect(action: 'list')
        } else {
            if (!prefInstance.save(flush: true)) {
                render(view: 'create', model: [prefInstance: prefInstance])
                return
            }// fine del blocco if e fine anticipata del metodo

            flash.message = message(code: 'default.created.message', args: [message(code: 'pref.label', default: 'Pref'), prefInstance.id])
            redirect(action: 'list')
        }// fine del blocco if-else

    } // fine del metodo

    def show(Long id) {
        def prefInstance = Pref.get(id)

        if (!prefInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pref.label', default: 'Pref'), id])
            redirect(action: 'list')
            return
        }// fine del blocco if e fine anticipata del metodo

        [prefInstance: prefInstance]
    } // fine del metodo

    def edit(Long id) {
        def prefInstance = Pref.get(id)

        if (!prefInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pref.label', default: 'Pref'), id])
            redirect(action: 'list')
            return
        }// fine del blocco if e fine anticipata del metodo

        [prefInstance: prefInstance]
    } // fine del metodo

    def update(Long id, Long version) {
        def prefInstance = Pref.get(id)

        if (!prefInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pref.label', default: 'Pref'), id])
            redirect(action: 'list')
            return
        }// fine del blocco if e fine anticipata del metodo

        if (version != null) {
            if (prefInstance.version > version) {
                prefInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'pref.label', default: 'Pref')] as Object[],
                        "Another user has updated this Pref while you were editing")
                render(view: 'edit', model: [prefInstance: prefInstance])
                return
            }// fine del blocco if e fine anticipata del metodo
        }// fine del blocco if

        prefInstance.properties = params

        if (modificaInstanzaVuota(prefInstance)) {
            prefInstance.discard()
            redirect(action: 'list')
        } else {
            if (!prefInstance.save(flush: true)) {
                render(view: 'edit', model: [prefInstance: prefInstance])
                return
            }// fine del blocco if e fine anticipata del metodo

            flash.message = message(code: 'default.updated.message', args: [message(code: 'pref.label', default: 'Pref'), prefInstance.id])
            redirect(action: 'show', id: prefInstance.id)
        }// fine del blocco if-else
    } // fine del metodo

    def delete(Long id) {
        def prefInstance = Pref.get(id)
        if (!prefInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pref.label', default: 'Pref'), id])
            redirect(action: 'list')
            return
        }// fine del blocco if e fine anticipata del metodo

        try {
            prefInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'pref.label', default: 'Pref'), id])
            redirect(action: 'list')
        }// fine del blocco try
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'pref.label', default: 'Pref'), id])
            redirect(action: 'show', id: id)
        }// fine del blocco catch
    } // fine del metodo

    def nuovaInstanzaVuota(Pref prefInstance) {
        boolean vuota = true
        boolean vuotaTypo
        boolean vuotaAll = true
        String erroreType = 'La preferenza non è stata creata perché mancava il valore corrispondente al tipo selezionato'
        String erroreAll = 'La preferenza non è stata creata perché non aveva nessun valore'

        // prima controlla se esiste il valore previsto
        vuotaTypo = valorePrevistoVuoto(prefInstance)

        // adesso controlla se esistono altri valori
        if (vuotaTypo) {
            vuotaAll = tuttiValoriVuoti(prefInstance)
        } else {
            vuota = false
        }// fine del blocco if-else

        if (vuota) {
            if (vuotaAll) {
                flash.error = erroreAll
            } else {
                if (vuotaTypo) {
                    flash.error = erroreType
                } else {
                    flash.error = 'Mi sono incasinato'
                }// fine del blocco if-else
            }// fine del blocco if-else
        }// fine del blocco if

        return vuota
    } // fine del metodo

    def modificaInstanzaVuota(Pref prefInstance) {
        boolean vuotaTypo = true
        String erroreType = 'La preferenza non è stata modificata perché mancava il valore corrispondente al tipo selezionato'

        // prima controlla se esiste il valore previsto
        vuotaTypo = valorePrevistoVuoto(prefInstance)

        // adesso controlla se esistono altri valori
        if (vuotaTypo) {
            flash.error = erroreType
        }// fine del blocco if

        return vuotaTypo
    } // fine del metodo

    // controlla se esiste il valore previsto
    def valorePrevistoVuoto(Pref prefInstance) {
        boolean vuotaTypo = true
        Pref.Type type = null

        if (prefInstance) {
            type = prefInstance.type
        }// fine del blocco if

        if (type) {
            switch (type) {
                case Pref.Type.stringa:
                    if (prefInstance.stringa) {
                        vuotaTypo = false
                    }// fine del blocco if
                    break
                case Pref.Type.testo:
                    if (prefInstance.testo) {
                        vuotaTypo = false
                    }// fine del blocco if
                    break
                case Pref.Type.booleano:
                    vuotaTypo = false
                    break
                case Pref.Type.intero:
                    if (prefInstance.intero instanceof Integer) {
                        vuotaTypo = false
                    }// fine del blocco if
                    break
                case Pref.Type.lungo:
                    if (prefInstance.lungo instanceof Long) {
                        vuotaTypo = false
                    }// fine del blocco if
                    break
                case Pref.Type.reale:
                    if (prefInstance.reale instanceof Float) {
                        vuotaTypo = false
                    }// fine del blocco if
                    break
                case Pref.Type.doppio:
                    if (prefInstance.doppio instanceof Double) {
                        vuotaTypo = false
                    }// fine del blocco if
                    break
                case Pref.Type.decimale:
                    if (prefInstance.decimale instanceof BigDecimal) {
                        vuotaTypo = false
                    }// fine del blocco if
                    break
                case Pref.Type.data:
                    if (prefInstance.data) {
                        vuotaTypo = false
                    }// fine del blocco if
                    break
                default: // caso non definito
                    break
            } // fine del blocco switch
        }// fine del blocco if

        return vuotaTypo
    } // fine del metodo

    // controlla se esistono altri valori
    def tuttiValoriVuoti(Pref prefInstance) {
        boolean vuotaAll = true

        if (prefInstance) {
            if (prefInstance.stringa) {
                vuotaAll = false
            }// fine del blocco if
            if (prefInstance.testo) {
                vuotaAll = false
            }// fine del blocco if
            if (prefInstance.bool) {
                vuotaAll = false
            }// fine del blocco if
            if (prefInstance.intero) {
                vuotaAll = false
            }// fine del blocco if
            if (prefInstance.lungo) {
                vuotaAll = false
            }// fine del blocco if
            if (prefInstance.reale) {
                vuotaAll = false
            }// fine del blocco if
            if (prefInstance.doppio) {
                vuotaAll = false
            }// fine del blocco if
            if (prefInstance.decimale) {
                vuotaAll = false
            }// fine del blocco if
            if (prefInstance.data) {
                vuotaAll = false
            }// fine del blocco if
        }// fine del blocco if

        return vuotaAll
    } // fine del metodo

} // fine della controller classe
