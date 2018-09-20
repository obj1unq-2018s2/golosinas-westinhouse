object bombon {
	var peso = 15
	
	method precio() { return 5 }
	method peso() { return peso }
	method mordisco() { peso = peso * 0.8 - 1 }
	method gusto() = "frutilla" 
	method libreGluten() { return true }
}

object alfajor {
	var property peso = 300
	
	method precio() = 12
	method mordisco() { peso = peso * 0.8}
	method gusto() =  "chocolate"
	method libreGluten() = false
}

object caramelo {
	var property peso = 5
	
	method precio() = 1
	method mordisco(){ peso -= 1}
	method gusto() = "frutilla"
	method libreGluten() = true
}

object chupetin {
	var property peso = 7
	
	method precio() = 2
	method mordisco(){ if(peso > 2) peso = peso * 0.9}
	method gusto() = "naranja"
	method libreGluten() = true
}

object oblea {
	var property peso = 250
	
	method precio() = 5
	method mordisco(){
		if(peso > 70) peso = peso * 0.5
		else peso = peso * 0.25
	}
	method gusto() = "vainilla"
	method libreGluten() = false
}

object chocolatin {
	// hay que acordarse de *dos* cosas, el peso inicial y el peso actual
	// el precio se calcula a partir del precio inicial
	// el mordisco afecta al peso actual
	var pesoInicial
	var pesoActual
	
	/* al principio, el peso actual coincide con el inicial */
	method pesoInicial(cuanto) { 
		pesoInicial = cuanto
		pesoActual = cuanto
	}
	method precio() = pesoInicial * 0.5
	method mordisco(){ pesoActual -= 2 }
	method gusto() = "chocolate"
	method libreGluten() = false
}

object golosinaBaniada {
	var golosinaInterior
	var pesoBanio = 4
	
	method baniaA(unaGolosina) { golosinaInterior = unaGolosina }
	method precio() { return  golosinaInterior.precio() }
	method peso() { return golosinaInterior.peso() }
	method mordisco() {
		golosinaInterior.mordisco()
		if (pesoBanio > 0) { pesoBanio -= 2 }
		// otra forma de hacer la cuenta: pesoBanio = (pesoBanio - 2).max(0) 
	}	
	method gusto() { return golosinaInterior.gusto() }
	method libreGluten() { return golosinaInterior.libreGluten()}	
}

object tuttifrutti {
	// como manejar el cambio de sabor ??
	var property peso = 5
	var property esLibreGluten = null
	var property gustos = ["chocolate", "frutilla", "naranja"]
	var gusto = gustos.head()
	
	method gusto() { return gusto}
	method precio(){ if(esLibreGluten) return 7 else return 10}
	method mordisco(){
		peso -= 1
		if(peso > 0){
			gustos.add(gustos.head())
			gustos = gustos.drop(1)
			gusto = gustos.head()
		}
		else gusto = []
	}
}

