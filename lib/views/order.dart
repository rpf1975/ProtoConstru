import 'package:flutter/material.dart';
import 'package:flutter_applicatio_prototipo_extremo/classes/item_result.dart';
import 'package:flutter_applicatio_prototipo_extremo/views/cart.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({ Key? key, required this.peso, this.initialQuantity = 0 }) : super(key: key);

  final int peso;
  final int initialQuantity;

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

  int? quantity;

  @override
  Widget build(BuildContext context) {

    if(quantity == null){
      quantity = widget.initialQuantity;
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: 
              [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.arrow_left)),
                          Spacer(),
                          IconButton(onPressed: () => {}, icon: Icon(Icons.favorite_border, color: Colors.red))
                        ],
                      ),
                      Text(
                        "Confirma y agrega tu selección",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        )
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Para cada retiro puede agregar mas de un material Acopiado",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14
                        )
                      ),
                      SizedBox(height: 40),
                      Image(image: AssetImage("assets/madera.png"),),
                      SizedBox(height: 40,),
                      Text(
                        "Restos de Tablones",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        )
                      ),
                      SizedBox(height: 80),
                      Container(
                        margin: EdgeInsets.only(
                          left: 50,
                          right: 50
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              onPressed: () => setState(() => quantity =  (quantity! - 1).clamp(0, 2000000)), 
                              child: Text(
                                "-",
                                style: TextStyle(
                                  fontSize: 28
                                )
                              )
                            ),
                            Text(
                              quantity.toString(),
                              style: TextStyle(
                                fontSize: 28
                              )
                            ),
                            TextButton(
                              onPressed: () => setState(() => quantity = quantity! + 1), 
                              child: Text(
                                "+",
                                style: TextStyle(
                                  fontSize: 28
                                )
                              )
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 80),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Peso acumulado",
                                style: TextStyle(
                                  fontSize: 18
                                )
                              ),
                              Text(
                                "${widget.peso * quantity!} KG",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                )
                              )
                            ],
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (__) => CartPage(items: [ItemResult("Restos de tablones", quantity!, widget.peso * quantity!)]))),
                            child: Container(
                              child: Column(
                                children: [
                                  Image(image: AssetImage("assets/reciclar 1.png")),
                                  SizedBox(height: 10),
                                  Text("Ir al carro ecológico")
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
          ),
        ),
      )
    );
  }
}