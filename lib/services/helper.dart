import 'package:flutter/services.dart' as the_bundle;
import 'package:next_app/models.dart/sneakers_model.dart';

//this class fetches data from the json file and return...
class Helper {
  Future<List<Sneakers>> getMaleSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/men_shoes.json");
    final maleList = sneakersFromJson(data);
    return maleList;
  }
}
