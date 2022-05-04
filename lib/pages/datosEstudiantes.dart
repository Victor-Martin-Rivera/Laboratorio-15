// ignore: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/estudiantes_services.dart';

// ignore: must_be_immutable
class DatosEstudiantes extends StatelessWidget {
  //Estado es como si fuera mi index
  int estado;
  List _datosEstudiante = [];

  DatosEstudiantes(
    //Se inicializa en el constructor para obtener los datos
    this.estado,
    this._datosEstudiante, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final services = Provider.of<EstudiantesServices>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Laboratorio 14'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: [
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    child:
                        //Poner circulo con respecto al nombre del primer subindice
                        Text(services.listEstudiante[estado].nombre
                            .substring(0, 1)),
                  ),
                  //Nombre completo
                  title: Text(
                    services.listEstudiante[estado].nombre,
                    style: const TextStyle(fontSize: 17),
                  ),
                  subtitle: Text(
                    services.listEstudiante[estado].telefono,
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.6), fontSize: 15),
                  ),
                ),
                //Matricula
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Matricula: " + services.listEstudiante[estado].matricula,
                    style: TextStyle(color: Colors.black.withOpacity(0.7)),
                  ),
                ),
                //Carrera
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Carrera: " + services.listEstudiante[estado].carrera,
                    style: TextStyle(color: Colors.black.withOpacity(0.7)),
                  ),
                ),
                //Semestre
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Semestre: " + services.listEstudiante[estado].semestre,
                    style: TextStyle(color: Colors.black.withOpacity(0.7)),
                  ),
                ),
                //Correo
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Correo: " + services.listEstudiante[estado].correo,
                    style: TextStyle(color: Colors.black.withOpacity(0.7)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
