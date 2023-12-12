import 'package:flutter/services.dart' as the_bundle;
import 'package:next_app/models.dart/sneakers_model.dart';

//this class fetches data from the json file and return...
class Helper {
  //male...
  Future<List<Sneakers>> getMaleSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/men_shoes.json");
    final maleList = sneakersFromJson(data);
    return maleList;
  }

  //female..
  Future<List<Sneakers>> getFemaleSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/men_shoes.json");
    final femaleList = sneakersFromJson(data);
    return femaleList;
  }

  //kid
  Future<List<Sneakers>> getKidsSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/men_shoes.json");
    final kidList = sneakersFromJson(data);
    return kidList;
  }



  //Single male...
  Future<Sneakers> getMaleSneakersById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/men_shoes.json");
    final maleList = sneakersFromJson(data);
    final sneaker = maleList.firstWhere((sneakers) => sneakers.id == id);
    return sneaker;
  }

  //Single Female...
  Future<Sneakers> getFemaleSneakersById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/men_shoes.json");
    final maleList = sneakersFromJson(data);
    final sneaker = maleList.firstWhere((sneakers) => sneakers.id == id);
    return sneaker;
  }

  //Single Kid...
  Future<Sneakers> getKidSneakersById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/men_shoes.json");
    final maleList = sneakersFromJson(data);
    final sneaker = maleList.firstWhere((sneakers) => sneakers.id == id);
    return sneaker;
  }
}
