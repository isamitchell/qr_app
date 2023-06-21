import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  int _selectedMenuOpt =
      0; // almacena el valor de la opcion elegida por usuario que sera modificada mediante el get y set

  int get selectedMenuOpt {
    return _selectedMenuOpt;
  }

  set selectedMenuOpt(int i) {
    _selectedMenuOpt = i;
    notifyListeners();
  }
}

//*Para notificar a los widgets de los cambios se debe usar el notifier, por lo tanto la clase debe extender del changeNOtifier