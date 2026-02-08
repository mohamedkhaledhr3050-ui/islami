import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/app_constants.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/model/sura_model.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/widgets/sura_item.dart';

class SuraList extends StatelessWidget {
  List<SuraModel>filteredList;
  void Function(SuraModel) onSuraClicked;
   SuraList({super.key, required this.filteredList, required this.onSuraClicked});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => SuraItem(filteredList[index], onSuraClicked: onSuraClicked,),
      separatorBuilder: (context, index) => Divider(
        color: ColorsManager.onPrimaryColor,
        indent: screenWidth * 0.12,
        endIndent: screenWidth * 0.12,
      ),
      itemCount: filteredList.length,
    );
  }
}
