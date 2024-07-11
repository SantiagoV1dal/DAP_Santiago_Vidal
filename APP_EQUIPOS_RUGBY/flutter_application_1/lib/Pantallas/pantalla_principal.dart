import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_1/entities/post.dart';

class HomeScreen extends StatelessWidget {
  final String usuario;
  const HomeScreen({super.key, required this.usuario});

  @override
 Widget build(BuildContext context) {
    List<Post> posts = [
      Post(titulo: "SIC", descripcion: "88 AÑOS", imagenes: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/San_Isidro_Club_logo.svg/1200px-San_Isidro_Club_logo.svg.png", texto: "San Isidro Club (principalmente conocido por sus siglas SIC) es un club deportivo argentino con sede en el distrito de Boulogne Sur Mer del Gran Buenos Aires. El club ha ganado reconocimiento gracias a su equipo de rugby, siendo uno de los clubes más exitosos de Argentina con 27 campeonatos del Torneo de la URBA ganados. El SIC también ha ganado 4 torneos Nacional de Clubes."),
      Post(titulo: "CASI", descripcion: "121 AÑOS", imagenes: "https://urba.org.ar/wp-content/uploads/2019/02/Club-Atletico-San-Isidro.png", texto: "El Club Atlético de San Isidro (más conocido por sus siglas CASI) es un club deportivo argentino con sede en la ciudad de San Isidro en el Gran Buenos Aires. Originalmente establecido como un club de fútbol, ​​San Isidro ha ganado reconocimiento por su equipo de rugby, con un récord de 33 campeonatos del Torneo de la URBA. La selección absoluta compite actualmente en el Top 12, la máxima división del sistema de liga de la Unión de Rugby de Buenos Aires."),
      Post(titulo: "Alumni", descripcion: "73 AÑOS", imagenes: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRmf-HnFXVyB_SJgavDWdByKrPb8BhyucD5A&s", texto: "Asociación Alumni, fundado en 13 de diciembre de 1951, generalmente solo Alumni, es un club de rugby argentino ubicado en Tortuguitas, Gran Buenos Aires. Le dicen Los Rojiblancos. La selección absoluta compite actualmente en el Top 12, la primera división del sistema de liga de la Unión de Rugby de Buenos Aires."),
      Post(titulo: "Belgrano Athletic Club", descripcion: "127 AÑOS", imagenes: "https://urba.org.ar/wp-content/uploads/2024/03/Belgrano-Athletic.png", texto: "Fundado el 17 de agosto de 1896 Belgrano surgió de la fusión del club de los empleados del Ferrocarril de Buenos Aires y Rosario con un club de barrio, el Saint Lawrence. En sus comienzos empezó con la práctica del Futbol, pero con el paso de los años comenzó a incursionar por la práctica de otros deportes. Hoy en día es un club muy importante en la práctica del Rugby y del Hockey. En 2016, tras 48 años, Belgrano logró coronarse campeón del Top 14 de la URBA tras vencer a Hindú, defensor del título."),
    ];

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 82, 82),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hola $usuario",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/login');
              },
              child: const Text("Logout"),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: posts.length * 100,
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return Card(
                    child: ListTile(
                      title: Text(post.titulo),
                      subtitle: Text(post.descripcion),
                      onTap: () {
                        context.push(
                          '/card',
                          extra: {
                            'list': posts,
                            'pressed': index,
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}