import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapsPinScreen extends StatefulWidget {

  @override
  State createState() => MapsPinState();
}

class MapsPinState extends State<MapsPinScreen> {

  GoogleMapController mapController;
  Position currentLocation;
  var mapToggle = false;
  bool _isMoving = false;

  String reversedLocation = "Loading...";

  void initState() {
    super.initState();
    Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((currLoc) {
        setState(() {
          currentLocation = currLoc;
          mapToggle = true;
        });
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() { mapController = controller; });

    if (mapToggle) {
      _moveMapToCurrentLocation();
    }

    mapController.addListener(_onMapChanged);
  }

  void _onMapChanged() {
    setState(() {
      _extractMapInfo();
    });

    _reverseMapToVenue();
  }

  void _extractMapInfo() {
    _isMoving = mapController.isCameraMoving;
  }

  void _moveMapToCurrentLocation() {
    mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 270.0,
          target: LatLng(currentLocation.latitude, currentLocation.longitude),
          tilt: 30.0,
          zoom: 17.0,
        )
    ));
  }

  void _reverseMapToVenue() {
    if (!_isMoving) {
      LatLng loc = mapController.cameraPosition.target;
      Geolocator().placemarkFromCoordinates(loc.latitude, loc.longitude).then((placeMarks) {
        setState(() {
          reversedLocation = placeMarks[0].name + ", " + placeMarks[0].subLocality + ", " + placeMarks[0].locality;
        });
      });
    } else {
      setState(() {
        reversedLocation = "Loading...";
      });
    }
  }

  @override
  void dispose() {
    mapController.removeListener(_onMapChanged);
    super.dispose();
  }

  void _confirm(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          mapToggle ?
          GoogleMap(
            onMapCreated: _onMapCreated,
            options: GoogleMapOptions(
              trackCameraPosition: true
            ),
          )
          : Text("Loading..."),
          Center(
            child: Icon(Icons.place, color: Colors.indigo, size: 50.0),
          ),
          Positioned(
            top: 30.0,
            left: 15.0,
            right: 15.0,
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(0.0, 2.0),
                    blurRadius: 2.0,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(Icons.place, color: Colors.grey),
                  Expanded(child: Text(reversedLocation, overflow: TextOverflow.ellipsis))
                ]
              ),
            ),
          ),
          Positioned(
            bottom: 15.0,
            left: 15.0,
            right: 15.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: MaterialButton(
                child: Text("Confirm", style: TextStyle(color: Colors.white)),
                color: Colors.cyan,
                height: 50.0,
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          )
        ],
      )
    );
  }
}