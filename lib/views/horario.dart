import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_applicatio_prototipo_extremo/views/rate.dart';

class HorarioPage extends StatefulWidget {
  const HorarioPage({ Key? key }) : super(key: key);

  @override
  _HorarioPageState createState() => _HorarioPageState();
}

class _HorarioPageState extends State<HorarioPage> {
  int? idPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.arrow_left)),
                    Text("Selecciona el horario de retiro"),
                    IconButton(onPressed: () => {}, icon: Icon(Icons.menu, color: Colors.red))
                  ],
                ),
                HorarioButton(
                  text: "Lunes 9am-10am. 20 de Mayo", 
                  onPressed: () => setIdPressed(0), 
                  backgroundColor: idPressed != null && idPressed == 0? Colors.black12 : Colors.white,
                  textColor: Colors.red,
                ),
                HorarioButton(
                  text: "Martes 10am-11am. 21 de Mayo", 
                  onPressed: () => setIdPressed(1), 
                  backgroundColor: idPressed != null && idPressed == 1? Colors.black12 : Colors.white,
                  textColor: Colors.red,
                ),
                HorarioButton(
                  text: "Miercoles 11am-12am. 22 de Mayo", 
                  onPressed: () => setIdPressed(2), 
                  backgroundColor: idPressed != null && idPressed == 2? Colors.black12 : Colors.white,
                  textColor: Colors.red,
                ),
                HorarioButton(
                  text: "Jueves 13pm-14pm. 22 de Mayo", 
                  onPressed: () => setIdPressed(3), 
                  backgroundColor: idPressed != null && idPressed == 3? Colors.black12 : Colors.white,
                  textColor: Colors.red,
                ),
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
      ),
    );
  }

  void setIdPressed(int id){
    setState(() {
      idPressed = id;
    });
  }
}

class HorarioButton extends StatelessWidget {
  const HorarioButton({ Key? key, required this.text, required this.onPressed, required this.backgroundColor, required this.textColor }) : super(key: key);

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed, 
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          children: [
            Image(
              image: AssetImage("assets/GroupReloj2.png"),
            ),
            Text(
              text,
              style: TextStyle(
                color: textColor
              ),
            )
          ],
        ),
      )
    );
  }
}