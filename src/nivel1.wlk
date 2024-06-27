import niveles.*
import wollok.game.*
import nivel2.*
import personajes.*

const nivel1 = new Nivel(
	
	fondo = new Fondo(image="carretera.png"),
	
	enemigos = [
		new Enemigo(position = game.at(9,2)),
		new Enemigo(position = game.at(5,2)),
		new Enemigo(position = game.at(8,2)),
		new Enemigo(position = game.at(7,2))
	]
	,combustible=[
		new Combustible(position = game.at(6,7)),
		new Combustible(position = game.at(5,5))
	]
	,
	siguienteNivel = nivel2,
	
	posInicialJugador = game.at(5,0)
)

