import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/add_provider.dart';
import 'package:flutter_application_1/tabs/hadeth/hadethDetailesScreen.dart';
import 'package:flutter_application_1/homescreen.dart';
import 'package:flutter_application_1/tabs/quran/suraDetailsScreen.dart';
import 'package:flutter_application_1/themData.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigprovider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigprovider>(context);
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      initialRoute: Homescreen.routeName,
      theme: MyThemeDate.lightTheme,
      darkTheme: MyThemeDate.darkTheme,   
      themeMode: provider.appTheme,
      locale: Locale(provider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routes: {
        Homescreen.routeName: (context) => Homescreen(),
        Suradetailsscreen.routeName: (context) => Suradetailsscreen(),
        Hadethdetailesscreen.routeName: (context) => Hadethdetailesscreen(),
      },
    );
  }
}
