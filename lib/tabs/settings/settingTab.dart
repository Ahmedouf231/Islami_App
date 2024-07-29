import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_colors.dart';
import 'package:flutter_application_1/providers/add_provider.dart';
import 'package:flutter_application_1/tabs/settings/LanguageBottomSheet.dart';
import 'package:flutter_application_1/tabs/settings/ThemeBottomSheet%20copy.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class Settingtab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigprovider>(context);
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.theme),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  backgroundColor:provider.isDarkMode()?
                Theme.of(context).primaryColor :
                AppColors.WhiteColor ,
                  context: context,
                  builder: (context) {
                    return Themebottomsheet();
                  });
            },
            child: Container( 

              padding: EdgeInsets.all(15),
              decoration: BoxDecoration( 
                color: AppColors.primaryLightColor,
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: Theme.of(context).primaryColor)),
              width: double.infinity,
              child: Text(provider.isDarkMode()?
                AppLocalizations.of(context)!.dark:
                AppLocalizations.of(context)!.light
                ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Text(AppLocalizations.of(context)!.language),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                backgroundColor:provider.isDarkMode()?
                Theme.of(context).primaryColor :
                AppColors.WhiteColor ,
                  context: context,
                  builder: (context) {
                    return LanguageBottomSheet();
                  });
            },
            child: Container( 
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration( 
             color: AppColors.primaryLightColor,
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: Theme.of(context).primaryColor)),
              width: double.infinity,
              child: Text(provider.appLanguage == 'en'?
              AppLocalizations.of(context)!.english :
              AppLocalizations.of(context)!.arabic
              ),
            ),
          )
        ],
      ),
    );
  }
}
