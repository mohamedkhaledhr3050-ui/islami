import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/widgets/most_recently_item.dart';

class MostRecentlyList extends StatelessWidget {
  const MostRecentlyList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => MostRecentlyItem(),
      separatorBuilder: (context, index) => SizedBox(width: 10),
      itemCount:10 ,
      scrollDirection: Axis.horizontal,
    );
  }
}
