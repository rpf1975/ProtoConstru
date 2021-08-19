import 'package:flutter/material.dart';

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => {}, 
                    icon: Icon(Icons.menu)
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: Colors.red,
                      ),
                      Text("Talcahuano")
                    ],
                  ),
                  //TODO: IMAGE
                  Image(
                    image: AssetImage("assets/maquina.png"),
                  )
                ],
              ),
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
                    Text("200 Potenciales kilos para su retiro")
                  ],
                ),
              ),
              SizedBox(height: 100,),
              Row(
                children: [
                  TextButton(
                    onPressed: () => {},
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
                    onPressed: () => {},
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
              )
            ],
          ),
          
        ),
      ),
    );
  }
}