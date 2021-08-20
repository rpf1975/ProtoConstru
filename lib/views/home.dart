import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_applicatio_prototipo_extremo/classes/item_result.dart';
import 'package:flutter_applicatio_prototipo_extremo/views/order.dart';
import 'package:flutter_applicatio_prototipo_extremo/views/widgets/topbar.dart';

class HomePage extends StatelessWidget {
  HomePage({ Key? key }) : super(key: key);

  final peso = Random().nextInt(90) + 10;

  final Map<String, ItemResult?>results = {
    "madera": ItemResult("", 0, 0)
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(
            left: 10,
            right: 10
          ),
          child: Column(
            children: [
              TopBar(),
              SizedBox(height: 50),
              Text("¡Reciclemos!"),
              Text("Selecciona tu retiro"),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Buscar otros disponibles"
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CategoryButton(text: "Madera", assetImageUrl: "assets/madera.png"),
                  CategoryButton(text: "Plástico", assetImageUrl: "assets/botella-de-plastico 1.png"),
                  CategoryButton(text: "Cartón", assetImageUrl: "assets/abierto 1.png")
                ]
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Seleccionado"),
                  TextButton(onPressed: () => {}, child: Text("Ver todos >"))
                ],
              ),
              TextButton(
                onPressed: () async {
                  var result = await Navigator.of(context).push(MaterialPageRoute(builder: (__) => OrderPage(peso: peso, initialQuantity: results["madera"]!.quantity)));
                  try{
                    if(result != null){
                      ItemResult itemResult = result as ItemResult;
                      results["madera"] = itemResult;
                    }
                  }catch(Exception){}
                },
                child: Card(
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          child: Image(image: AssetImage("assets/madera.png"),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Restos de tablones"),
                            Text("$peso Kg"), // TODO: Cambiar numero como variable
                          ]
                        ),
                        Text("Estado limpio") // TODO: Limpio, sucio, ...
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    Key? key, required this.text, required this.assetImageUrl,
  }) : super(key: key);

  final String text;
  final String assetImageUrl;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => {},
      child: Container(
        child: Column(
          children: [
            Image(image: AssetImage(assetImageUrl),),
            Text(text),
            TextButton(
              onPressed: () => {}, 
              child: Container(
                child: Image(image: AssetImage("assets/boton.png"),),
              )
            )
          ]
        ),
      ),
    );
  }
}