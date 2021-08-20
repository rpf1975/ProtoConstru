import 'package:flutter/material.dart';

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
              TextButton(
                onPressed: (){}, 
                child: Row(
                  children: [
                    Image(
                      image: AssetImage("assets/"),
                    ),
                    Text("Lunes 9am-10am. 20 de Mayo")
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}