import 'package:flutter/material.dart';
import 'package:real_estate_app/Model/property_model.dart';

class WhishlistProvider extends ChangeNotifier {
  final List<PropertyModel> _whishlist = [];
  List<PropertyModel> get whishlist => _whishlist;

  void toggleWhishList(PropertyModel property) {
    if (_whishlist.contains(property)) {
      whishlist.remove(property);
    } else {
      whishlist.add(property);
    }
    notifyListeners();
  }

  bool isExist(PropertyModel property) {
    final isExist = _whishlist.contains(property);

    return isExist;
  }
}
