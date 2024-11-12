import 'package:flutter/material.dart';

class DetalleScreen extends StatelessWidget {
  final String item;

  DetalleScreen({required this.item});

  String getImagePath(String item) {
    switch (item) {
      case "Hamburguesa Simple":
        return "assets/images/hamburguesa.jpg";
      case "Hamburguesa Completa":
        return "assets/images/hamburguesa_completa.jpg";
      case "Papas Fritas":
        return "assets/images/papas_fritas.jpg";
      case "Pizza Napolitana":
        return "assets/images/pizza.jpg";
      case "Lomo Completo":
        return "assets/images/lomo.jpg";
      default:
        return "assets/images/default.png";
    }
  }

  // Función para obtener la lista de ingredientes según el producto
  List<String> getIngredients(String item) {
    switch (item) {
      case "Hamburguesa Simple":
        return ["Pan", "Carne", "Lechuga", "Tomate", "Queso"];
      case "Hamburguesa Completa":
        return ["Pan", "Carne", "Lechuga", "Tomate", "Queso", "Bacon", "Huevo"];
      case "Papas Fritas":
        return ["Papas", "Sal", "Aceite"];
      case "Pizza Napolitana":
        return ["Masa", "Salsa de Tomate", "Queso", "Calabresa"];
      case "Lomo Completo":
        return ["Pan", "Lomo", "Lechuga", "Tomate", "Queso", "Mayonesa"];
      default:
        return ["Ingredientes no disponibles"];
    }
  }

  // Función para obtener una breve descripción del producto
  String getDescription(String item) {
    switch (item) {
      case "Hamburguesa Simple":
        return "Una hamburguesa clásica con carne, lechuga, tomate y queso en un pan suave.";
      case "Hamburguesa Completa":
        return "Deliciosa hamburguesa con todos los ingredientes: carne, bacon, huevo y vegetales frescos.";
      case "Papas Fritas":
        return "Crujientes papas fritas doradas y sazonadas a la perfección.";
      case "Pizza Napolitana":
        return "Pizza italiana clásica con salsa de tomate, queso y rodajas de calabresa.";
      case "Lomo Completo":
        return "Sandwich de lomo jugoso con lechuga, tomate, queso y mayonesa en pan fresco.";
      default:
        return "Descripción no disponible para este producto.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detalle")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                getImagePath(item),
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Descripción de $item",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 10),
            // Descripción del producto
            Text(
              getDescription(item),
              style: TextStyle(fontSize: 16, color: Colors.grey[400]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              "Ingredientes:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 10),
            ...getIngredients(item).map((ingredient) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      Icon(Icons.circle, size: 8, color: Colors.blueAccent),
                      SizedBox(width: 8),
                      Text(
                        ingredient,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
