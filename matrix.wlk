object nave {
    const pasajeros = []   // lista mutable - referencia constante

    method cantidadPasajeros() = pasajeros.size()

    method pasajeroConMayorVitalidad() = pasajeros.max({pax => pax.vitalidad()})   // uso max(transformer) para obtener la vitalidad de cada uno, devuelve pasajero

    method pasajeroConMenorVitalidad() = pasajeros.min({pax => pax.vitalidad()})

    method estaEquilibrada() = self.pasajeroConMayorVitalidad().vitalidad() < self.pasajeroConMenorVitalidad().vitalidad()*2

    method estaElElegido() = pasajeros.any({pax => pax.esElElegido()})

    method chocar() {
        pasajeros.forEach({pax => pax.saltar()})  // con forEach le paso el comando a cada obj de la lista 
        pasajeros.clear()                         // vacio la lista 
    }

    method acelerar() {
        self.pasajerosQueNoSonElElegido().forEach({pax => pax.saltar()})
    }

    method pasajerosQueNoSonElElegido() = pasajeros.filter({pax => !pax.esElElegido()})  // filtro los que no son el elegido
}

object neo {
    var energia = 100

    method esElElegido() = true

    method saltar() {
        energia = energia / 2 
    }

    method vitalidad() = energia * 0.1
}

object morfeo {
    var vitalidad = 8
    var estaCansado = false 

    method esElElegido() = false

    method saltar() {
        vitalidad = 0.max(vitalidad - 1)  // me quedo con el mas grande entre 0 y lo que de la vitalidad 
                                          // (vitalidad - 1).max(0)  otra opc que hace lo mismo 
        estaCansado = !estaCansado                                  
    }

    method vitalidad() = vitalidad
}

object trinity {
    
    method esElElegido() = false

    method saltar() {}  // no hace ni devuelve nada 

    method vitalidad() = 0
}

