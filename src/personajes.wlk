import wollok.game.*
import niveles.*
import configuracion.*
import visuales.*

/*clases que representaran mis objetos en el juego*/

/*clases que representaran mis objetos en el juego*/

class Vehiculo {
	/*metodo encargado de cargar la visual*/
	method crear(){game.addVisual(self)} 
	
	method remover(){game.removeVisual(self)}
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
	
	var vidas = 3
	var puntos = 0
	var property image = "jugador.png"
	
	method reiniciarVidas (){
		vidas = 3
	}
	
	method reiniciarPuntos(){
		puntos = 0
	}
	
	/*metodos de vidas y puntos*/
	method vidas() = vidas
	
	method cantidadDeVidas() = game.say(self, "vidas " + self.vidas().toString())
	
	method cantidadDePuntos() = game.say(self, "puntos " + self.puntos().toString())
	
	method restarVida(){ vidas = 0.max(self.vidas () - 1)}
	
	method puntos() = puntos
	
	method sumarPunto(){puntos = puntos + 1}
	
	/*metodo que me permite moverme*/
	
	override method moverA(dir){
		const proximaPosicion = self.proximaPosicion(dir) 
		if(self.puedeMoverseA(proximaPosicion)){
			position = proximaPosicion
		}
	}
	
	override method noSaleDeLaCarretera(posicion) =  posicion.x() > 2 and posicion.x() < 10 /*condicion de limite*/
	
}

class Enemigo inherits ObjetoMovible {
	
	var property image = "enemigo.png"
	
	method moverAutomaticamente(dir){
		game.onTick(2000, "mover automaticamente", {
			self.moverA(dir)
		})
	}
	
   override method moverA(dir) {
        const proximaPosicion = self.proximaPosicion(dir)
        if (self.puedeMoverseA(proximaPosicion)) {
            position = proximaPosicion
        }else{
        	
        	position = game.at(0.randomUpTo(7).truncate(0) + 3, 11) /*me da un numero entre 0 y 6 + 3*/
        }
    }
    
   override method noSaleDeLaCarretera(posicion) = posicion.y() > - 2

	method choco(){/*Metodo encargado de quitar puntos del jugador*/
		jugador.restarVida()
		self.remover()
		jugador.cantidadDeVidas()
	}
}

class Combustible inherits ObjetoMovible {
	
	var property image = "combustible.png"
	
	method moverAutomaticamente(dir){
		game.onTick(2000, "mover automaticamente", {
			self.moverA(dir)
		})
	}
	
   override method moverA(dir) {
        const proximaPosicion = self.proximaPosicion(dir)
        if (self.puedeMoverseA(proximaPosicion)) {
            position = proximaPosicion
        }else{
        	position = game.at(0.randomUpTo(7).truncate(0) + 3, 11) /*me da un numero entre 0 y 6 + 3*/
        }
    }
    override method noSaleDeLaCarretera(posicion) = posicion.y() > - 2
    
    method choco(){
		jugador.sumarPunto()
		self.remover()
		jugador.cantidadDePuntos()
	}
}

 /*clase para crear instancias de fondos distintos*/
 
class Fondo {
	
	var property position = game.origin() 
	var property image
			
	method crear(){
		game.addVisual(self)
		self.moverFondo()
	}
	
	method moverFondo(){
		game.onTick(1000, self.identity().toString() , {
			var siguienteY = (position.y() - 1) % 20
			position = game.at(position.x(),siguienteY)
		})
	}
	
	method detener(){
		game.removeTickEvent(self.identity().toString())
	}	
}
