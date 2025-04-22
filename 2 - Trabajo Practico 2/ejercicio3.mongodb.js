use("empresa");

// Uso de proyección Recupera los nombres y puestos de todos los
//  empleados, sin mostrar el _id.

db.empresa.find(
    {},
    {_id: 0, nombre: 1, puesto: 1}
);