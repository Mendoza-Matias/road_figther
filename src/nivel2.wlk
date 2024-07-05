import niveles.*
import wollok.game.*
import personajes.*

const nivel2 = new Nivel(
		
	fondo = new Fondo(image="carreteranivel2.png"), /*agrego la imagen de la carretera*/
	
	enemigos = [
		new Enemigo(position = game.at(5,2)),
		new Enemigo(position = game.at(7,3)),
		new Enemigo(position = game.at(5,2)),
		new Enemigo(position = game.at(9,8)),
		new Enemigo(position = game.at(7,7)),
		new Enemigo(position = game.at(7,6))
	]
	,combustible=[
		new Combustible(position = game.at(6,7)),
		new Combustible(position = game.at(4,5))
	]
	,
	siguienteNivel = null,
	posInicialJugador = game.at(6,0)
)