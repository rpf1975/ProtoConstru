import 'package:flutter/material.dart';

class RatePage extends StatelessWidget {
  const RatePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(200, 22, 29, 1),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Text(
                "Danos tu opinión",
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              Text(
                "¿Cómo se encontraba el material reciclado?",
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              Row(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.thumb_down), color: Colors.white),
                  Container(
                    child: Image(
                      image: AssetImage(""),
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