import wollok.game.*
import inicio.*

object iniciarJuego {
	var property autosAmarillo = []
	var property autosArcoiris = []
	
	method visualizarObjetos() {
		game.addVisual(carretera)
		game.addVisual(jugador)
		game.addVisual(autoAmarillo)
		game.addVisual(autoArcoiris)
		game.addVisual(vidas)
		game.addVisual(kilometros)
		autoAmarillo.iniciar()
		autoArcoiris.iniciar()
		game.whenCollideDo(jugador, {e => e.quitarVida()})
		kilometros.iniciar()
		
		keyboard.right().onPressDo { jugador.moverDerecha() }
        keyboard.left().onPressDo { jugador.moverIzquierda() }
	}
	
	
     

}

object kilometros {
	
	var kilometros = 0
	
	method text() = kilometros.toString() + " kms"
	method textColor() = paleta.rojo()
	method position() = game.at(13,6)
	
	method pasarKilometros() {
		kilometros = kilometros+1
	}
	method iniciar(){
		kilometros = 0
		game.onTick(100,"kilometros",{self.pasarKilometros()})
	}
	method detener(){
		game.removeTickEvent("kilometros")
	}
}

object paleta {
	const property rojo = "FFFFFF"
}

object vidas {
	var property position = game.at(13,7)
	var property image = "bateriaLLena.png"
	
/*	method image() {
		if (jugador.vida() == 2) {return }
		else if (jugador.vida() == 1) {return }
		else {}
	}
*/	
}

object jugador {
	var property vida = 3
	var property position = game.at(7,1)
	var property kmRecorridos = 0
	
	method image() = "autitoRojo.png"
	
	method centrar() {
		position = game.center()
	}
	
	method quitarVida() {
		if (self.position() == autoAmarillo.position()){
			if(vida >= 1){
				vida -= 1
				if (vida == 0) {
					game.schedule(50,{game.removeVisual(self)})
					game.boardGround("end.png")
				}
			}
		}
	}
	
	method moverIzquierda() {
        if (position.x() > 0) {
            position = game.at(position.x() - 1, position.y())
        }
    }
	
	method moverDerecha() {
        if (position.x() < game.width() - 1) {
            position = game.at(position.x() + 1, position.y())
        }
    }
    
    
}

object autoAmarillo {
	var position = self.posicionInicial()
	
	method image() = "autitoAmarillo.png"
	method position() = position

	method posicionInicial() = game.at(game.height()-1,10)
	
	method iniciar(){
		position = self.posicionInicial()
		game.onTick(200,"moverAuto",{self.mover()})
	}
	
	method mover(){
		position = position.down(1)
		if (position.y() == game.height())
			position = self.posicionInicial()
	}

}

object carretera {
	method position() = game.at(4,0)
	
	method image() = "carretera.png"
}


object autoArcoiris {
	var position = self.posicionInicial()
	
	method image() = "autitoArcoiris.png"
	method position() = position

	method posicionInicial() = game.at(game.height()-3,10)
	
	method iniciar(){
		position = self.posicionInicial()
		game.onTick(250,"moverAuto",{self.mover()})
	}
	
	method mover(){
		position = position.down(1)
		if (position.y() == game.height())
			position = self.posicionInicial()
	}
 	
}