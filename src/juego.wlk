import wollok.game.*

object juego {

    var property autosAmarillos = [] // Lista para almacenar múltiples autos amarillos
	var autoAzul
	
    method iniciar() {

        game.addVisualCharacter(autoRojo)
        game.addVisual(camion)

        self.tamanio() // Tamaño del tablero

        game.onTick(500, "movete", {
            autoRojo.act()
            camion.act()
            self.actualizarAutosAmarillos() // Actualiza autos amarillos en cada tick
        })

        game.whenCollideDo(autoRojo, {
            elemento => elemento.saluda()
        })
        
        
        game.whenCollideDo(autoRojo, {
        	elemento => elemento.sumarPunto()
        })

        keyboard.left().onPressDo { autoRojo.moverIzquierda() }
        keyboard.right().onPressDo { autoRojo.moverDerecha() }

        self.generAutosAmarillos()
        self.generarAutosAzules()
    }

    method tamanio() {
        game.width(5)
        game.height(12)
    }

    method generAutosAmarillos() {
        game.schedule(5000, { self.generAutoAmarillo() })
    }

    method generAutoAmarillo() {
        const nuevoAutoAmarillo = new AutoAmarillo()
        game.addVisual(nuevoAutoAmarillo)
        nuevoAutoAmarillo.movete()
        autosAmarillos.add(nuevoAutoAmarillo)
        self.generAutosAmarillos()
    }

    method actualizarAutosAmarillos() {
        autosAmarillos = autosAmarillos.filter { auto =>
            if (0.randomUpTo(10) < 2) { // Probabilidad de desaparecer
                game.removeVisual(auto)
                false
            } else {
                auto.act()
                true
            }
        }
    }
	method generarAutosAzules() {
	game.schedule(2000, {self.generarAutoAzul()})
	}
	
	method generarAutoAzul() {
		autoAzul = new AutoAzul()
		game.addVisual(autoAzul)
		autoAzul.movete()
	}
}

object autoRojo {

    var property position = game.at(2,2)
	
	var puntos = 0
	
    method image() = "auto.png"
	
	method puntos() = puntos 
	
    method act() {
        position = position.up(1)
        if (position.y() >= game.height()) {
            position = position.down(game.height())
            position = position.right(1)
        }
        if (position.x() >= game.width()) {
            position = game.at(0, position.y())
        }
    }

    method moverIzquierda() {
        position = position.left(1) // Movimiento más rápido a la izquierda
        if (position.x() < 0) {
            position = position.right(1)
        }
        
    }

    method moverDerecha() {
        position = position.right(1) // Movimiento más rápido a la derecha
        if (position.x() >= game.width()) {
            position = position.left(1)
        }
    }
    
    method sumarPuntos(){
    	puntos += 1
    	game.say(self, "punto")
    }
    
}

//El auto azul suma puntos en el auto rojo
class AutoAzul{
	
	var property position = game.at(2,2)
	
	method image () = "autoAzul.png"
	
	method act() {
        position = position.up(1)
        if (position.y() >= game.height()) {
            position = position.down(game.height())
            position = position.right(1)
        }
        if (position.x() >= game.width()) {
            position = game.at(0, position.y())
        }
    }
    
     method movete() {
        const x = 0.randomUpTo(game.width()).truncate(0)
        const y = 0.randomUpTo(game.height()).truncate(0)
        position = game.at(x, y)
    } 
    
      method sumarPunto(){
   		autoRojo.sumarPunto()
   }
}

class AutoAmarillo {

    var property position = game.at(1,1)
    var property mensaje = "choco"

    method image() = "autoamarillo.png"

    method act() {
        position = position.up(1)
        if (position.y() >= game.height()) {
            position = position.down(game.height() - 1)
        }
    }

    method movete() {
        const x = 0.randomUpTo(game.width()).truncate(0)
        const y = 0.randomUpTo(game.height()).truncate(0)
        position = game.at(x, y)
    }

    method saluda() {
        game.say(self, mensaje)
    }
}

object camion {

    var property position = game.at(5, 8)

    method image() = "camion.png"

    method act() {
        position = position.up(1)
        if (position.y() >= game.height()) {
            position = position.down(game.height() - 1)
        }
    }
}
