import wollok.game.*
import nivel1.*
import nivel2.*
import juego.*
import configuracion.*
import visuales.*
import personajes.*

/*manejar los niveles del juego*/
object gestorDeNiveles {
	
	var property nivelActualNumero = 1
	var property nivelActual = nivel1
	var property vidas = 3
	
	method ultimoNivel() = self.nivelActual().siguienteNivel ()== null
	
	method perderVida(){
		if (vidas == 0) juego.perder() /*si me quedo sin vidas pierdo el juego*/
		else{
			vidas -= 1
			nivelActual.iniciar()
		}
	}	
	
	method cargarSiguienteNiVel(){
		if(!self.ultimoNivel()){
			nivelActual = nivelActual.siguienteNivel()
			nivelActualNumero++
			vidas = 3
			
			nivelActual.iniciar()
		}
		else{
			juego.ganar()
		}
	}
	
	method volverAEmpezar(){
		vidas = 3
		nivelActual = nivel1
		nivelActualNumero = 1
		
		nivelActual.iniciar()
	}
}


class Nivel {
	
	var property enemigos = [] 
	var property combustible = []
	var property siguienteNivel = null
	var property posInicialJugador
	
	
	method iniciar(){
		self.cargarEscenario()
	}
	
	method cargarEscenario() {
		game.clear()
		configuracion.agregarPersonajes()
		carretera.mostrar() /*muestra la carretera*/
		self.crearObjetos()
		self.crearTodos(enemigos)
		self.crearTodos(combustible)
	}
	
	method crearObjetos(){
		jugador.crear()
		jugador.position(posInicialJugador)
	}
	
	method crearTodos(listaDeObjetos){
		listaDeObjetos.forEach({objeto => objeto.crear()})
	}
	
	
	
}