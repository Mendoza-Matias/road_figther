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
	
	var autoRojo = jugador /*variable en objeto el cual puedo usar en cualquier lugar de mi juego*/	
	var property nivelActualNumero = 1
	var property nivelActual = nivel1
	var property vidas = 3
		
	method autoRojo() = autoRojo
	
	method ultimoNivel() = self.nivelActual().siguienteNivel ()== null
	
	method perderVida(){
		if (vidas == 0) juego.perder() /*si me quedo sin vidas pierdo el juego*/
		else{
			vidas -= 1
			nivelActual.iniciar()
		}
	}	
	
	method cambiarNivelPorPuntos() { // gestor de puntos, si llega a 100 puntos cambia de nivel
        if (autoRojo.puntos() >= 100) {
            self.cargarSiguienteNiVel()
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
	
	method verificarColision(){ /*verifica si el auto rojo choco ya sea a un Enemigo y a un Combustible*/
		game.whenCollideDo(self.autoRojo(),{auto =>
			auto.choco()
		})
	}

}

class Nivel {
	
	/*atributos de mi clase */
	var property enemigos = [] 
	var property combustible = []
	var property siguienteNivel = null
	var property posInicialJugador
	var property fondo
	
	/*encargado de iniciar el juego - es llamado en el archivo juego.wlk */
	method iniciar(){
		self.cargarEscenario()
	}
	
	method cargarEscenario() {
		game.clear()
		self.crearCarretera(fondo)
		configuracion.agregarPersonajes(gestorDeNiveles.autoRojo(),posInicialJugador)
		self.crearTodos(enemigos)
		self.crearTodos(combustible)
		game.onTick(500,"mover autos", {self.moverAutos(enemigos)}) /*cuando se carga el nivel los autos se moveran*/
		game.onTick(500,"mover autos", {self.moverAutos(combustible)})
	}
	
	/*metodos encargados de la logica del escenario y los objetos involucrados*/
	
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