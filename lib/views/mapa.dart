import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapaPage extends StatefulWidget {
  MapaPage({ Key? key }) : super(key: key);

  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  LatLng _initialcameraposition = LatLng(20.5937, 78.9629);
  GoogleMapController? _controller;
  Location _location = Location();


  void _onMapCreated(GoogleMapController _cntlr)
  {
    _controller = _cntlr;
    _location.onLocationChanged.listen((l) { 
      _controller!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude!, l.longitude!),zoom: 15),
          ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: _initialcameraposition),
        mapType: MapType.normal,
        onMapCreated: _onMapCreated,
        myLocationEnabled: true,
        markers: {
          Marker(
            markerId: MarkerId("A"),
            position: LatLng(-36.820133, -73.044388)
          )
        },

      ),
    );
  }
}