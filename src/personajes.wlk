import wollok.game.*

/*clases que representaran mis objetos en el juego*/

class Vehiculo {
	
	var property position = null
	
	/*metodo encargado de cargar la visual*/
	method crear(){game.addVisual(self)} 
	
	/*metodo encargado de cargar la visual*/
	method mover(){}
}

/*va a haber un unico jugador*/
object jugador inherits Vehiculo {

	var property image = "jugador.png"
	
}

class Enemigo inherits Vehiculo {
	var property image = "enemigo.png"
}

class Combustible inherits Vehiculo {
	var property image = "combustible.png"
}