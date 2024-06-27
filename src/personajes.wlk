import wollok.game.*

/*clases que representaran mis objetos en el juego*/

class Vehiculo {
	
	var property position = null
	
	/*metodo encargado de cargar la visual*/
	method crear(){game.addVisualCharacter(self)} 
	
	/*metodo encargado de cargar la visual*/
	method mover(){}
}

/*creo una clase que sea para los objetos que son movibles*/
class ObjetoMovible inherits Vehiculo {
	method moverA(dir)
}


/*se crea directamente un objeto ya que va a haber un unico jugador*/

object jugador inherits ObjetoMovible {

	var property image = "jugador.png"
	
	/*metodo que me permite moverme*/
	
	override method moverA(dir){
		const proximaPosicion = self.proximaPosicion(dir) 
		if(self.puedeMoverseA(proximaPosicion)){
			position = proximaPosicion
		}
	}
	
	method proximaPosicion(dir) = dir.proximaPosicion(dir) /*evalua la prixma posicion*/
	
	method puedeMoverseA(posicion) = self.noSaleDeLaCarretera(posicion) /*condicion para saber si es posible el movimiento*/
	
	method noSaleDeLaCarretera(posicion) =  posicion.x() > 3 and posicion.x() < 9 /*condicion de limite*/
	
	
	
}

class Enemigo inherits Vehiculo {
	var property image = "enemigo.png"
}

class Combustible inherits Vehiculo {
	var property image = "combustible.png"
}

/*clase para crear instancias de fondos distintos*/
 
class Fondo {
	
	var property image
		
	method position() = game.origin()
	
	method crear(){
		game.addVisual(self)
	}	
}