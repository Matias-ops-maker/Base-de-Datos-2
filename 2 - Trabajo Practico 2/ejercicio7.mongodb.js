use("universidad");

// Referencias Crea una colección cursos y una colección alumnos. 
// Luego inserta documentos donde los alumnos tengan una lista de id_curso 
db.cursos.insertMany([
    { _id: ObjectId("607c039c58a5b1f1e8a7c451"), nombre: "Matematica", descripcion: "Curso de Matematica" },
    { _id: ObjectId("607c039c58a5b1f1e8a7c452"), nombre: "Fisica", descripcion: "Curso de Fisica" },
    { _id: ObjectId("607c039c58a5b1f1e8a7c453"), nombre: "Quimica", descripcion: "Curso de Quimica" },
    { _id: ObjectId("607c039c58a5b1f1e8a7c454"), nombre: "Historia", descripcion: "Curso de Historia" },
    { _id: ObjectId("607c039c58a5b1f1e8a7c455"), nombre: "Geografia", descripcion: "Curso de Geografia" }
]);

db.alumnos.insertMany([
    {
        nombre: "Lautaro",
        apellido: "Sandoval",
        id_curso: [ObjectId("607c039c58a5b1f1e8a7c451")]
    },
    {
        nombre: "Nicolas",
        apellido: "Garcia",
        id_curso: [ObjectId("607c039c58a5b1f1e8a7c454")]
    },
    {
        nombre: "Juan",
        apellido: "Perez",
        id_curso: [
            ObjectId("607c039c58a5b1f1e8a7c453"),
            ObjectId("607c039c58a5b1f1e8a7c455")
        ]
    }
]);


// Mostrar cursos
db.cursos.find();
// Mostrar alumnos
db.alumnos.find();