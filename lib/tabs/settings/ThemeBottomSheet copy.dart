import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_colors.dart';
import 'package:flutter_application_1/providers/add_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class Themebottomsheet extends StatefulWidget {
  @override
  State<Themebottomsheet> createState() => _ThemebottomsheetState();
}

class _ThemebottomsheetState extends State<Themebottomsheet> {
  late AppConfigprovider provider;
  @override
  Widget build(BuildContext context) {
     provider = Provider.of<AppConfigprovider>(context);
    return Container(
      height: MediaQuery.of(context).size.height * 4,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            InkWell(
                onTap: () {
                  provider.changeTheme(ThemeMode.light);
                },
                child: provider.isDarkMode()
                    ? getUnSelectedItemWidget(
                        AppLocalizations.of(context)!.light)
                    : getSelectedItemWidget(
                        AppLocalizations.of(context)!.light)),
            SizedBox(
              height: 24,
            ),
            InkWell(
                onTap: () {
                  provider.changeTheme(ThemeMode.dark);
                },
                child: provider.isDarkMode()
                    ? getSelectedItemWidget(AppLocalizations.of(context)!.dark)
                    : getUnSelectedItemWidget(
                        AppLocalizations.of(context)!.dark))
          ],
        ),
      ),
    );
  }

  Widget getSelectedItemWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(color: provider.isDarkMode()?
        AppColors.yellowColor:
        Theme.of(context).primaryColor ),
        ),
        Icon(Icons.done, color: provider.isDarkMode()?
        AppColors.yellowColor:
        Theme.of(context).primaryColor   
        )
      ],
    );
  }

  Widget getUnSelectedItemWidget(String text) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [ Text(text ,
      style: 
      Theme.of(context).textTheme.bodyMedium ,
      textAlign: TextAlign.start, ),
   ] );
  }
}
