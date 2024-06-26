import wollok.game.*

/*objeto de configuracion del juego*/
object configuracion {
	
	/*metodo de configuracion basica de la pantalla */
	method pantallaConfig (){
		game.title("road fither")
		game.width(10)
		game.height(10)
		game.cellSize(64)
		game.boardGround("carretera.jpg")
	}
	
}
