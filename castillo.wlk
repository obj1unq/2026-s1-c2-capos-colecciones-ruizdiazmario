import artefactos.*
import capos.*
object castillo {
const artefactosAlmacenados = #{}
    
    method artefactosAlmacenados() {
        return artefactosAlmacenados
    }

    method artefactoMasPoderoso(portador) {
        const artefactosSinLibro = self.artefactosAlmacenados() 
                                        .filter({ a => a != libro })
        return artefactosSinLibro.max({ art => art.poder(portador)})
    }
}