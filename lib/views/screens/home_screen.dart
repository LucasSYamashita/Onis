import 'package:flutter/material.dart';
import 'package:onisapp/views/screens/entradas_screen.dart';
import 'package:onisapp/views/screens/pf_screen.dart';
import 'package:onisapp/views/screens/pq_screen.dart';
import 'package:onisapp/views/screens/porcoes_screen.dart';
import 'package:onisapp/views/screens/sobremesa_screen.dart';
import 'package:onisapp/views/screens/bebidas_screen.dart';
import 'package:onisapp/views/screens/chama_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuário nome'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.withOpacity(0.8)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EntradasScreen()),
                      );
                    },
                    child: const Text('Entradas'),
                  ),
                ),
                Container(
                  width: 150,
                  height: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.withOpacity(0.8)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PfScreen()),
                      );
                    },
                    child: const Text('Pratos Frios'),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.withOpacity(0.8)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PqScreen()),
                      );
                    },
                    child: const Text('Pratos Quentes'),
                  ),
                ),
                Container(
                  width: 150,
                  height: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.withOpacity(0.8)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PorcoesScreen()),
                      );
                    },
                    child: const Text('Porções/Extras'),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.withOpacity(0.8)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SobremesaScreen()),
                      );
                    },
                    child: const Text('Sobremesas'),
                  ),
                ),
                Container(
                  width: 150,
                  height: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.withOpacity(0.8)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BebidasScreen()),
                      );
                    },
                    child: const Text('Bebidas'),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.withOpacity(0.8)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CAScreen()),
                      );
                    },
                    child: const Text('Chamar atendente'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
