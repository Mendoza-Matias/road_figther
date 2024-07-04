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
	
	const autoRojo = jugador /*variable en objeto el cual puedo usar en cualquier lugar de mi juego*/	
	var property nivelActualNumero = 1
	var nivelActual = nivel1
	var property vidas = 3
	var cambioDeNivel = false
	
	method cambioDeNivel () = cambioDeNivel	
	
	method siCambioDeNivel (){
		cambioDeNivel = true
	}
	
		
	method nivelActual()= nivelActual
	
	method cambiarDeNivel(nuevoNivel){
		nivelActual = nuevoNivel
	}	
	
	method autoRojo() = autoRojo
	
	method ultimoNivel() = self.nivelActual().siguienteNivel () == null
	
	  method cambiarDeNivel() {
	  	/*condicion que delimita mi cambio */
	  	if(self.autoRojo().puntos() == 2 and not self.ultimoNivel()){
            game.clear() 
            estadoDelJuego.cambiarValor(false)
            self.autoRojo().reiniciarPuntos() //reinicio los puntos para evitar que se genere un bucle en el llamado
            self.autoRojo().reiniciarVidas() //reinicio las vidas para evitar que se genere un bucle en el llamado
            self.cambiarDeNivel(nivel2)
            configuracion.cargaYInicioDelJuego(visualNivel2,estadoDelJuego,nivel2)
    	}
    	else if(self.autoRojo().vidas() == 0)
    	{	
    		game.clear() 
    		estadoDelJuego.cambiarValor(false)
    		configuracion.cargaYInicioDelJuego( imagenGameOver,estadoDelJuego,null)
    		keyboard.enter().onPressDo{
    			juego.iniciar()
    		}
    		
    	}
    	/*{
    		game.clear() 
    		estadoDelJuego.cambiarValor(false)
    		configuracion.cargaYInicioDelJuego( imagenGameOver,estadoDelJuego,null)
    	}*/
    	
    }
	
	
	method verificarColision(){ /*verifica si el auto rojo choco ya sea a un Enemigo y a un Combustible*/
		game.whenCollideDo(self.autoRojo(),{auto =>
			auto.choco()
		})
	}
	
	  method actualizar() { /*Nuevo método para actualizar el estado del juego*/
        self.cambiarDeNivel()
    }

}

class Nivel {
	
	/*atributos de mi clase */
	var property enemigos = [] 
	var property combustible = []
	var property siguienteNivel = null
	var property posInicialJugador
	var property fondo /*fondo de carretera*/
	
	/*encargado de iniciar el juego - es llamado en el archivo juego.wlk */
	method iniciar(){
		 self.cargarEscenario()
		 gestorDeNiveles.verificarColision()
	     game.onTick(1000, "cambiar nivel", {gestorDeNiveles.actualizar()})
	}
	
	method cargarEscenario() {
		game.clear()
		self.crearCarretera(fondo)
		configuracion.agregarPersonajes(gestorDeNiveles.autoRojo(),posInicialJugador)
		self.crearTodos(enemigos)
		self.crearTodos(combustible)
		self.moverAutos(enemigos) /*cuando se carga el nivel los autos se moveran*/
		self.moverAutos(combustible) 
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