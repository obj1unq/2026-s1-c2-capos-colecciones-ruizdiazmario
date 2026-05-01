import enemigos.*
import artefactos.*
import castillo.*

object rolando {
    const artefactosEnMochila = #{}
    const historialArtefactos  = []
    var capacidadMaxima = 2
    var poderBase = 5
    var morada = castillo

    method capacidadMaxima(_capacidadMaxima) {
        capacidadMaxima = _capacidadMaxima
    }

    method poderBase(_poderBase){
        poderBase = _poderBase
    }

    method encontrarArtefacto(artefacto) {
        historialArtefactos.add(artefacto)

        if (self.tieneEspacio()) {
            artefactosEnMochila.add(artefacto)
        }
    }

    method artefactosEnMochila() {
        return artefactosEnMochila 
    }

    method historialArtefactos(){
        return historialArtefactos
    }

    method tieneEspacio() {
        return artefactosEnMochila.size() < capacidadMaxima
    }

    method vaciarMochila() {
        artefactosEnMochila.clear()
    }

    method llegarAMorada() {
        morada.guardar(artefactosEnMochila)
        self.vaciarMochila()
    }

    method morada() {
        return morada
    }

    method posesiones() {
        return morada.artefactosAlmacenados().union(artefactosEnMochila)
    }

    method poderBase() {
        return poderBase
    }

    method poder() {
        return poderBase + self.poderDeArtefactos()
    }

    method poderDeArtefactos() {
        return artefactosEnMochila.sum({ a => a.poder(self) })
    }

    method batalla() {
        poderBase = poderBase + 1
        artefactosEnMochila.forEach({ a => a.usar() })
    }

    method puedeVencerA(enemigo) {
        return self.poder() > enemigo.poder()
    }

    method enemigos() {
        return #{astra, archibaldo, caterina}
    }

    method valorDelArtefactoMasPoderoso() {
        return morada.artefactoMasPoderoso(self).poder(self)
    }

    method enemigosQuePuedeVencer() {
        return self.enemigos().filter({ e => self.puedeVencerA(e) })
    }

    method moradasConquistables() {
    return self.enemigosQuePuedeVencer().map({ e => e.morada() }).asSet()}

    method esPoderoso() {
        return self.enemigos().all({ e => self.puedeVencerA(e) })
    }

    method artefactoFatalPara(enemigo) {
        return if (self.tieneArtefactoFatalPara(enemigo))
            artefactosEnMochila.find({ a => a.poder(self) > enemigo.poder() })
    }

    method tieneArtefactoFatalPara(enemigo) {
        return artefactosEnMochila.any({ a => a.poder(self) > enemigo.poder()})
    }
}