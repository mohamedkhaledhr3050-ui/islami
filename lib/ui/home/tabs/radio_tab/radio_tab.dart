import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/ui/home/tabs/radio_tab/widgets/radio_item.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.radioBackground),
          fit: BoxFit.fitWidth
        )
      ),
      child: DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Image.asset(AssetsManager.islamiHeader, width: size.width * 0.7,),
                Container(
                  margin: EdgeInsets.only(bottom: size.height * 0.02),
                  decoration: BoxDecoration(
                    color: Color(0xb3202020),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: TabBar(
                    labelStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700
                    ),
                    indicator: BoxDecoration(
                      color: ColorsManager.primaryColor,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    labelColor: ColorsManager.secondaryColor,
                    unselectedLabelColor: ColorsManager.onPrimaryColor,
                    tabs: const [
                      Tab(text: "Radio",),
                      Tab(text: "Reciters",)
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      ListView.builder(
                        itemBuilder: (context, index) => RadioItem(),
                        itemCount: 10,
                      ),
                      ListView.builder(
                        itemBuilder: (context, index) => RadioItem(),
                        itemCount: 10,
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
