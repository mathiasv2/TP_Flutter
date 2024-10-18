import 'package:flutter/material.dart';
import 'dart:math'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RandomImagePage(),
    );
  }
}

class RandomImagePage extends StatefulWidget {
  const RandomImagePage({super.key});

  @override
  _RandomImagePageState createState() => _RandomImagePageState();
}

class _RandomImagePageState extends State<RandomImagePage> {
  int randomNumber = 0; 
  int randomNumber2 = 0;
  int randomNumber3 = 0;
  
  final List<String> imagePaths = [
    'assets/images/bar.png',
    'assets/images/cerise.png',
    'assets/images/cloche.png',
    'assets/images/diamant.png',
    'assets/images/fer-a-cheval.png',
    'assets/images/pasteque.png',
    'assets/images/sept.png',
  ];

  void generateRandomNumber() {
    setState(() {
      randomNumber = Random().nextInt(7) +1; 
      randomNumber2 = Random().nextInt(7) +1; 
      randomNumber3 = Random().nextInt(7) +1; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Casino'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                randomNumber == 0 ? const Text('Appuie sur le bouton pour tirer une image') : Image.asset(imagePaths[randomNumber - 1], height: 70,),
                const SizedBox(width: 10,),
                randomNumber == 0 ? const Text('') : Image.asset(imagePaths[randomNumber2 - 1], height: 70,),
                const SizedBox(width: 10,), 
                randomNumber == 0 ? const Text('') : Image.asset(imagePaths[randomNumber3 - 1], height: 70,),  
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
            onPressed: generateRandomNumber, 
            child: const Text('Jouer'),
            ),
            const SizedBox(height: 20),
            randomNumber != 0 && randomNumber == randomNumber2 && randomNumber2 == randomNumber3 ? const Text("Gagné", style: TextStyle(fontSize: 50))  : const Text("Perdu", style: TextStyle(fontSize: 20)) 
          ],
        ),
      ),
      backgroundColor: randomNumber != 0 && randomNumber == randomNumber2 && randomNumber2 == randomNumber3 ? Colors.amber : Colors.blue,
    );
  }
}
