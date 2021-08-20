import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_applicatio_prototipo_extremo/views/home.dart';
import 'package:flutter_applicatio_prototipo_extremo/views/widgets/topbar.dart';

class AvisoPage extends StatelessWidget {
  const AvisoPage({ Key? key }) : super(key: key);

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
        child: Container(
          child: SingleChildScrollView(
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
                  Text(
                    "¡Tenemos Nuevos retiros para ti!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Card(
                    elevation: 10,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20
                      ),
                      child: Column(
                        children: [
                          Container(
                            child: Image(
                              image: AssetImage("assets/constructor.png"),
                            ),
                          ),
                          SizedBox(height: 50,),
                          Text(
                            "${Random().nextInt(200) + 10} Potenciales kilos para su retiro",
                            style: TextStyle(
                              fontSize: 17
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 60,),
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
                          child: Container(
                            height: 140,
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 3
                                )
                              ]
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage("assets/reciclar 1.png"),
                                ),
                                SizedBox(height: 20,),
                                Text("Revisar"),
                              ],
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // TODO: Cerrar app
                            SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                          },
                          child: Container(
                            height: 140,
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 3
                                )
                              ]
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage("assets/remove 1.png"),
                                ),
                                SizedBox(height: 20,),
                                Text("Descartar"),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 40,)
                ],
              ),
            ),
          ),
          
        ),
      ),
    );
  }
}