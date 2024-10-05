//ALISON GISELLE ESCOTO SAUCEDA - 202210010098
class Funciones {
  double suma(double x, double y) {
    return x + y;
  }

  double resta(double x, double y) {
    return x - y;
  }

  double multiplicacion(double x, double y) {
    return x * y;
  }

  double division(double x, double y) {
    if (y == 0) {
      throw Exception('NO ES POSIBLE DIVIDIR ENTRE CERO');
    }
    return x / y;
  }
}
