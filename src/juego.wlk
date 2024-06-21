import wollok.game.*

object juego {
	
		var property autoAmarillo //creo una variable que utilizare luego para inicializar mi objeto
		
	method iniciar(){
		
		game.addVisualCharacter(autoRojo)
		game.addVisual(camion)
		
		self.tamanio() //Tamanio del tablero
		
		game.onTick(100, "movete", {
			autoRojo.act()
			camion.act()
			fondo.act()
		})
		
		keyboard.left().onPressDo{autoRojo.moverIzquierda()}
		keyboard.right().onPressDo{autoRojo.moverDerecha()}
		
		self.generAutosAmarillos()
	}
	
	method tamanio(){
		game.width(15)
		game.height(15)
	}
	
	method generAutosAmarillos() {
		game.schedule(5000, {self.generAutoAmarillo()})
	}
	
	method generAutoAmarillo() {
		if(autoAmarillo != null){
			game.removeVisual(autoAmarillo)
		}
		autoAmarillo = new AutoAmarillo()
		game.addVisual(autoAmarillo)
		autoAmarillo.movete()
		self.generAutosAmarillos()
	}
	
	method moverAutoAmarillo(){
		game.onTick(100, "movete", {autoAmarillo.act()})
	}
	
	
	
	

}


object autoRojo {
	
	var property position = game.at(7,7)

    method image() = "auto.png"

    method act() {
        position = position.up(1)
        if (position.y() >= game.width()) { //Condicion para realizar una repeticion sobre la salida del auto
              position = position.down(game.height() - 1)
        }
    }
    
        method moverIzquierda() {
        position = position.left(2) // Movimiento más rápido a la izquierda
        if (position.x() < 0) {
            position = position.right(1)
        }
    }

    method moverDerecha() {
        position = position.right(2) // Movimiento más rápido a la derecha
        if (position.x() >= game.width()) {
            position = position.left(1)
        }
    }
    
}

class AutoAmarillo {
	
	var property position = game.at(7,7)
	
	method image() = "autoamarillo.png"
	
	 method act() {
        position = position.up(1)
        if (position.y() >= game.width()) { //Condicion para realizar una repeticion sobre la salida del auto
              position = position.down(game.height() - 1)
        }
    }
	
	method movete(){
		const x = 0.randomUpTo(game.width()).truncate(0)
    	const y = 0.randomUpTo(game.height()).truncate(0)
    	position = game.at(x,y) 
	}
}

object fondo {
    
    var property position = game.origin()

    method image() = "fondo.png"

    method act() {
        position = position.up(1)
        if (position.y() >= game.height()) {
            position = position.down(game.height() - 1)
        }
    }
}

object camion {
	
	var property position = game.at(5,8)

    method image() = "camion.png"

    method act() {
        position = position.up(1)
        if (position.y() >= game.width()) { //Condicion para realizar una repeticion sobre la salida del auto
              position = position.down(game.height() - 1)
        }
    }
    
}



