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
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(onPressed: () => {}, icon: Icon(Icons.arrow_left)),
                  Spacer(),
                  IconButton(onPressed: () => {}, icon: Icon(Icons.favorite_border, color: Colors.red))
                ],
              ),
              Text("Confirma y agrega tu selección"),
              Text("Para cada retiro puede agregar mas de un material Acopiado"),
              SizedBox(height: 40),
              Image(image: AssetImage("assets/madera.png"),),
              SizedBox(height: 40,),
              Text("Restos de Tablones"),
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
                      child: Text("-")
                    ),
                    Text(quantity.toString()),
                    TextButton(
                      onPressed: () => setState(() => quantity = quantity! + 1), 
                      child: Text("+")
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
                      Text("Peso acumulado"),
                      Text("${widget.peso * quantity!} KG")
                    ],
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (__) => CartPage(items: [ItemResult("Restos de tablones", quantity!, widget.peso * quantity!)]))),
                    child: Container(
                      child: Column(
                        children: [
                          Image(image: AssetImage("assets/reciclar 1.png")),
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
      )
    );
  }
}