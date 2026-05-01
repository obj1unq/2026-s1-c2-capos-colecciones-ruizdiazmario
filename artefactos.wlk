import capos.*
import castillo.*

object espada {
    var usada = false

    method usar() {
        usada = true
    }

    method usada() {
        return usada
    }

    method poder(portador) {
        return portador.poderBase() / (if (usada) 2 else 1)
    }
}
object armadura {
    const poderFijo = 6

    method usar() { }

    method poder(portador) {
        return poderFijo
    }
}

object collar {
    var usos = 0

    method usar() {
        usos = usos + 1
    }

    method poder(portador) {
        return 3 + if (portador.poderBase() > 6) usos else 0
    }
}

object libro {
    const hechizos = []

    method usar() {
        if (!hechizos.isEmpty()) {
            hechizos.remove(hechizos.first())
        }
    }

    method poder(portador) {
        return if (hechizos.isEmpty()) 0 
               else hechizos.first().poder(portador)
    }

    method agregarHechizo(h) {
        hechizos.add(h)
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
        return portador.valorDelArtefactoMasPoderoso()
    }
}