//ALISON GISELLE ESCOTO SAUCEDA - 202210010098
import 'package:flutter/material.dart';
import 'funciones.dart';
import 'resultview.dart';

class MainPage extends StatelessWidget {
  final Funciones fun = Funciones();
  final TextEditingController txtnum1 = TextEditingController();
  final TextEditingController txtnum2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('CALCULADORA'),
        ),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 250,
                child: TextField(
                  controller: txtnum1,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'ESCRIBE UN NÚMERO',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: 250,
                child: TextField(
                  controller: txtnum2,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'ESCRIBE UN NÚMERO',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 170,
                child: ElevatedButton(
                  onPressed: () => _evSuma(context),
                  child: const Text('SUMA'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.yellow,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 170,
                child: ElevatedButton(
                  onPressed: () => _evResta(context),
                  child: const Text('RESTA'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.yellow,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 170,
                child: ElevatedButton(
                  onPressed: () => _evMultiplicacion(context),
                  child: const Text('MULTIPLICACIÓN'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.yellow,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 170,
                child: ElevatedButton(
                  onPressed: () => _evDivision(context),
                  child: const Text('DIVISIÓN'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.yellow,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }

  void _evSuma(BuildContext context) {
    double? x = double.tryParse(txtnum1.text);
    double? y = double.tryParse(txtnum2.text);

    if (x != null && y != null) {
      double res = fun.suma(x, y);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultView(res: res)),
      );
      txtnum1.clear();
      txtnum2.clear();
    } else {
      _showError(context);
    }
  }

  void _evResta(BuildContext context) {
    double? x = double.tryParse(txtnum1.text);
    double? y = double.tryParse(txtnum2.text);

    if (x != null && y != null) {
      double res = fun.resta(x, y);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultView(res: res)),
      );
      txtnum1.clear();
      txtnum2.clear();
    } else {
      _showError(context);
    }
  }

  void _evMultiplicacion(BuildContext context) {
    double? x = double.tryParse(txtnum1.text);
    double? y = double.tryParse(txtnum2.text);

    if (x != null && y != null) {
      double res = fun.multiplicacion(x, y);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultView(res: res)),
      );
      txtnum1.clear();
      txtnum2.clear();
    } else {
      _showError(context);
    }
  }

  void _evDivision(BuildContext context) {
    double? x = double.tryParse(txtnum1.text);
    double? y = double.tryParse(txtnum2.text);

    if (x != null && y != null) {
      try {
        double res = fun.division(x, y);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ResultView(res: res)),
        );
        txtnum1.clear();
        txtnum2.clear();
      } catch (e) {
        _showDivisionError(context);
      }
    } else {
      _showError(context);
    }
  }

  void _showError(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('ERROR'),
          content: const Text('ESCRIBE NÚMEROS VÁLIDOS'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK')
            ),
          ],
        );
      }
    );
  }

  void _showDivisionError(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('ERROR'),
          content: const Text('NO ES POSIBLE DIVIDIR ENTRE CERO'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK')
            ),
          ],
        );
      }
    );
  }
}
