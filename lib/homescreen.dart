import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_colors.dart';
import 'package:flutter_application_1/providers/add_provider.dart';
import 'package:flutter_application_1/tabs/hadeth/hadethTab.dart';
import 'package:flutter_application_1/tabs/quran/quranTab.dart';
import 'package:flutter_application_1/tabs/radioTab.dart';
import 'package:flutter_application_1/tabs/sebhaTab.dart';
import 'package:flutter_application_1/tabs/settings/settingTab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  static const String routeName = 'Homescreen';
  Homescreen({super.key});
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) { 
    var provider = Provider.of<AppConfigprovider>(context);
    return Stack(
      children: [
        provider.isDarkMode()?
        Image.asset(
          'assets/images/bg.dark.png',
          fit: BoxFit.fill,
          width: double.infinity,
        )
        :
        Image.asset(
          'assets/images/bg3.png',
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.app_title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(

              canvasColor: Theme.of(context).primaryColor
            ),
            child: BottomNavigationBar( 

              items: [
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/quran1.png')),
                  label: AppLocalizations.of(context)!.quran,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/hadeth.png')),
                  label: AppLocalizations.of(context)!.hadeth,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/sebha.png')),
                  label: AppLocalizations.of(context)!.sebha,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/radio.png')),
                  label: AppLocalizations.of(context)!.radio,
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: 'settings')
              ],
              backgroundColor: provider.isDarkMode()?
              AppColors.primaryDarkColor:
              AppColors.primaryLightColor,
              currentIndex: selectedIndex,
              onTap: (value) {
                selectedIndex = value;
                setState(() {});
              },
            ),
          ),
          body: tabs[selectedIndex],
        )
      ],
    );
  }

  List<Widget> tabs = [
    Qurantab(),
    Hadethtab(),
    Sebhatab(),
    Radiotab(),
    Settingtab()
  ];
}
