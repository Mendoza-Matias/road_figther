import niveles.*
import wollok.game.*
import personajes.*

const nivel2 = new Nivel(
		
	fondo = new Fondo(image="carreteranivel2.png"), /*agrego la imagen de la carretera*/
	
	  enemigos = [
        new Enemigo(position = game.at(5,2)), // arregle un poco las posiciones para que no esten dispersadas
        new Enemigo(position = game.at(7,3)),
        new Enemigo(position = game.at(5,2)),
        new Enemigo(position = game.at(9,8)),
        new Enemigo(position = game.at(3,7)),
        new Enemigo(position = game.at(7,10))
    ],
    combustible = [
        new Combustible(position = game.at(6,7))
	]
	,
	siguienteNivel = null,
	posInicialJugador = game.at(5,1)
)