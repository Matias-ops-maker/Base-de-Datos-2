// Replicación y sharding (teórico) Describe con tus palabras
//  las ventajas de usar un Replica Set y qué beneficios 
// aporta el sharding en una base de datos de alto volumen.

// Replicacion

// Conjunto de servidores que contienen la misma informacion en ellos,
// para que si uno de ellos falla, los demas puedan seguir funcionando.

// Al tener copias de los mismos, si uno falla se puede utilizar otro, ya que, contiene la misma 
// informacion.

// Sharding

// Divide una base de datos muy grande en pequeñas partes, que se almacenan en diferentes servidores
// al dividir las consultas y las operaciones entre varios servidores mejora el tiempo
// de respuesta.

// Son especializadas para apps o servicios con alto flujo.