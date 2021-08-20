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
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black54,
        selectedItemColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Perfil'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more),
            label: 'Más'
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              left: 10,
              right: 10
            ),
            child: Column(
              children: [
                TopBar(),
                SizedBox(height: 50),
                Text(
                  "¡Reciclemos!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  "Selecciona tu retiro",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Buscar otros disponibles",
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent, width: 1.0),
                      ),
                    ),
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
                    Text(
                      "Seleccionado",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      )
                    ),
                    TextButton(onPressed: () => {}, child: Text("Ver todos >", style: TextStyle(color: Colors.red),))
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
                    elevation: 10,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10
                      ),
                      child: Column(
                        children: [
                          Container(
                            child: Image(image: AssetImage("assets/madera.png"),),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Restos de tablones",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500
                                )
                              ),
                              Text(
                                "$peso Kg",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                )
                              ),
                            ]
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Estado ${Random().nextBool()? 'limpio' : 'casi limpio'}"
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
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
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 6
            )
          ]
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10
        ),
        child: Column(
          children: [
            Image(image: AssetImage(assetImageUrl),),
            SizedBox(height: 10,),
            Text(
              text,
              style: TextStyle(
                color: Colors.black87
              ),
            ),
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