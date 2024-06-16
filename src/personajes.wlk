import wollok.game.*

object juego {
	
	method iniciar(){
	game.width(10)
    game.height(10)
  	game.cellSize(50)
  	game.title("Juego")
  	game.addVisual(roca)
  	game.addVisualCharacter(heroe)
  	game.addVisual(ogro)
  	game.onTick(2000, "", {})
  	game.whenCollideDo(ogro,{h => h.atacar()})
  	game.onTick(2000, "mover", {ogro.mover()})
  	game.whenCollideDo(heroe ,{r => r.chocada()})
  	game.say(heroe, heroe.aLaCarga())
  	game.boardGround("suelo.jpg")
  	game.start()	
	}
	
}

object roca {
	
	var property position = game.center()
	
	method image() = "roca.png" 
	
	method chocada(){
		game.say(heroe, "Auch me choque")
	}
}

object ogro {
	
	var property position = game.at(9,7)
	method image() = "ogro.png"
	
	method mover () {
		
		const x = 0.randomUpTo(game.width()).truncate(0)
    	const y = 0.randomUpTo(game.height()).truncate(0)
    	
    	position = game.at(x,y)
	}
}

object heroe {
	
	var property position = game.origin()
	var puntos = 0
	
	method image() = "hero.png"
	
	method aLaCarga () = "A la carga"

	method atacar(){
		game.removeVisual(ogro)
		puntos += 1
	}
	


}