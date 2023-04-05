import 'package:flutter/material.dart';
import 'dart:math';

class CylinderMenu extends StatefulWidget {
  const CylinderMenu({Key? key}) : super(key: key);

  @override
  _CylinderMenuState createState() => _CylinderMenuState();
}

class _CylinderMenuState extends State<CylinderMenu> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _textFieldController1 = TextEditingController();
  TextEditingController _textFieldController2 = TextEditingController();

  double _volume = 0;
  double _surfaceArea = 0;

  void _count() {
    setState(() {
      double radius = double.parse(_textFieldController1.text);
      double height = double.parse(_textFieldController2.text);

      _volume = pi * pow(radius, 2) * height;
      _surfaceArea = 2 * pi * radius * (radius + height);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cylinder'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Image(image: AssetImage('assets/cylinder.png'),
                height: 350,
                width: 350,
              ),
              TextFormField(
                controller: _textFieldController1,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Radius',
                ),
              ),
              TextFormField(
                controller: _textFieldController2,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Height',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _count();
                  }
                },
                child: const Text('Count'),
              ),
              const SizedBox(height: 16),
              Text(
                'Volume: $_volume',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 5),
              Text(
                'Surface Area: $_surfaceArea',
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
