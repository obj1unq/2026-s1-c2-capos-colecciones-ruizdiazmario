import capos.*
import castillo.*
object espada {
    var usos = 0
    method nombre() {
        return "Espada del destino"
    }

    method usar() {
        usos = usos + 1
    }

    method usos() {
        return usos
    }

    method poder(portador) {
        return if (usos == 0) {
            portador.poderBase()
        } else {
            portador.poderBase() / 2
        }
    }
}    

object armadura {
    var usos = 0
    const poder = 6

    method nombre() {
        return "Armadura de acero valyrio"
    }

    method poder(portador) {
        return poder
    }

    method usar() {
        usos = usos + 1
    }

    method usos() {
        return usos
    }
}

object collar {
    var usos = 0

    method nombre() {
        return "Collar divino"
    }

    method usos() {
        return usos
    }

    method usar() {
        usos = usos + 1
    }

    method poder(portador) {
        return if (portador.poderBase() > 6) 
        {
            3 + usos
        } else {
            3
        }
    }
}

object libro {
    const hechizos = []

    method nombre() {
        return "Libro de hechizos"
    }
    
    method usar() {
        if (!hechizos.isEmpty()) {
            hechizos.remove(hechizos.first())
        }
    }

    method poder(portador) {
        if (hechizos.isEmpty()) {
            return 0
        } else {
            return hechizos.first().poder(portador)
        }
    }

    method hechizos() {
        return hechizos

    }

    method agregarHechizo(h) {
        hechizos.add(h)
    }

    method reset() {
        hechizos.clear()
    }
}

object bendicion {
    method poder(portador) {
        return 4
    }
}

object invisibilidad {
    method poder(portador) {
        return portador.poderBase()
    }
}

object invocacion {
    method poder(portador){
        if (castillo.artefactosAlmacenados().isEmpty()) {
            return 0
        } else {
            return portador.morada().artefactoMasPoderoso(portador).poder(portador)
        }
    }
}