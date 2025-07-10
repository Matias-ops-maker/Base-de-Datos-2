from models import agregar_producto, listar_productos, actualizar_producto, eliminar_producto

def menu():
    while True:
        print("\n--- Sistema de Inventario de Tienda ---")
        print("1. Agregar producto")
        print("2. Listar productos")
        print("3. Actualizar producto")
        print("4. Eliminar producto")
        print("5. Salir")
        opcion = input("Seleccione una opción: ")

        if opcion == "1":
            nombre = input("Nombre del producto: ")
            cantidad = int(input("Cantidad: "))
            precio = float(input("Precio: "))
            agregar_producto(nombre, cantidad, precio)
        elif opcion == "2":
            listar_productos()
        elif opcion == "3":
            id_producto = input("ID del producto a actualizar: ")
            cantidad = input("Nueva cantidad (dejar vacío si no cambia): ")
            precio = input("Nuevo precio (dejar vacío si no cambia): ")
            cantidad = int(cantidad) if cantidad else None
            precio = float(precio) if precio else None
            actualizar_producto(id_producto, cantidad, precio)
        elif opcion == "4":
            id_producto = input("ID del producto a eliminar: ")
            eliminar_producto(id_producto)
        elif opcion == "5":
            print("Saliendo...")
            break
        else:
            print("Opción inválida.")

if __name__ == "__main__":
    menu()