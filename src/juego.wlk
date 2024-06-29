import configuracion.*
import wollok.game.*
import visuales.*
import niveles.*

object juego {
	
	const iniciado = estadoDelJuego
	
	method iniciar() {
		configuracion.pantallaConfig()
		imagenInicio.mostrar()
		// game.schedule(5000,{nivel1.mostrar()})
		keyboard.enter().onPressDo{
			configuracion.cargaYInicioDelJuego(iniciado)
		}
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
 /*Objeto que se encarga de manejar el estado de mi juego*/
object estadoDelJuego{
	var property estaIniciado = false
}
