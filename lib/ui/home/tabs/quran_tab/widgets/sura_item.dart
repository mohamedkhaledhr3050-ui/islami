import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/model/sura_model.dart';
import 'package:islami_app/ui/sura_details/screen/sura_details.dart';

class SuraItem extends StatelessWidget {
  SuraModel suraModel;

  SuraItem(this.suraModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          SuraDetails.routeName,
          arguments: suraModel,
        );
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(AssetsManager.suraNumber),
              Text(
                suraModel.suraNumber.toString(),
                style: TextStyle(
                  color: ColorsManager.onPrimaryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  suraModel.suraNameEn,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: ColorsManager.onPrimaryColor,
                  ),
                ),
                Text(
                  "${suraModel.suraVerses.toString()} verses",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: ColorsManager.onPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
          Text(
            suraModel.suraNameAr,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: ColorsManager.onPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
