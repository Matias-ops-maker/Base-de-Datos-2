use("empresa");

// Documentos embebidos Agrega un campo direccion que incluya 
// calle, ciudad y codigo_postal.

db.empresa.updateOne(
    {nombre: "Lautaro"},
    {
        $set: {
            direccion: {
                calle: "Calle Fantasia 123",
                ciudad: "Ciudad Fantasia",
                codigo_postal: "12345"
            }
        }
    }
);

db.empresa.updateOne(
    {nombre: "Juan"},
    {
        $set: {
            direccion: {
                calle: "Calle Real 456",
                ciudad: "Ciudad Real",
                codigo_postal: "67890"
            }
        }
    }
);

db.empresa.updateOne(
    {nombre: "Lucas"},
    {
        $set: {
            direccion: {
                calle: "Calle Fantasia 789",
                ciudad: "Ciudad Fantasia",
                codigo_postal: "34567"
            }
        }
    }
);

// Mostrar base de datos 
db.empresa.find();