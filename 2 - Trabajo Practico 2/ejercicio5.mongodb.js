use("ventas");

// Agregación Dada una colección ventas con campos producto, 
// cantidad y precio_unitario, calcula el total de ventas por 
// producto usando $group y $sum.

db.productos.insertMany([
    {producto: "Laptop", cantidad: 20, precio_unitario: 1000},
    {producto: "Tablet", cantidad: 30, precio_unitario: 800},
    {producto: "Celular", cantidad: 40, precio_unitario: 1200}
]);

db.productos.aggregate([
    {
        $group: {
            _id: "$producto",
            total_ventas: {
                $sum: { 
                    $multiply: ["$cantidad", "$precio_unitario"]
                }
            }
        }
    }
]);

// Mostrar ventas
db.productos.find();