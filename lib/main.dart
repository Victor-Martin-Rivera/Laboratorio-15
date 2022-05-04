import 'package:flutter/material.dart';
import 'package:laboratorio_15/pages/homepage.dart';
import 'package:laboratorio_15/services/estudiantes_services.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Se haran cambios en las peticiones que hagamos
    return MultiProvider(
      providers: [
        //Regresara una lista de EstudiantesServices ya que tiene herencia de ChangeNotifier
        ChangeNotifierProvider(create: (_) => EstudiantesServices())
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Rest Api',
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
