import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SetController<T> extends ChangeNotifier {
  Set<T> set = {};

  add(T val) {
    set.add(val);
    notifyListeners();
  }

  toggle(T val) {
    if (contains(val)) {
      remove(val);
    } else {
      add(val);
    }
    notifyListeners();
  }

  remove(T val) {
    set.remove(val);
    notifyListeners();
  }

  bool contains(T val) => set.contains(val);

  List<T> getChecked()=>set.toList();
}

SetController useSetHook<T>() {
  return useListenable(SetController<T>());
}
