use("empresa");

// Búsquedas con operadores Consulta todos los empleados cuya
//  edad esté entre 25 y 40 años. Usa operadores relacionales y lógicos.
db.empresa.find({
    $and: [
        {edad: {$gte: 25}},
        {edad: {$lte: 40}}
    ]
});

// Mostrar base de datos 
db.empresa.find();