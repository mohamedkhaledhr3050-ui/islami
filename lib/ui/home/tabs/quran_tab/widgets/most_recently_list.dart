import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/model/sura_model.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/widgets/most_recently_item.dart';

class MostRecentlyList extends StatelessWidget {
  List<SuraModel> mostRecently;

  MostRecentlyList({super.key, required this.mostRecently});

  @override
  Widget build(BuildContext context) {
    return mostRecently.isEmpty
        ? Center(
            child: Text(
              "No History Found",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: ColorsManager.primaryColor,
              ),
            ),
          )
        : ListView.separated(
            itemBuilder: (context, index) =>
                MostRecentlyItem(suraModel: mostRecently[index]),
            separatorBuilder: (context, index) => SizedBox(width: 10),
            itemCount: mostRecently.length,
            scrollDirection: Axis.horizontal,
          );
  }
}
