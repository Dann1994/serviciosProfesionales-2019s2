import universidad.*
import empresas.*

class ProfesionalAsociado {
	var property universidad
	
	method provinciasDondePuedeTrabajar() = #{"Entre Ríos", "Corrientes", "Santa Fe"} 
	method honorariosPorHora() = 3000 
	method cobrarUnImporte(unImporte) { asociacionDeLitoral.recibirDonacion(unImporte) }
	method pasarDinero(importe, unProfesonal) {}
}


class ProfesionalVinculado {
	var property universidad
	
	method provinciasDondePuedeTrabajar() = #{universidad.provincia()}
	method honorariosPorHora() = universidad.honorariosPorHora()
	method cobrarUnImporte(unImporte) { universidad.recibirDonaciones(unImporte / 2) }
	method pasarDinero(importe, unProfesonal) {}
}



class ProfesionalLibre {
	var property universidad
	var property provinciasDondePuedeTrabajar = #{}
	var property honorariosPorHora
	var dineroRecaudado = 0
	
	method cobrarUnImporte(unImporte) { dineroRecaudado += unImporte }
	method pasarDinero(unImporte, unProfesional) { unProfesional.cobrarUnImporte(unImporte) }
	method dineroRecaudado() = dineroRecaudado
}

