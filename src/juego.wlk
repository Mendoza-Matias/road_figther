import configuracion.*
import wollok.game.*
import visuales.*
import niveles.*

object juego {
	
	method iniciar() {
		configuracion.pantallaConfig()
		imagenInicio.mostrar()
		// game.schedule(5000,{nivel1.mostrar()})
		game.schedule(5000, {
			gestorDeNiveles.nivelActual().iniciar()
		})
		game.start()
	}
	
	/*metodo que me dice que gane*/
	method ganar(){
		game.clear()
	}
	
	/*metodo que me dice que game over , agrega la pantalla*/
	method perder(){
		
	}
	
}
