import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:glowderm/models/comapny_model.dart';
import 'package:http/http.dart' as http;
class Services{
  String baseURL = 'https://clouce.com';

  Future<bool> isNetworkAvailable() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  Future<CompanyModel> getCompanies(context) async {
    bool isConnected = await isNetworkAvailable();
    if(isConnected){
      print("online");
      return getPostFromAPI(context);
    }else return null;

  }

  Future<CompanyModel> getPostFromAPI(context) async {
    CompanyModel companyModel = await fetchPost(context);
    return companyModel;
  }
  Future<CompanyModel> fetchPost(context) async {
    String _endpoint = '/companies.json';

    dynamic post = await _get(_endpoint,context);
    if (post == null) {
      return null;
    }
    CompanyModel companyModel = new CompanyModel.fromJson(post);
    return companyModel;
  }

  Future _get(String url,context) async {
     String endpoint = '$baseURL$url';
    try {
      final response = await http.get(endpoint);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (err) {
      throw Exception(err);
    }
  }


}
