import 'package:islami_app/core/resources/app_constants.dart';
import 'package:islami_app/model/sura_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  static late final SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static void saveMostRecently(List<SuraModel> mostRecently) {
    prefs.setStringList(
      "most_recently",
      mostRecently.map((sura) => sura.suraNameEn).toList(),
    );
  }

  static List<SuraModel> getMostRecently(){
    List<String> suraName = prefs.getStringList("most_recently")?? [];
    List<SuraModel>suras = [];

    for(int i =  0 ; i < suraName.length ; i++){
      for(int j = 0 ; j < AppConstants.suras.length; j++){
        if(suraName[i] == AppConstants.suras[j].suraNameEn){
          suras.add(AppConstants.suras[j]);
          break;
        }
      }
    }

    return suras;
  }
}
