import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/model/sura_model.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "sura_details";

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  @override
  Widget build(BuildContext context) {
    SuraModel suraModel =
        ModalRoute.of(context)!.settings.arguments as SuraModel;
    if (suraText.isEmpty) {
      readFile(suraModel.suraNumber);
    }
    return Scaffold(
      backgroundColor: (ColorsManager.secondaryColor),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: ColorsManager.primaryColor),
        title: Text(suraModel.suraNameEn),
        titleTextStyle: TextStyle(
          color: ColorsManager.primaryColor,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: 18),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AssetsManager.quranLeftCorner),
                      Text(
                        suraModel.suraNameAr,
                        style: TextStyle(
                          color: ColorsManager.primaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                      ),
                      Image.asset(AssetsManager.quranRightCorner),
                    ],
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: suraText.isEmpty
                        ? Center(
                            child: CircularProgressIndicator(
                              color: ColorsManager.primaryColor,
                            ),
                          )
                        : SingleChildScrollView(
                          child: Text(
                              suraText,
                              style: TextStyle(
                                color: ColorsManager.primaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                height: 2.5,
                              ),
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                            ),
                        ),
                  ),
                ],
              ),
            ),
          ),
          Image.asset(AssetsManager.quranMosque),
        ],
      ),
    );
  }

  String suraText = "";

  readFile(int suraNumber) async {
    String sura = await rootBundle.loadString("assets/Suras/$suraNumber.txt");
    List<String> suraLines = sura.split("\n");
    for (int i = 0; i < suraLines.length; i++) {
      suraText += suraLines[i];
      suraText += "[${i + 1}]";
    }
    setState(() {});
  }
}
