import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_applicatio_prototipo_extremo/views/home.dart';
import 'package:flutter_applicatio_prototipo_extremo/views/widgets/topbar.dart';

class AvisoPage extends StatelessWidget {
  const AvisoPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(
            left: 20,
            right: 20
          ),
          child: Column(
            children: [
              TopBar(),
              SizedBox(
                height: 30,
              ),
              Text("¡Tenemos Nuevos retiros para ti!"),
              SizedBox(
                height: 30,
              ),
              Card(
                child: Column(
                  children: [
                    Container(
                      // TODO: IMAGE
                      child: Image(
                        image: AssetImage("assets/constructor.png"),
                      ),
                    ),
                    SizedBox(height: 50,),
                    Text("${Random().nextInt(200) + 10} Potenciales kilos para su retiro")
                  ],
                ),
              ),
              SizedBox(height: 100,),
              Container(
                margin: EdgeInsets.only(
                  left: 40,
                  right: 40
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => {
                        Navigator.of(context).push(MaterialPageRoute(builder: (__) => HomePage()))
                      },
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage("assets/reciclar 1.png"),
                          ),
                          SizedBox(height: 20,),
                          Text("Revisar"),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () => {
                        // TODO: Cerrar app
                      },
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage("assets/remove 1.png"),
                          ),
                          SizedBox(height: 20,),
                          Text("Descartar"),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          
        ),
      ),
    );
  }
}