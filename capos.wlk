import artefactos.*
import castillo.*
object rolando {
    var artefactosEnMochila = #{}
    var posesiones = castillo.artefactosAlmacenados()
    var capacidadMaxima = 2
    var artefactosEncontrados = []
    var poderBase = 5
    var hogar = castillo

    method encontrarArtefacto(artefacto) {
        artefactosEncontrados.add(artefacto)
        if (self.tieneEspacio()) {
            artefactosEnMochila.add(artefacto)
            posesiones.add(artefacto)
        }
    }

    method artefactosEnMochila() {
        return artefactosEnMochila
    }

    method artefactosEncontrados() {
        return artefactosEncontrados
    }

    method configurarCapacidad(nuevaCapacidad) {
        capacidadMaxima = nuevaCapacidad
    }

    method tieneEspacio() {
        return artefactosEnMochila.size() < capacidadMaxima
    }

    method vaciarMochila() {
        artefactosEnMochila.clear()
    }

    method llegarAHogar(){
        hogar.artefactosAlmacenados().addAll(self.artefactosEnMochila())
        self.vaciarMochila()
    }

    method posesiones() {
        return posesiones
    }

    method poseeArtefacto(artefacto) {
        return posesiones.any {art => art == artefacto}
    }

    method poderBase() {
        return poderBase
    }

    method batalla(){
        poderBase = poderBase + 1
        artefactosEnMochila.forEach({a => a.usar()})

    }

    method poder() {
        return poderBase + artefactosEnMochila.sum({a => a.poder()})
    }
}