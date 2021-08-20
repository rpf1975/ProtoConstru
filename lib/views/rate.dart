import 'package:flutter/material.dart';

class RatePage extends StatefulWidget {
  RatePage({ Key? key }) : super(key: key);

  @override
  _RatePageState createState() => _RatePageState();
}

class _RatePageState extends State<RatePage> {
  bool? recycled;
  bool? duration; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(200, 22, 29, 1),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(onPressed: () => setRecycled(false), icon: Icon(Icons.thumb_down), color: Colors.white),
                  Container(
                    child: Image(
                      image: AssetImage("assets/papelera-de-reciclaje 1.png"),
                    ),
                  ),
                  IconButton(onPressed: () => setRecycled(true), icon: Icon(Icons.thumb_up), color: Colors.white),
                ],
              ),
              Text(
                "¿Fue fácil llegar?",
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(onPressed: () => setDuration(false), icon: Icon(Icons.thumb_down), color: Colors.white),
                  Container(
                    child: Icon(Icons.location_pin, size: 100, color: Colors.white)
                  ),
                  IconButton(onPressed: () => setDuration(true), icon: Icon(Icons.thumb_up), color: Colors.white),
                ],
              ),
              TextButton(onPressed: () => Navigator.of(context).popUntil(ModalRoute.withName('/')), child: Text('Volver'), 
                style: ButtonStyle(
                   foregroundColor: MaterialStateProperty.all(Colors.white)
                ),
              )
            ],
          ),
        ),
      )
    );
  }

  void setRecycled(bool like){
    recycled = like;
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Voto recibido!")));
    //toBack();
  }

  void setDuration(bool like){
    duration = like;
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Voto recibido!")));
    //toBack();
  }

  void toBack(){
    print(recycled != null && duration != null);
    if(recycled != null && duration != null){
      Navigator.of(context).popUntil(ModalRoute.withName('/'));
    }
  }
}