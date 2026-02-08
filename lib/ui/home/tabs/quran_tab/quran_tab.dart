import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/core/remote/local/prefs_manager.dart';
import 'package:islami_app/core/resources/app_constants.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/core/resources/strings_manager.dart';
import 'package:islami_app/model/sura_model.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/widgets/most_recently_list.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/widgets/sura_list.dart';

class QuranTab extends StatefulWidget {
  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  String searchText = "";
  List<SuraModel>mostRecently = [];

  @override
  void initState() {
    // TODO: implement initState
    filteredSuras = AppConstants.suras;
    mostRecently = PrefsManager.getMostRecently();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.quranBackground),
          fit: BoxFit.fill,
        ),
      ),

      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AssetsManager.islamiHeader,
                  height: screenHeight * 0.18,
                  fit: BoxFit.fitHeight,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                    suraNameSearch();
                  });
                },
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: ColorsManager.onPrimaryColor,
                ),
                decoration: InputDecoration(
                  prefixIconConstraints: BoxConstraints(
                    maxHeight: 55,
                    maxWidth: 55,
                  ),
                  hintText: StringsManager.suraName,
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: ColorsManager.onPrimaryColor.withValues(alpha: 0.6),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: SvgPicture.asset(
                      AssetsManager.quranTab,
                      colorFilter: ColorFilter.mode(
                        ColorsManager.primaryColor,
                        BlendMode.srcIn,
                      ),
                      width: 28,
                      height: 28,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: ColorsManager.primaryColor,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: ColorsManager.primaryColor,
                      width: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              if (searchText.isEmpty) ...[
                Text(
                  StringsManager.mostRecently,
                  style: TextStyle(
                    color: ColorsManager.onPrimaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(height: screenHeight * 0.2, child: MostRecentlyList(mostRecently: mostRecently,)),
                SizedBox(height: 10),
                Text(
                  StringsManager.surasList,
                  style: TextStyle(
                    color: ColorsManager.onPrimaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
              ],

              SuraList(filteredList: filteredSuras, onSuraClicked: (SuraModel sura){
                setState(() {
                  if(mostRecently.contains(sura)){
                    mostRecently.remove(sura);
                    mostRecently.insert(0, sura);
                  }
                  else{
                    mostRecently.insert(0, sura);
                  }

                  PrefsManager.saveMostRecently(mostRecently);
                });
              }),
            ],
          ),
        ),
      ),
    );
  }

  List<SuraModel> filteredSuras = [];

  suraNameSearch() {
    if (searchText.isEmpty) {
      filteredSuras = AppConstants.suras;
    } else {
      filteredSuras = [];
      for (int i = 0; i < AppConstants.suras.length; i++) {
        if (AppConstants.suras[i].suraNameEn.toLowerCase().contains(
              searchText.toLowerCase(),
            ) ||
            AppConstants.suras[i].suraNameAr.contains(searchText)) {
          filteredSuras.add(AppConstants.suras[i]);
        }
      }
    }
  }
}
