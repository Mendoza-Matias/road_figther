import wollok.game.*
import niveles.*
import configuracion.*
import visuales.*

/*clases que representaran mis objetos en el juego*/

/*clases que representaran mis objetos en el juego*/

class Vehiculo {
	/*metodo encargado de cargar la visual*/
	method crear(){game.addVisual(self)} 
}

/*creo una clase que sea para los objetos que son movibles*/
class ObjetoMovible inherits Vehiculo {
	
	var property position = null
	
	method moverA(dir)
	
	method noSaleDeLaCarretera(posicion)
	
	method proximaPosicion(dir) = dir.siguientePosicion(position) /*evalua la proxima posicion , recibe un objeto te tipo direccion*/
	
	method puedeMoverseA(posicion) = self.noSaleDeLaCarretera(posicion) /*condicion para saber si es posible el movimiento*/
}


/*se crea directamente un objeto ya que va a haber un unico jugador*/

object jugador inherits ObjetoMovible {

	var property image = "jugador.png"
	
	/*metodo que me permite moverme*/
	
	override method moverA(dir){
		const proximaPosicion = self.proximaPosicion(dir) 
		if(self.puedeMoverseA(proximaPosicion)){
			position = proximaPosicion
			self.verificarInteracciones() // verifica si el jugador ha interactuado con el combustible o enemigo y agregaria puntos en consecuencia
		}
	}
	
	override method noSaleDeLaCarretera(posicion) =  posicion.x() > 2 and posicion.x() < 10 /*condicion de limite*/
	
	method verificarInteracciones() {
        enemigos.forEach({enemigo => 
            if (self.position() == enemigo.position()) {
                // Lógica de colisión con enemigo
                gestorDeNiveles.perderVida()
            }
        })
        
        combustible.forEach({item =>
            if (self.position() == item.position()) {
                // Lógica de recoger combustible
                item.remover()
                gestorDeNiveles.agregarPuntos(10) // Añade puntos por recoger combustible
            }
        })
    }
}

class Enemigo inherits ObjetoMovible {
	var property image = "enemigo.png"
	
	method moverAutomaticamente(dir){
		game.onTick(5000, "mover automaticamente", {
			self.moverA(dir)
		})
	}
	
   override method moverA(dir) {
        const proximaPosicion = self.proximaPosicion(dir)
        if (self.puedeMoverseA(proximaPosicion)) {
            position = proximaPosicion
        }else{
        	position = game.at(position.x(), 11)
        }
    }
   override method noSaleDeLaCarretera(posicion) = posicion.y() > - 2
}

class Combustible inherits ObjetoMovible {
	
	var property image = "combustible.png"
	
	method moverAutomaticamente(dir){
		game.onTick(5000, "mover automaticamente", {
			self.moverA(dir)
		})
	}
	
   override method moverA(dir) {
        const proximaPosicion = self.proximaPosicion(dir)
        if (self.puedeMoverseA(proximaPosicion)) {
            position = proximaPosicion
        }else{
        	position = game.at(position.x(), 11)
        }
    }
    override method noSaleDeLaCarretera(posicion) = posicion.y() > - 2
}

/*clase para crear instancias de fondos distintos*/
 
class Fondo {
	
	var property image
		
	method position() = game.origin()
	
	method crear(){
		game.addVisual(self)
	}	
}