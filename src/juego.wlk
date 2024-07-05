import configuracion.*
import wollok.game.*
import visuales.*
import niveles.*
import personajes.*

object juego {
	
	const iniciado = estadoDelJuego
	
	method iniciar() {
		configuracion.pantallaConfig()
		imagenInicio.mostrar()
		self.reproducirSonidoInicial()
		configuracion.configurarTeclas() // Modificacion para que ande la tecla R de reinicio
		keyboard.enter().onPressDo{
			if (estadoDelJuego.estaIniciado()) {
				configuracion.cargaYInicioDelJuego(visualNivel1, iniciado, gestorDeNiveles.nivelActual())
			} else {
				self.reiniciarDesdeCero()
			}
		}
		keyboard.r().onPressDo {
			self.reiniciarDesdeCero()
		}
		
		game.start()
	}
	
	method reiniciarDesdeCero() { // Deberia hacer que al resetear tanto con "enter" o "r", se pueda volver a iniciar el juego con enter
        // Reinicia el estado del juego
        estadoDelJuego.cambiarValor(false)
        jugador.reiniciarVidas()
        jugador.reiniciarPuntos()
        game.clear()
        self.iniciar() // Vuelve a llamar a iniciar para empezar desde cero
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
		imagenGameOver.mostrar()
        estadoDelJuego.cambiarValor(false)
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
