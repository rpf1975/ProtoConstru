import 'dart:async';
import 'dart:math';
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
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  void _onMapCreated(GoogleMapController _cntlr)
  {
    _controller = _cntlr;
    _location.onLocationChanged.listen((l) { 
      if(markers.length > 3){return;}
      double finalLat = l.latitude! + Random().nextInt(5)/100;
      double finalLong = l.longitude! + Random().nextInt(5)/100;
      if(markers.length <= 0){
        _add(l.latitude!, l.longitude!);
      }
      _add(finalLat, finalLong);
      _controller!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude! + (finalLat- l.latitude!), l.longitude! + (finalLong- l.longitude!)),zoom: 11),
          ),
      );
    });
  }

  void _add(double latitude, double longitude) {
    var markerIdVal = UniqueKey().toString();
    final MarkerId markerId = MarkerId(markerIdVal);

    // creating a new MARKER
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(
        latitude, longitude
      ),
    );

    setState(() {
      // adding a new marker to map
      markers[markerId] = marker;
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
        markers: Set<Marker>.of(markers.values)

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Icon(Icons.arrow_back),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat
    );
  }
}