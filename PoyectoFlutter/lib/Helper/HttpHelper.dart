
import 'package:Fitter/models/modelo.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpHelper {
  String urlBase = "http://192.168.43.119:8000";

  Future<List<SolicitudModel>> obtenerClientes() async {
    var response = await http.get(urlBase + "/api/clientes/");
    List clienteJson = jsonDecode(response.body);

    print(clienteJson);

    return clienteJson.map((e) => SolicitudModel.fromJson(e)).toList();
  }
}
