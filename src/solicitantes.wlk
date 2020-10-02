import profesionales.*
import universidad.*

class Persona {
	var provincia
	
	method puedeSerAtendida(unProfesional) = unProfesional.provinciasDondePuedeTrabajar().contains(provincia)
}

class Institucion {
	const universidadesReconocidas = #{}
	
	method puedeSerAtendida(unProfesional) = universidadesReconocidas.any({ uni => unProfesional.universidad() == uni })
}
