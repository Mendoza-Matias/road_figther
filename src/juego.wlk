import wollok.game.*

object juego {
	
	var aroDeFuego
	
	method iniciar(){
		
		game.addVisualCharacter(charlie)
		
		self.tamanio() //Tamanio del tablero
		
		/*game.onCollideDo(charlie,{
			elemento => elemento.chocoCharlie()
		})*/
		
		self.generarAros()
		self.generarMonedas()
	}
	
	method generarAros() {
		game.onTick(1000, "agregar aro", {self.generarAro()}) //Se generan de manera iterativa
	}
	
	method generarMonedas(){
		game.schedule(500, {self.generarMoneda()})
	}
	
	method generarMoneda() {
		const moneda = new Moneda()
		game.addVisual(moneda)
		
	}
	method generarAro() {
		if(aroDeFuego == null){
		 aroDeFuego = new AroDeFuego()
		 game.addVisual(aroDeFuego)
         aroDeFuego.moverse()
		}
	}
	
	method tamanio() {
		game.width(15)
		game.height(8)
	}
	

}

object charlie {
	
	var property position = game.at(1, game.center().y())
	
	var puntos
	//var property position //Asi puedo hacer que charlie se mueva
	
	method aumentarPuntos(){
		puntos += 1
	}
		
	method image () = "charlie.png"
	
	method position (pos){
		position = pos
	}
	
	
	
}

class AroDeFuego{
	
	var property position = game.at(game.width() - 1 , game.center().y()) // Posición inicial en el borde derecho
	
	method chocoCharlie(){
		
	}
	
	method image() = "aro.png"
	
	
	method moverse(){
		if(position.x() > 0){ /*Creo esta condicion para simular un efecto circular de la creación de mi aro*/
			game.removeVisual(self) // Elimina el aro de su posición anterior
        	position = position.left(1) // Actualiza la posición del aro
        	game.addVisual(self) // Agrega el aro en su nueva posición
		}else{
			game.removeVisual(self)
			position =  game.at(game.width() - 1, position.y())
			game.addVisual(self)
		}
		game.schedule(500, { self.moverse() }) // Vuelve a llamar a moverse después de 500ms
	}
	
}

class Moneda {
		
	method chocoCharlie(){
		
	}
	
	method image () = "moneda.png"
	
	method position()= game.at(3,3)
	
	
}