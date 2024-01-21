import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class FavoritesNotifier extends ChangeNotifier {
  final _favBox = Hive.box('fav_box');

  List<dynamic> _ids = [];
  List<dynamic> _favorites = [];
  List<dynamic> _fav = [];

// Favorites getter.....
  List<dynamic> get ids => _ids;
  // ids setter....
  set ids(List<dynamic> newIds) {
    _ids = newIds;
    notifyListeners();
  }

  // ids getter.....
  List<dynamic> get favorites => _favorites;
  // Favorites setter....
  set favorites(List<dynamic> newFavorites) {
    _favorites = newFavorites;
    notifyListeners();
  }

  getFavorites() {
    final favData = _favBox.keys.map((key) {
      final item = _favBox.get(key);
      return {
        "key": key,
        "id": item["id"],
      };
    }).toList();
    _favorites = favData.toList();
    _ids = _favorites.map((item) => item['id']).toList();
  }

  //Fav getter....
  List<dynamic> get fav => _fav;
  // Fav setter....
  set fav(List<dynamic> newFav) {
    _fav = newFav;
    notifyListeners();
  }

  
//DeleteFav Method.....
  getAllData() {
    final favData = _favBox.keys.map((key) {
      final item = _favBox.get(key);
      return {
        "key": key,
        "id": item['id'],
        "name": item['name'],
        "category": item['category'],
        "price": item['price'],
        "imageUrl": item['imageUrl'],
      };
    }).toList();
    _fav = favData.reversed.toList();
  }
  // DeleteFav Method....
  deleteFav(int key) async {
    await _favBox.delete(key);
  }

  Future<void> createFav(Map<String, dynamic> addFav) async {
    await _favBox.add(addFav);
  }
}
