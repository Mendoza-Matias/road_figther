import enemigo.* /*clase enemigo */
import wollok.game.* /*importo wollok game*/
import configuracion.*
import visuales.*

object juego {
	/*metodo para iniciar el juego */
	method iniciar(){ 
		configuracion.pantallaConfig()
		imagenInicio.mostrar() /*llamo al objeto del archivo visuales el cual inserta mi imagen de inicio*/
		game.start()
	}
}



