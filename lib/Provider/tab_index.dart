import 'package:flutter/cupertino.dart';

class GetIndex extends ChangeNotifier{

  int? index =0;

  int get myIndex=>index!;


  saveIndex(int index)
  {
    this.index = index;
    notifyListeners();
  }
}