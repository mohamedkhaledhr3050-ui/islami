import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/core/resources/strings_manager.dart';
import 'package:islami_app/ui/home/tabs/hadeth_tab/hadeth_tab.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/quran_tab.dart';
import 'package:islami_app/ui/home/tabs/radio_tab/radio_tab.dart';
import 'package:islami_app/ui/home/tabs/sebha_tab/sebha_tab.dart';
import 'package:islami_app/ui/home/tabs/time_tab/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget>tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: ColorsManager.primaryColor,
        indicatorColor: ColorsManager.secondaryColor.withValues(alpha: 0.6),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        labelTextStyle: WidgetStateTextStyle.resolveWith((states) {
          return TextStyle(
            color: ColorsManager.onPrimaryColor,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          );
        }),
        onDestinationSelected: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        selectedIndex: selectedIndex,

        destinations: [
          NavigationDestination(
            icon: SvgPicture.asset(AssetsManager.quranTab),
            label: StringsManager.quranTab,
            selectedIcon: SvgPicture.asset(AssetsManager.quranSelectedTab),
          ),
          NavigationDestination(
            icon: SvgPicture.asset(AssetsManager.hadethTab),
            label: StringsManager.hadithTab,
            selectedIcon: SvgPicture.asset(AssetsManager.hadethSelectedTab),
          ),
          NavigationDestination(
            icon: SvgPicture.asset(AssetsManager.sebhaTab),
            label: StringsManager.sebhaTab,
            selectedIcon: SvgPicture.asset(AssetsManager.sebhaSelectedTab),
          ),
          NavigationDestination(
            icon: SvgPicture.asset(AssetsManager.radioTab),
            label: StringsManager.radioTab,
            selectedIcon: SvgPicture.asset(AssetsManager.radioSelectedTab),
          ),
          NavigationDestination(
            icon: SvgPicture.asset(AssetsManager.timeTab),
            label: StringsManager.timeTab,
            selectedIcon: SvgPicture.asset(AssetsManager.timeSelectedTab),
          ),
        ],
      ),
      body: tabs[selectedIndex],
    );
  }
}
