// ignore_for_file: avoid_print

import 'package:http/http.dart';
import 'dart:convert';

class ServiceAPI {
  static Future<Map> getApiData() async {
    String url = 'https://localhost:44320/api/Notas/1';
    Response response = await get(
      Uri.parse(url),
      headers: {
        'Access-Control-Allow-Origin': '*',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw Exception(
        "Error llamando API - Status " + response.statusCode.toString());
  }

  static Future<Map> postCreateUser(String usuario, String password) async {
    String url = 'https://localhost:44320/api/Usuarios/';
    Response response = await post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"nUsuario": usuario, "contraseña": password}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Hizo algo");
      return jsonDecode(response.body);
    }
    throw Exception(
        "Error llamando API - Status " + response.statusCode.toString());
  }
}
