
import 'package:deliverymaster/assests/consts/fileconsts.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
class MapController extends GetxController{
  static const String _baseUrl = "https://maps.googleapis.com/maps/api/directions/json?";
   final Dio _dio = Dio();

  Future getDirection(LatLng origin,LatLng distination) async{
    final response = await _dio.get(
      _baseUrl,
      queryParameters: {
        "origin":'${origin.latitude},${origin.longitude}',
        "destination":"${distination.latitude},${distination.longitude}",
        "key":"AIzaSyAYc8rq4oc6Nf8DGaBxxMz_o3CBtYLwH-o"
      }
    );

    if(response.statusCode == 200){
      if (kDebugMode) {
        print("distance get of locations");
        var data = response.data;
        print(data);
      }
    }
  }

  void launchGoogleMaps(String address) async {

    String googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=$address';
   // String uri = "https://chat.openai.com";

    launchUrl(Uri.parse(googleMapsUrl));
  }


}