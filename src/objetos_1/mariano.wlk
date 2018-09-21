import golosinas.*

object mariano {
	// para este objeto no damos pistas
	// definimos algunos métodos para que compile el test
	var golosinasCompradas = []
	var filtroPorSabor = []
//	var golosinasCompradasPorMariano = []
//	var golosinasQueMarianoNoCompro = []
//	var golosinasParaComparar = []
	
	method comprar(golosina) { golosinasCompradas.add(golosina)}
	method desechar(golosina){ golosinasCompradas.remove(golosina)}
	
	method golosinas() {

		return golosinasCompradas
	}
	method probarGolosinas() { 	
		golosinasCompradas.map { golosina => golosina.mordisco() }
	}
	method hayGolosinaSinTACC(){
	/*Pregunta si hay al menos una golosina que sea libre de gluten.
	  Si no hay ninguna, el método devolvera false. */
	  
	 	return	golosinasCompradas.any { golosina => golosina.libreGluten()}
	}
	method preciosCuidados(){
	/*Pregunta si todas las golosinas tienen un precio menor o igual a 10.
	  Si alguna sale mas cara, el método devolvera false. */
	  
		return golosinasCompradas.all { golosina => golosina.precio() <= 10}
	}
	method golosinaDeSabor(unSabor){
	/*
	 * Busca cuantas golosinas hay con el sabor especificado y guarda los resultados
	 * en una variable nueva. Luego, se le pregunta a la variable si esta vacía 
	 * o si hay golosinas con ese sabor. Si está vacía, devuelve un mensaje de error. 
	 * Si por el contrario, hay golosinas con ese sabor, devuelve la primera de ellas.
	 */
		filtroPorSabor = golosinasCompradas.filter({ golosina => golosina.gusto() == unSabor})
		if(filtroPorSabor.isEmpty()){
			return "No compré ninguna golosina con ese sabor"
		}
		else { return filtroPorSabor.first() }
	}
	
	method golosinasDeSabor(unSabor){
	/*
	 * Busca cuantas golosinas hay con el sabor especificado y las devuelve.
	 */
	 	return golosinasCompradas.filter({ golosina => golosina.gusto() == unSabor})
	}
	method sabores(){
	/*
	 * Devuelve una lista con todos los sabores de golosinas, sin duplicados.
	 */
		return golosinasCompradas.map{ golosina => golosina.gusto()}.asSet()		
	}
	method golosinaMasCara(){
		return golosinasCompradas.map{ golosina => golosina.precio()}.max()
	}
	method pesoGolosinas(){
		return golosinasCompradas.map{ golosina => golosina.peso()}.sum()
	}
	method golosinasFaltantes(golosinasDeseadas){
	/*
	 * Este método se encarga de filtrar aquellas golosinas que no fueron compradas
	 * por Mariano de la lista de golosinasDeseadas. Para ello, primero obtiene de esa lista,
	 * aquellas golosinas que Mariano compro. Y luego, quita de esa lista estas golosinas,
	 * quedando solamente las que él no adquirió. Este resultado será el mostrado en pantalla
	 */
		//golosinasCompradasPorMariano = golosinasCompradas.filter{ golosina => golosinasDeseadas.contains(golosina)}
		//golosinasQueMarianoNoCompro = golosinasDeseadas.removeAllSuchThat( {golosinaDeseada => golosinasCompradasPorMariano.contains(golosinaDeseada)})
		//return golosinasQueMarianoNoCompro
		
	//	golosinasCompradas = golosinasCompradas.asSet()
	//	golosinasParaComparar = golosinasDeseadas
	//	golosinasParaComparar = golosinasParaComparar.asSet()
		return	golosinasDeseadas.asSet().difference(golosinasCompradas.asSet())
		
	}
	method gustosFaltantes(gustosDeseados){
		return gustosDeseados.asSet().difference(self.sabores())
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

