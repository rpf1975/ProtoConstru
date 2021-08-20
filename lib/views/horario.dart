import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_applicatio_prototipo_extremo/views/rate.dart';

class HorarioPage extends StatelessWidget {
  const HorarioPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(onPressed: () => {}, icon: Icon(Icons.arrow_left)),
                  Text("Selecciona el horario de retiro"),
                  IconButton(onPressed: () => {}, icon: Icon(Icons.menu, color: Colors.red))
                ],
              ),
              HorarioButton(text: "Lunes 9am-10am. 20 de Mayo"),
              HorarioButton(text: "Martes 10am-11am. 21 de Mayo"),
              HorarioButton(text: "Miercoles 11am-12am. 22 de Mayo"),
              HorarioButton(text: "Jueves 13pm-14pm. 22 de Mayo"),
              SizedBox(height: 80,),
              TextButton(
                onPressed: () async {
                  showDialog(
                    barrierDismissible: false,
                    context: context, 
                    builder: (context){
                      return AlertDialog(
                        content: Text("Retiro aceptado!"),
                      );
                    }
                  );

                  Future.delayed(Duration(seconds: 2), () => Navigator.of(context).push(MaterialPageRoute(builder: (__) => RatePage())));
                }, 
                child: Text("Proceder con el retiro")
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HorarioButton extends StatelessWidget {
  const HorarioButton({ Key? key, required this.text }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){}, 
      child: Row(
        children: [
          Image(
            image: AssetImage("assets/GroupReloj2.png"),
          ),
          Text(text)
        ],
      )
    );
  }
}