/*direcciones en las que se pueden realizar los movimientos*/
object derecha {
	method siguientePosicion(pos) = pos.right(1) 	
}
object izquierda{
	method siguientePosicion(pos) = pos.left(1)
}