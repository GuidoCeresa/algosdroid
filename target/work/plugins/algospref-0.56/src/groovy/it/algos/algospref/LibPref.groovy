package it.algos.algospref

import java.text.ParseException
import java.text.SimpleDateFormat

/**
 * Created with IntelliJ IDEA.
 * User: Gac
 * Date: 23-9-12
 * Time: 16:37
 * To change this template use File | Settings | File Templates.
 */
class LibPref {

    // Restituisce il valore stringa di un parametro Preferenze
    // Stringa vuota, se non trova il record/parametro
    public static String getString(String code) {
        return getString(code, '')
    }// fine del metodo

    // Restituisce il valore stringa di un parametro Preferenze
    // Valore suggerito, se non trova il record/parametro
    public static String getString(String code, String suggerito) {
        // variabili e costanti locali di lavoro
        String risultato
        Preferenze preferenza = getPreferenza(code)

        if (preferenza) {
            risultato = preferenza.value
        } else {
            risultato = suggerito
        }// fine del blocco if-else

        // valore di ritorno
        return risultato
    }// fine del metodo

    // Restituisce il valore intero di un parametro Preferenze
    // Intero = zero, se non trova il record/parametro
    public static int getInt(String code) {
        return getInt(code, 0)
    }// fine del metodo

    // Restituisce il valore stringa di un parametro Preferenze
    // Intero =  suggerito, se non trova il record/parametro
    public static int getInt(String code, int suggerito) {
        // variabili e costanti locali di lavoro
        int risultato
        String valore
        Preferenze preferenza = getPreferenza(code)

        if (preferenza) {
            valore = preferenza.value
            try { // prova ad eseguire il codice
                risultato = Integer.decode(valore)
            } catch (Exception unErrore) { // intercetta l'errore
                risultato = suggerito
            }// fine del blocco try-catch
        } else {
            risultato = suggerito
        }// fine del blocco if-else

        // valore di ritorno
        return risultato
    }// fine del metodo

    // Restituisce la data di un parametro Preferenze
    // Data = nulla, se non trova il record/parametro
    public static Date getData(String code) {
        return getData(code, null)
    }// fine del metodo

    // Restituisce il valore stringa di un parametro Preferenze
    // Data =  suggerito, se non trova il record/parametro
    public static Date getData(String code, Date suggerito) {
        // variabili e costanti locali di lavoro
        Date risultato = null
        String valore
        Preferenze preferenza = getPreferenza(code)

        if (preferenza) {
            valore = preferenza.value
            if (preferenza.type.equals(Preferenze.tipo[3])) {
                try {// prova ad eseguire il codice
                    def fmt = (valore.length() == 10) ? "dd-MM-yyyy" : "dd-MM-yyyy HH:mm"
                    risultato = new SimpleDateFormat(fmt, Locale.ITALY).parse(valore)
                } catch (ParseException errore) {// intercetta l'errore
                }
            } else {
                risultato = suggerito
            }// fine del blocco if-else
        } else {
            risultato = suggerito
        }// fine del blocco if-else

        // valore di ritorno
        return risultato
    }// fine del metodo

    // Restituisce il valore booleano di un parametro Preferenze
    // boolean=false, se non trova il record/parametro
    public static boolean getBool(String code) {
        return getBool(code, false)
    }// fine del metodo

    // Restituisce il valore booleano di un parametro Preferenze
    // boolean =  suggerito, se non trova il record/parametro
    public static boolean getBool(String code, boolean suggerito) {
        // variabili e costanti locali di lavoro
        boolean risultato = false
        String valore
        Preferenze preferenza = getPreferenza(code)

        if (preferenza) {
            valore = preferenza.value
            if (preferenza.type.equals(Preferenze.tipo[4])) {
                try {// prova ad eseguire il codice
                    risultato = BoolValue.isVero(valore)
                } catch (ParseException errore) {// intercetta l'errore
                }
            } else {
                risultato = suggerito
            }// fine del blocco if-else
        } else {
            risultato = suggerito
        }// fine del blocco if-else

        // valore di ritorno
        return risultato
    }// fine del metodo

    // Recupera la preferenza dal codice
    // Preferenze = nulla, se non trova il record/parametro
    public static Preferenze getPref(String code) {
        return getPreferenza(code)
    }// fine del metodo

    // Recupera la preferenza dal codice
    // Preferenze = nulla, se non trova il record/parametro
    private static Preferenze getPreferenza(String code) {
        return Preferenze.findByCode(code)
    }// fine del metodo

    // Recupera il valore della preferenza dal codice
    // Valore = nul, se non trova il record/parametro
    public static getValue(String code) {
        def value = null
        Preferenze preferenza = getPreferenza(code)

        if (preferenza) {
            value = preferenza.value
        }// fine del blocco if

        return value
    }// fine del metodo

    public static int getNewOrdine() {
        def valore
        int ordine = 1
        def risultato = Pref.executeQuery('select max(ordine) from Pref')
        if (risultato && risultato instanceof ArrayList && risultato.size() > 0) {
            valore = risultato.get(0)
            if (valore) {
                ordine = valore + 1
            }// fine del blocco if
        }// fine del blocco if

        return ordine
    }// fine del metodo

}// fine della classe libreria
