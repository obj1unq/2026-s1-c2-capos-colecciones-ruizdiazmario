import capos.*
object espada {
    var usos = 0
    var poder = 0


    method nombre() {
        return "Espada del destino"
    }

    method usar() {
        usos = usos + 1
    }

    method usos() {
        return usos
    }

    method poder() {
        return if (usos == 0) {
            rolando.poderBase()
        } else {
            rolando.poderBase() / 2
        }
    }
}    

object libro {
    var usos = 0
    var poder = 0

    method nombre() {
        return "Libro de hechizos"
    }

    method usos() {
        return usos
    }
    
    method usar() {
        usos = usos + 1
    }

    method poder() {
        return poder
    }
}

object collar {
    var usos = 0
    var poder = 0

    method nombre() {
        return "Collar divino"
    }

    method uso() {
        return usos
    }

    method usar() {
        usos = usos + 1
    }

    method poder() {
        return if (rolando.poderBase() > 6) 
        {
            3 + usos
        } else {
            3
        }
    }
}

object armadura {
    var usos = 0
    const poder = 6

    method nombre() {
        return "Armadura de acero valyrio"
    }

    method poder() {
        return poder
    }

    method usar() {
        usos = usos + 1
    }

    method usos() {
        return usos
    }
}