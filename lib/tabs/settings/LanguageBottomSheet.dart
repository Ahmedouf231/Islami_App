import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/add_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigprovider>(context);
    return Container(
      height: MediaQuery.of(context).size.height * 4,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            InkWell(
                onTap: () {
                  provider.changeLanguage('en');
                },
                child: provider.appLanguage == 'en'
                    ? getSelectedItemWidget(
                        AppLocalizations.of(context)!.english)
                    : getUnSelectedItemWidget(
                        AppLocalizations.of(context)!.english)),
            SizedBox(
              height: 24,
            ),
            InkWell(
                onTap: () {
                  provider.changeLanguage('ar');
                },
                child: provider.appLanguage == 'ar'
                    ? getSelectedItemWidget(
                        AppLocalizations.of(context)!.arabic)
                    : getUnSelectedItemWidget(
                        AppLocalizations.of(context)!.arabic))
          ],
        ),
      ),
    );
  }

  Widget getSelectedItemWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(text ,
      style: TextStyle(
        color: Color(0xffB7935F)
      ),), Icon(Icons.done, color: Color(0xffB7935F))],
    );
  }

  Widget getUnSelectedItemWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text),
      ],
    );
  }
}
