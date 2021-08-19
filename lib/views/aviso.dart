import 'package:flutter/material.dart';

class AvisoPage extends StatelessWidget {
  const AvisoPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Row(
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
                  //IMAGE
                  AssetImage("")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}