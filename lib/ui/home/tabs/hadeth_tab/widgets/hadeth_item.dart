import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/model/hadeth_model.dart';
import 'package:islami_app/ui/hadeth_details/screen/hadeth_details.dart';

class HadethItem extends StatefulWidget {
  int index;
  int selectedIndex;

  HadethItem({super.key, required this.index, required this.selectedIndex});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadFile();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadethDetails.routeName , arguments: hadethModel);
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: widget.selectedIndex == widget.index ? 0 : 20,
        ),
        decoration: BoxDecoration(
          color: ColorsManager.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 12, right: 12, left: 12),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          flex: 2,
                          child: Image.asset(
                            AssetsManager.hadethLeftCorner,
                            fit: BoxFit.contain,
                          ),
                        ),

                        Flexible(
                          flex: 4,
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                hadethModel?.title??"",
                                style: TextStyle(
                                  color: ColorsManager.secondaryColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ),
                        ),

                        Flexible(
                          flex: 2,
                          child: Image.asset(
                            AssetsManager.hadethRightCorner,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Image.asset(AssetsManager.hadethCardBackground),
                          SingleChildScrollView(
                            child: Text(
                              hadethModel?.content??"",
                              maxLines: 14,
                              textDirection: TextDirection.rtl,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: "janna LT",
                                fontSize: 18,
                                height: 1.5,
                                fontWeight: FontWeight.w700,
                                color: ColorsManager.secondaryColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Image.asset(
              AssetsManager.hadethMosque,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }

  HadethModel? hadethModel;

  Future<void> loadFile() async {
    String hadeth = await rootBundle.loadString(
      "assets/Hadeeth/h${widget.index + 1}.txt",
    );
    List<String> hadethLines = hadeth.split("\n");
    String hadethTitle = hadethLines[0].trim();
    hadethLines.removeAt(0);
    String hadethContent = hadethLines.join(" ").trim();

    hadethModel = HadethModel(
      title: hadethTitle,
      content: hadethContent,
      number: widget.index + 1,
    );
    setState(() {

    });
  }
}
