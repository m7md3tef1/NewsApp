import 'package:flutter/cupertino.dart';

class CountryProvider extends ChangeNotifier
{
  String code='Eg';
  onChanged(value)
  {
    code=value;
    notifyListeners();
  }
}