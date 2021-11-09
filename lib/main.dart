import 'package:flutter/material.dart';
import 'serviceapi.dart';
import 'textfield_inicio.dart' as mio;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map infoDeApi = {'notaId': 0, 'contenido': '', 'usuarioId': 0};

  final controllerUsuario = TextEditingController();
  final controllerContrasena = TextEditingController();

  //{"notaId":1,"contenido":"texto","usuarioId":2}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Proyecto Parcial II",
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Parcial II"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FractionallySizedBox(
              widthFactor: 0.6,
              child: mio.TextFieldSesion(
                controller: controllerUsuario,
                hintText: "Usuario",
                fontSize: 35,
              ),
            ),
            FractionallySizedBox(
              widthFactor: 0.6,
              child: mio.TextFieldSesion(
                controller: controllerContrasena,
                hintText: "Contraseña",
                fontSize: 35,
                obcureText: true,
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  Map datos = await ServiceAPI.getApiData();
                  setState(() {
                    infoDeApi = datos;
                  });
                },
                child: const Text("Iniciar sesión"),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  String usuario = controllerUsuario.text;
                  String contrasena = controllerContrasena.text;
                  Map datos =
                      await ServiceAPI.postCreateUser(usuario, contrasena);
                },
                child: const Text("Crear usuario"),
              ),
            ),
            Center(
              child: Text(infoDeApi['contenido']),
            ),
          ],
        ),
      ),
    );
  }
}
