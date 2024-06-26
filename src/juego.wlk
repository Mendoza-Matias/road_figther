import configuracion.*
import wollok.game.*
import visuales.*
import niveles.*

object juego {
	
	method iniciar() {
		configuracion.pantallaConfig()
		imagenInicio.mostrar()
		game.schedule(5000, {gestorDeNiveles.nivelActual().iniciar()})
		game.start()
	}
	
	method ganar(){
		game.clear()
	}
	
	method perder(){
		
	}
	
}
