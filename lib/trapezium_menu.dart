import 'package:flutter/material.dart';

class TrapeziumMenu extends StatefulWidget {
  const TrapeziumMenu({Key? key}) : super(key: key);

  @override
  _TrapeziumMenuState createState() => _TrapeziumMenuState();
}

class _TrapeziumMenuState extends State<TrapeziumMenu> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _textFieldController1 = TextEditingController();
  TextEditingController _textFieldController2 = TextEditingController();
  TextEditingController _textFieldController3 = TextEditingController();
  TextEditingController _textFieldController4 = TextEditingController();

  double _area = 0;
  double _perimeter = 0;

  void _count() {
    setState(() {
      double side1 = double.parse(_textFieldController1.text);
      double side2 = double.parse(_textFieldController2.text);
      double height = double.parse(_textFieldController3.text);
      double hypotenuse = double.parse(_textFieldController4.text);

      _area = 0.5 * (side1 + side2) * height;
      _perimeter = side1 + side2 + (2 * hypotenuse);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trapezium'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Image(image: AssetImage('assets/trapezium.png'),
                height: 350,
                width: 350,
              ),
              TextFormField(
                controller: _textFieldController1,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Side 1',
                ),
              ),
              TextFormField(
                controller: _textFieldController2,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Side 2',
                ),
              ),
              TextFormField(
                controller: _textFieldController3,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Height',
                ),
              ),
              TextFormField(
                controller: _textFieldController4,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Hypotenuse',
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
                'Area: $_area',
                style: const TextStyle(fontSize: 18),
              ),
              SizedBox(height: 5),
              Text(
                  'Perimeter: $_perimeter',
                  style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
