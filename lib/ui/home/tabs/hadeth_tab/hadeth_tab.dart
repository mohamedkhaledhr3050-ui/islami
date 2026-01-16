import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/ui/home/tabs/hadeth_tab/widgets/hadeth_item.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  PageController controller = PageController(
    viewportFraction: 0.8
  );

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsManager.secondaryColor,
        image: DecorationImage(
          image: AssetImage(AssetsManager.hadethBackground),
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              Image.asset(
                AssetsManager.islamiHeader,
                width: screenWidth * 0.8,
                fit: BoxFit.fitWidth,
              ),
              Expanded(
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                  controller: controller,
                  itemBuilder: (context, index) => HadethItem(
                    index: index,
                    selectedIndex: selectedIndex,
                  ),
                  itemCount: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
