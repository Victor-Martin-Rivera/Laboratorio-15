//Esta clase notificara cuando haya cambios y cuando haya conexion en la base de datos
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:laboratorio_15/models/estudiantes_models.dart';

//Esta clase se encarga de notificar cuando haya cambios y se haga la conexion con la base de datos
class EstudiantesServices extends ChangeNotifier {
  final String _urlBD = 'primer-rest-api-410b0-default-rtdb.firebaseio.com';

  List<Estudiante> listEstudiante = [];

  bool cargandoInformacion = false;

  //Acceso a los datos
  EstudiantesServices() {
    cargarEstudiantes();
  }

  //Va a ser de forma asincrona debido a que se hacen peticiones a la pagina
  Future<List<Estudiante>> cargarEstudiantes() async {
    cargandoInformacion = true;
    final url = Uri.https(_urlBD, 'persona.json');
    final respuesta = await (http.get(url));

    //Lo ajustamos a un mapa
    final Map<String, dynamic> objeto = json.decode(respuesta.body);

    objeto.forEach((key, value) {
      //Para cada objeto que recorra
      final estudiante = Estudiante.fromMap(value);
      estudiante.id = key;
      //Se asigna los datos a la lista que se creo anteriormente
      listEstudiante.add(estudiante);
    });

    cargandoInformacion = false;
    //Manda a que se escuche el programa si es que hubo un cambio
    notifyListeners();
    return listEstudiante;
  }
}
