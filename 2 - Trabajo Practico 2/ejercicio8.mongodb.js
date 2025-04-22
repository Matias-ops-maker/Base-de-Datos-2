use("universidad");

// Uso de $lookup Realiza una agregación donde se combinen los
//  datos de alumnos y cursos usando $lookup.
db.alumnos.aggregate([
    {
        $lookup: {
            from: "cursos",
            localField: "id_curso",
            foreignField: "_id",
            as: "cursos_insciptos"
        }
    }
]);