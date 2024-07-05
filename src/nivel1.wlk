import niveles.*
import wollok.game.*
import nivel2.*
import personajes.*

const nivel1 = new Nivel(
	
	fondo = new Fondo(image="carretera.png"),
	
	enemigos = [
		new Enemigo(position = game.at(6,11)),
		new Enemigo(position = game.at(5,12)),
		new Enemigo(position = game.at(7,14)),
		new Enemigo(position = game.at(5,13))
	]
	,combustible=[
		new Combustible(position = game.at(4,14)),
		new Combustible(position = game.at(6,12))
	]
	,
	siguienteNivel = nivel2,
	posInicialJugador = game.at(5,1)
)


