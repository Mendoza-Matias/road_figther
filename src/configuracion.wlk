import wollok.game.*
import personajes.*
import niveles.*
import direcciones.*

/*objeto de configuracion del juego*/
object configuracion {
	
	/*metodo de configuracion basica de la pantalla */
	method pantallaConfig (){
		game.title("road fither")
		game.width(12)
		game.height(10)
		game.cellSize(64)
		game.boardGround("carretera.jpg") /*imagen de inicio del juego*/
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
