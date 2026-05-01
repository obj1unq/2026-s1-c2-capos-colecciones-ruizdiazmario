import artefactos.*

object castillo {
    const artefactosAlmacenados = #{}

    method artefactosAlmacenados() {
        return artefactosAlmacenados
    }

    method guardar(artefactos) {
        artefactosAlmacenados.addAll(artefactos)
    }

    method vaciar() {
        artefactosAlmacenados.clear()
    }

    method artefactoMasPoderoso(portador) {
        return artefactosAlmacenados
            .max({ a => a.poder(portador) })
    }
}