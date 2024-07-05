import configuracion.*
import wollok.game.*
import visuales.*
import niveles.*

object juego {
	
	const iniciado = estadoDelJuego
	
	method iniciar() {
		configuracion.pantallaConfig()
		imagenInicio.mostrar()
		self.reproducirSonidoInicial()
		keyboard.enter().onPressDo{
			configuracion.cargaYInicioDelJuego(visualNivel1,iniciado,gestorDeNiveles.nivelActual())
		}
		game.start()
	}
	method reproducirSonidoInicial(){
		var  sound = game.sound("sonidos/game_start.wav")
		game.schedule(500, { sound.play()} )
		keyboard.enter().onPressDo({sound.stop()})
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
	var estaIniciado = false
	
	method estaIniciado() = estaIniciado
	
	method cambiarValor(nuevoValor){
		estaIniciado = nuevoValor
	}
}
