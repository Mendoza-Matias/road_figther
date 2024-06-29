import wollok.game.*

class Visual {
	
	var property image
	
	method position() = game.at(0,0)
	
	method mostrar(){game.addVisual(self)}
	
	method remover(){game.removeVisual(self)}
	
	}
	

	const imagenInicio = new Visual(image = "presentacion.png") /*creo un objeto de tipo visual para setear la pantalla de inicio*/
	const nivel1 = new Visual(image = "uno.png")