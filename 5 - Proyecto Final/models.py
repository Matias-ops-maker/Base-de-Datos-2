from db import get_db

db = get_db()
productos = db.productos

def agregar_producto(nombre, cantidad, precio):
    producto = {
        "nombre": nombre,
        "cantidad": cantidad,
        "precio": precio
    }
    productos.insert_one(producto)
    print("Producto agregado.")

def listar_productos():
    print("\nInventario actual:")
    for prod in productos.find():
        print(f"ID: {prod['_id']} | Nombre: {prod['nombre']} | Cantidad: {prod['cantidad']} | Precio: {prod['precio']}")

def actualizar_producto(id_producto, cantidad=None, precio=None):
    from bson.objectid import ObjectId
    query = {"_id": ObjectId(id_producto)}
    update = {}
    if cantidad is not None:
        update["cantidad"] = cantidad
    if precio is not None:
        update["precio"] = precio
    if update:
        productos.update_one(query, {"$set": update})
        print("Producto actualizado.")
    else:
        print("Nada para actualizar.")

def eliminar_producto(id_producto):
    from bson.objectid import ObjectId
    productos.delete_one({"_id": ObjectId(id_producto)})
    print("Producto eliminado.")