import niveles.*
import wollok.game.*
import personajes.*

const nivel2 = new Nivel(
		
	fondo = new Fondo(image="carreteranivel2.png"), /*agrego la imagen de la carretera*/
	
	enemigos = [
		new Enemigo(position = game.at(0,11)),
		new Enemigo(position = game.at(2,12)),
		new Enemigo(position = game.at(3,11)),
		new Enemigo(position = game.at(1,13)),
		new Enemigo(position = game.at(0,12)),
		new Enemigo(position = game.at(2,14))
	]
	,combustible=[
		new Combustible(position = game.at(6,11)),
		new Combustible(position = game.at(4,13))
	]
	,
	siguienteNivel = null,
	posInicialJugador = game.at(5,1)
)