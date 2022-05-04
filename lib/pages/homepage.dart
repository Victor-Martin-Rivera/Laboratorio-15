import 'package:flutter/material.dart';
import 'package:laboratorio_15/pages/datosEstudiantes.dart';
import 'package:laboratorio_15/pages/loading.dart';
import 'package:laboratorio_15/services/estudiantes_services.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Una vez configurado el MultiProvider en el main ya se puede usar los provider
    final estudianteServices = Provider.of<EstudiantesServices>(context);

    if (estudianteServices.cargandoInformacion) return const Loading();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Laboratorio 15'),
          backgroundColor: Colors.indigo,
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: estudianteServices.listEstudiante.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(children: [
                ListTile(
                  title: Text(estudianteServices.listEstudiante[index].nombre),
                  leading: CircleAvatar(
                    child: Text(estudianteServices.listEstudiante[index].nombre
                        .substring(0, 1)),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DatosEstudiantes(
                              index, estudianteServices.listEstudiante),
                        ));
                  },
                ),
                const Divider()
              ]);
            }));
  }
}
