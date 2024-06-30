import wollok.game.*
import personajes.*
import niveles.*
import direcciones.*
import visuales.*


/*objeto de configuracion del juego*/

object configuracion {
	
	/*metodo de configuracion basica de la pantalla */
	method pantallaConfig (){
		game.title("road fighter")
		game.width(12)
		game.height(10)
		game.cellSize(64)
		game.boardGround("carretera.jpg") /*imagen de inicio del juego*/
	}
	
	/*configuracion de inicio de juego mediante el enter */
	method cargaYInicioDelJuego(estadoDelJuego){
		if(not estadoDelJuego.estaIniciado()){ //veo el estado de mi juego antes de iniciarlo
				imagenInicio.remover()
				nivel1.mostrar() //Muestra la imagen del nivel actual y pasa al juego
				game.onTick(2000, "cargar nivel", { //Le añado un pequeño corto para que de margen y de esa manera insertar la img del nivel
					gestorDeNiveles.nivelActual().iniciar()
				})
				estadoDelJuego.estaIniciado(true)
			}
	}
	
	/*agrego al objeto juego en el escenario*/
	method agregarPersonajes(posicion) {
		jugador.crear()
		jugador.position(posicion)
		self.configurarTeclas()
	}
	
	/*configuracion de teclas para realizar los movimientos*/
	method configurarTeclas() {
		keyboard.a().onPressDo({jugador.moverA(izquierda)})
		keyboard.d().onPressDo({jugador.moverA(derecha)})
	}
	

}
