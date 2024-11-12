import 'package:flutter/material.dart';
import 'detalle_screen.dart';

class PedidoScreen extends StatelessWidget {
  final List<Map<String, dynamic>> pedidos = [
    {"name": "Hamburguesa Simple", "icon": Icons.fastfood},
    {"name": "Hamburguesa Completa", "icon": Icons.lunch_dining},
    {"name": "Papas Fritas", "icon": Icons.local_pizza},
    {"name": "Pizza Calabresa", "icon": Icons.local_pizza},
    {"name": "Lomo Completo", "icon": Icons.restaurant},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Pedidos"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: pedidos.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.grey[900],
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: Icon(
                pedidos[index]["icon"],
                color: Colors.blueAccent,
                size: 30,
              ),
              title: Text(
                pedidos[index]["name"],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey[500],
                size: 18,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetalleScreen(item: pedidos[index]["name"]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
