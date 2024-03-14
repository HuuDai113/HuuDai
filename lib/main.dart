import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Giải phương trình bậc nhất (ax + b = 0).',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, 
      home: LinearEquationSolver(),
    );
  }
}

class LinearEquationSolver extends StatefulWidget {
  @override
  _LinearEquationSolverState createState() => _LinearEquationSolverState();
}

class _LinearEquationSolverState extends State<LinearEquationSolver> {
  TextEditingController _controllerA = TextEditingController();
  TextEditingController _controllerB = TextEditingController();
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giải phương trình bậc nhất (ax + b = 0).'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _controllerA,
              decoration: InputDecoration(labelText: 'Nhập hệ số a'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _controllerB,
              decoration: InputDecoration(labelText: 'Nhập hệ số b'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _solveEquation,
              child: Text('Giải'),
            ),
            SizedBox(height: 20.0),
            Text(
              _result,
              style: TextStyle(fontSize: 18.0, color: Colors.red),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _solveEquation() {
    double a = double.tryParse(_controllerA.text) ?? 0;
    double b = double.tryParse(_controllerB.text) ?? 0;

    if (a == 0) {
      setState(() {
        _result = 'Phương trình này không phải là phương trình bậc nhất.';
      });
    } else {
      double solution = -b / a;
      setState(() {
        _result = 'Nghiệm của phương trình là : x = $solution';
      });
    }
  }
}