import 'package:flutter/material.dart';
import 'package:flutter_applicatio_prototipo_extremo/classes/item_result.dart';
import 'package:flutter_applicatio_prototipo_extremo/views/horario.dart';
import 'package:flutter_applicatio_prototipo_extremo/views/mapa.dart';

class CartPage extends StatelessWidget {
  const CartPage({ Key? key, required this.items}) : super(key: key);

  final List<ItemResult> items;

  @override
  Widget build(BuildContext context) {

    final List<Widget> itemsList = [];

    items.forEach((element) { 
      itemsList.add(Container(
        child: Card(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Image(image: AssetImage("assets/madera.png"),),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(element.nombre),
                          IconButton(onPressed: () => {}, icon: Icon(Icons.close))
                        ]
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Cantidad: ${element.quantity}"),
                          Text("KG ${element.peso}")
                        ]
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ));
    });

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.arrow_left)),
                    Text("Tu carro ecológico"),
                    IconButton(onPressed: () => {}, icon: Icon(Icons.menu, color: Colors.red))
                  ],
                ),
                Column(children: itemsList,),
                SizedBox(height: 80),
                TextButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (__) => MapaPage())), child: Text("Solicitar Ubicación")),
                SizedBox(height: 100,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Kilos Totales"),
                    Text(items.fold<int>(0, (previousValue, element) => previousValue += element.peso).toString())
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Cantidad de Items"),
                    Text(items.fold<int>(0, (previousValue, element) => previousValue += element.quantity).toString())
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total: "),
                    Text("${items.fold<int>(0, (previousValue, element) => previousValue += element.peso)} KG")
                  ],
                ),
                TextButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (__) => HorarioPage())), child: Text("Seleccionar horario de retiro")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}