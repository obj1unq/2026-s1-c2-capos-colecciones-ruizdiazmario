import enemigos.*
import artefactos.*
import castillo.*
object rolando {
    const artefactosEnMochila = #{}
    var capacidadMaxima = 2
    const artefactosEncontrados = []
    var poderBase = 5
    var morada = castillo
    const enemigosQuePuedeVencer = #{}
    const moradasQuePuedeConquistar = #{}
    
    method encontrarArtefacto(artefacto) {
        artefactosEncontrados.add(artefacto)
        if (self.tieneEspacio()) {
            artefactosEnMochila.add(artefacto)
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

    method llegarAMorada(){
        morada.artefactosAlmacenados().addAll(self.artefactosEnMochila())
        self.vaciarMochila()
    }

    method morada() {
        return morada
    }

    method posesiones() {
        return morada.artefactosAlmacenados().union(artefactosEnMochila)
    }

    method poseeArtefacto(artefacto) {
        return self.posesiones().any {art => art == artefacto}
    }

    method poderBase() {
        return poderBase
    }

    method configurarPoderBase(cantidad) {
        poderBase = cantidad
    }

    method batalla(){
        poderBase = poderBase + 1
        artefactosEnMochila.forEach({a => a.usar()})

    }

    method poder() {
        return poderBase + artefactosEnMochila.sum({a => a.poder(self)})
    }

    method agregarSiPuedeVencerAEnemigoYConquistar(enemigo) {
        if (self.puedeVencerAEnemigoYConquistar(enemigo)) {
            enemigosQuePuedeVencer.add(enemigo)
            moradasQuePuedeConquistar.add(enemigo.morada())
        }
    }

    method puedeVencerAEnemigoYConquistar(enemigo) {
        return self.poder() > enemigo.poder()
    }

    method esPoderoso() {
        return (self.puedeVencerAEnemigoYConquistar(astra) && 
                        self.puedeVencerAEnemigoYConquistar(archibaldo) &&
                                self.puedeVencerAEnemigoYConquistar(caterina))
    }

    method enemigosQuePuedeVencer() {
        return enemigosQuePuedeVencer
    }

    method moradasQuePuedeConquistar() {
      return moradasQuePuedeConquistar
    }

    method tieneArtefactoFatalParaEnemigo(enemigo) {
        const mejorArtefacto = artefactosEnMochila.max({ art => art.poder(self) })
        return mejorArtefacto.poder(self) > enemigo.poder()
    }
    
    method artefactoFatalParaEnemigo(enemigo) {
        if (artefactosEnMochila.isEmpty()) {
            return null
        }
        const mejorArtefacto = artefactosEnMochila.maxBy({ a => a.poder(self) })
        return if (mejorArtefacto.poder(self) > enemigo.poder()) 
            mejorArtefacto 
        else null
        }
}