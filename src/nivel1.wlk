import niveles.*
import wollok.game.*
import nivel2.*
import personajes.*

const nivel1 = new Nivel(
	enemigos = [
		new Enemigo(position = game.at(9,2)),
		new Enemigo(position = game.at(5,2)),
		new Enemigo(position = game.at(6,2)),
		new Enemigo(position = game.at(7,3))
	]
	,combustible=[
		new Combustible(position = game.at(6,7)),
		new Combustible(position = game.at(5,5))
	]
	,
	siguienteNivel = nivel2,
	
	posInicialJugador = game.at(5,0)
)