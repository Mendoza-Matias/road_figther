import wollok.game.*
import nivel1.*
import nivel2.*
import juego.*
import configuracion.*
import visuales.*
import personajes.*
import direcciones.*

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
	var property fondo
	
	
	method iniciar(){
		self.cargarEscenario()
	}
	
	method cargarEscenario() {
		game.clear()
		self.crearCarretera(fondo)
		configuracion.agregarPersonajes(posInicialJugador)
		self.crearTodos(enemigos)
		self.crearTodos(combustible)
		game.onTick(500,"mover autos", {self.moverAutos(enemigos)}) /*cuando se carga el nivel los autos se moveran*/
		game.onTick(500,"mover autos", {self.moverAutos(combustible)})
	}
	
	method crearCarretera(fondoActual){
		fondoActual.crear()
	}
	
	
	method crearTodos(listaDeObjetos){
		listaDeObjetos.forEach({objeto => objeto.crear()})
	}
	
	method moverAutos(listaDeObjetos){
		/*recorre la lista de enemigos y los hace moverse*/
		listaDeObjetos.forEach({objeto => objeto.moverAutomaticamente(abajo)})
	}
	
	
	
}