import 'dart:convert';
import 'package:flightradar/repositry/modelclass/Flightmodel.dart';
import 'package:http/http.dart';

import 'api_client.dart';




class Flightapi {
  ApiClient apiClient = ApiClient();


  Future<Flightmodel> getflightmodel() async {
    String trendingpath = 'https://flight-radar1.p.rapidapi.com/aircrafts/list';
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return Flightmodel.fromJson(jsonDecode(response.body));
  }
}