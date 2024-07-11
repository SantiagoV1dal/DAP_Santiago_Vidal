import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

TextEditingController userController = TextEditingController();
TextEditingController passController = TextEditingController();
List<String> users = ["Rami", "Leandro", "Felo", "Fideo", "Carbo"];
List<String> passwords = ["rami06", "esteban03", "atrevete1", "pacific2", "museum5"];

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
                ),
              TextField(
                controller: userController,
                decoration: const InputDecoration(
                  hintText: 'Usuario',
                  icon: Icon(Icons.person)
                  ),
              ),
              TextField(
                controller: passController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Contraseña',
                  icon: Icon(Icons.key)
                  ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: (){
                  var indexUser = users.indexOf(userController.text);
                  var indexPass = passwords.indexOf(passController.text);
                  if(indexUser == indexPass && indexUser != -1){
                    context.go('/home/${userController.text}');
                  }
                  else if(userController.text == '' && passController.text == ''){
                    SnackBar snackBar = const SnackBar(
                      content: Text("Usuario y Contraseña Sin respuesta"),
                      duration: Duration(seconds: 3),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  else if(userController.text == ''){
                    SnackBar snackBar = const SnackBar(
                      content: Text("Usuario sin respuesta"),
                      duration: Duration(seconds: 3),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  else if(passController.text == ''){
                    SnackBar snackBar = const SnackBar(
                      content: Text("Contraseña sin respuesta"),
                      duration: Duration(seconds: 3),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  else{
                    SnackBar snackBar = const SnackBar(
                      content: Text("Usuario o Contraseña Incorrecta"),
                      duration: Duration(seconds: 3),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                }, 
                child: const Text("Login")
              ),
            ],
          )
        )
    );
  }
}