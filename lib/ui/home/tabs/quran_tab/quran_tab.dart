import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/core/resources/strings_manager.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/widgets/most_recently_list.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/widgets/sura_list.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.quranBackground),
          fit: BoxFit.fill,
        ),
      ),

      child: SafeArea(
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
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: ColorsManager.onPrimaryColor
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
                  color: ColorsManager.onPrimaryColor.withValues(alpha: 0.6)
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
            Text(StringsManager.mostRecently, style: TextStyle(
              color: ColorsManager.onPrimaryColor,
              fontWeight: FontWeight.w700,
              fontSize: 16
            ),),
            SizedBox(height: 10),
            SizedBox(
              height: screenHeight * 0.2,
                child: MostRecentlyList()
            ),
            SizedBox(height: 10),
            Text(StringsManager.surasList, style: TextStyle(
                color: ColorsManager.onPrimaryColor,
                fontWeight: FontWeight.w700,
                fontSize: 16
            ),),
            SizedBox(height: 10,),
            Expanded(child: SuraList()),
          ],
        ),
      ),
    );
  }
}
