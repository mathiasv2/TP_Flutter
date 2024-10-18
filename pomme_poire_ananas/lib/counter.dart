import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _Counter();
}

class _Counter extends State<Counter> {
  int _maxNumber = 0;
  final List<String> imagePath = [];

  void _incrementCounter() {
    setState(() {
      _maxNumber++;
      if (isPrime(_maxNumber)) {
        imagePath.add('images/pomme.png');

      } else if (_maxNumber % 2 == 0) {
        imagePath.add('images/poire.png');
      } else {
        imagePath.add('images/ananas.png');
      }
    });
  }

  bool isPrime(int number) {
    if (number <= 1) {
      return false;
    }
    for (int i = 2; i <= number ~/ 2; i++) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$_maxNumber"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: imagePath.length,
          padding: const EdgeInsets.all(8),
          itemBuilder: (context, _maxNumber) {
            return Container(
              color: _maxNumber % 2 == 0 ? Colors.blue : Colors.purple,
              child: Row(
                children: [
                  Text("$_maxNumber"),
                  Image.asset(imagePath[_maxNumber], height: 40),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: "Increment",
        child: const Text("+1"),
      ),
    );
  }
}
