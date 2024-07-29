import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_colors.dart';
import 'package:flutter_application_1/providers/add_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class Sebhatab extends StatefulWidget {
  @override
  State<Sebhatab> createState() => _SebhatabState();
}

class _SebhatabState extends State<Sebhatab> {
  int counter = 0;
  List<String> Azkar = [
    "سبحان الله",
    "الحمدالله",
    "الله أكبر",
    "لا اله الا الله "
  ];
  int index = 0;
  double angle = 0;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigprovider>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              provider.isDarkMode()
                  ? Image.asset('assets/images/head1.png')
                  : Image.asset('assets/images/head_light.png'),
              Padding(
                padding: const EdgeInsets.only(top:35.0 , right: 10),
                child: Transform.rotate(
                  angle: angle,
                  child: GestureDetector(
                    onTap: () {
                      OnTap();
                    },
                    child: provider.isDarkMode()
                        ? Image.asset('assets/images/sebha_dark.png')
                        : Image.asset('assets/images/body_light.png'),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 1,
          ),
          Text(
            'عدد التسبيحات',
            style: TextStyle(
              color: provider.isDarkMode()
                  ? AppColors.yellowColor
                  : AppColors.blackColor,
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 81,
            width: 69,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Theme.of(context).primaryColor),
            child: Text(
              '$counter',
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Container(
            alignment: Alignment.center,
            height: 51,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: provider.isDarkMode()
                    ? AppColors.yellowColor
                    : AppColors.primaryLightColor),
            child: Text(
              '${Azkar[index]}',
              style: TextStyle(color: AppColors.blackColor),
            ),
          )
        ],
      ),
    );
  }

  OnTap() {
    counter++;
    if (counter % 33 == 0) {
      index++;
      counter++;
      counter = 0;
    }
    if (index == Azkar.length) {
      index = 0;
    }
    angle += 360 / 4;
    setState(() {});
  }
}
