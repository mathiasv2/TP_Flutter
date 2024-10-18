
import 'package:calculator/dropdown.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key, required this.title});

  final String title;

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int _counter = 0;
  var _increment = 0;
  final _controller = TextEditingController();
  


  void _incrementCounter() {
    setState(() {
      _counter+= _increment;
    });
  }

   void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Erreur'),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Fermer la modal
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.purple,

        title: const Text("Calculator"),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("$_counter + $_increment = "),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextField(controller: _controller,
            ),
            const DropdownCalcul(),
          ],
        ),
        
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {_increment = int.parse(_controller.text); if(_increment < 1){_showErrorDialog("Ta mere");} else {_incrementCounter();}},
        tooltip: 'Increment $_increment times',
        child: const Text("+")
      ), 
    );
  }
}
