import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class Mapa extends StatelessWidget {
  @override
  //
  //
  // Position position =  Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  Widget build(BuildContext context) {
    GoogleMapController.init();

    final size = MediaQueryData
        .fromWindow(ui.window)
        .size;
    final GoogleMapOverlayController controller =
    GoogleMapOverlayController.fromSize(
      width: size.width,
      height: size.height - 72.0,
    );
    final mapController = controller.mapController;
    final Widget mapWidget = GoogleMapOverlay(controller: controller);
    return(
      MaterialApp(
        home: new Scaffold(
          appBar: AppBar(
            title: TextField(
              decoration: InputDecoration.collapsed(hintText: 'Buscar'),
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.my_location),
                onPressed: () {
                  final location = LatLng(-33.4366058, -70.6982819);
                  //final location = _location.getLocation();
                  mapController.markers.clear();
                  mapController.addMarker(MarkerOptions(
                    position: location,
                  ));
                  mapController.animateCamera(
                    CameraUpdate.newLatLngZoom(
                        location, 15.0), //ACA VAN LAS COORDENADAS
                  );
                },
              ),
            ],
          ),
          body: MapsDemo(mapWidget, controller.mapController),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.my_location),
          ),
        ),
        navigatorObservers: <NavigatorObserver>[controller.overlayController],
      )
    );
  }

}

class MapsDemo extends StatelessWidget {
  MapsDemo(this.mapWidget, this.controller);

  final Widget mapWidget;
  final GoogleMapController controller;

  @override
  Widget build(BuildContext context) {
    return Center(child: mapWidget);
  }
}