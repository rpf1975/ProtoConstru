import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
        Image(
          image: AssetImage("assets/maquina.png"),
        )
      ],
    );
  }
}