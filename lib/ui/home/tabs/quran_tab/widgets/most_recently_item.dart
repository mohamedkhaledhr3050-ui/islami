import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/model/sura_model.dart';

class MostRecentlyItem extends StatelessWidget {
  SuraModel suraModel;
  MostRecentlyItem({super.key, required this.suraModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: ColorsManager.primaryColor,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(suraModel.suraNameEn, style: TextStyle(
                fontSize: 24,
                fontWeight:FontWeight.w700 ,
                color: ColorsManager.secondaryColor
              ),),
              Text(suraModel.suraNameAr, style: TextStyle(
                fontSize: 24,
                fontWeight:FontWeight.w700 ,
                color: ColorsManager.secondaryColor
              ),),
              Text('${suraModel.suraVerses} Verses', style: TextStyle(
                fontSize: 14,
                fontWeight:FontWeight.w700 ,
                color: ColorsManager.secondaryColor
              ),),
            ],
          ),
          Image.asset(AssetsManager.mostRecent)
        ],
      ),
    );
  }
}
