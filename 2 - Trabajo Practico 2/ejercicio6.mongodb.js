use("clientesDB");

db.clientes.insertMany([
    { nombre: "Juan", apellido: "Pérez" },
    { nombre: "Ana", apellido: "Gómez" },
    { nombre: "Luis", apellido: "Pérez" }
]);

// Índices Crea un índice compuesto sobre los campos apellido y 
// nombre en una colección de clientes.
db.clientes.createIndex({
    apellido: 1,
    nombre: 1
});

db.clientes.getIndexes();

