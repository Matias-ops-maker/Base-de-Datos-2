// Crea una base de datos llamada empresa.
use("empresa");

// Agrega una colección empleados con 3 documentos que incluyan nombre, edad y puesto.
db.empresa.insertMany([
    {nombre: "Lautaro", edad: 25, puesto: "Desarrollador"},
    {nombre: "Juan", edad: 30, puesto: "Gerente"},
    {nombre: "Lucas", edad: 28, puesto: "Analista"},
]);

// Actualiza la edad de uno de los empleados.
db.empresa.updateOne(
    {nombre: "Lautaro"},
    {$set: {edad: 27}}
);

// Elimina al empleado que tenga el puesto de "pasante".
db.empresa.insertOne(
    {nombre: "Pedro", edad: 22, puesto: "Pasante"}
);

db.empresa.deleteOne(
    {puesto: "Pasante"}
);

// Mostrar base de datos 
db.empresa.find();