import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';

class RadioItem extends StatefulWidget {

  const RadioItem({super.key});

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  bool isPlay = false;
  bool isMute = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Container(
      margin: EdgeInsets.only(bottom: size.height * 0.02),
      width: size.width,
      height: size.height * 0.15,
      decoration: BoxDecoration(
        color: ColorsManager.primaryColor,
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(
            isPlay ? AssetsManager.radioWaves : AssetsManager.radioMosque,
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Radio Ibrahim Al-Akdar",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: ColorsManager.secondaryColor,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    isPlay = !isPlay;
                  });
                },
                icon: Icon(
                  isPlay? Icons.pause : Icons.play_arrow,
                  size: 40,
                  color: ColorsManager.secondaryColor,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    isMute = !isMute;
                  });
                },
                icon: Icon(
                  isMute?Icons.volume_off :Icons.volume_up,
                  size: 25,
                  color: ColorsManager.secondaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
