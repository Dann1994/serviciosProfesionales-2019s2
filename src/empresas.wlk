import profesionales.*
import universidad.*

class Empresa {
	var property profesionales = #{}
	var property honorarioDeReferencia = 0
	const clientes = #{}
	
	method cuantosEstudiaronEn(unaUniversidad) = profesionales.count({ prof => prof.universidad() == unaUniversidad }) 
	method profesionalesCaros() = profesionales.filter({ prof => prof.honorariosPorHora() > honorarioDeReferencia })
	method universidadesFormadoras() = profesionales.map({ prof => prof.universidad() }).asSet()
	method elMasBarato() = profesionales.min({ prof => prof.honorariosPorHora() })
	method esGenteAcotada() = profesionales.all({ prof => prof.provinciasDondePuedeTrabajar().size() <= 3 })
	method puedeSatisfaserA(unSolicitante) = profesionales.any({ prof => unSolicitante.puedeSerAtendida(prof) })
	method profesionalAptoPara(unSolicitante) = profesionales.findOrDefault({ prof => unSolicitante.puedeSerAtendida(prof) }, null)
	method darServicio(unSolicitante) { 
		const profesionalApto = self.profesionalAptoPara(unSolicitante)
		
		if (self.puedeSatisfaserA(unSolicitante)) {
			profesionalApto.cobrarUnImporte(profesionalApto.honorariosPorHora())
			clientes.add(unSolicitante)
		}
	}
	method cantClientes() = clientes.size()
	method tieneA(unCliente) = clientes.contains(unCliente)
}



object asociacionDeLitoral {
	var dineroRecaudado = 0
	
	method recibirDonacion(donacion) { dineroRecaudado += donacion }
}

