//Aqui se muestra la informacion del estudiante
class Estudiante {
  String nombre;
  String carrera;
  String semestre;
  String telefono;
  String correo;
  String matricula;
  //Puede o no puede venir
  String? id;

  Estudiante({
    required this.nombre,
    required this.carrera,
    required this.semestre,
    required this.telefono,
    required this.correo,
    required this.matricula,
  });
  //funcion de fabrica que ayuda para meter la informacion decodificada en el json
  //es map para poder iterar en ella
  factory Estudiante.fromMap(Map<String, dynamic> json) => Estudiante(
      nombre: json["nombre"],
      carrera: json["carrera"],
      semestre: json["semestre"],
      telefono: json["telefono"],
      correo: json["correo"],
      matricula: json["matricula"]);
}
