import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_colors.dart';
import 'package:flutter_application_1/providers/add_provider.dart';
import 'package:flutter_application_1/tabs/hadeth/ahadethModel.dart';
import 'package:provider/provider.dart';

class Hadethdetailesscreen extends StatelessWidget {
  static const String routeName = 'HadethScreen';
  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as Ahadethmodel;
    var provider = Provider.of<AppConfigprovider>(context);
    return Stack(children: [
      provider.isDarkMode()
          ? Image.asset(
              'assets/images/bg.dark.png',
              fit: BoxFit.fill,
              width: double.infinity,
            )
          : Image.asset(
              'assets/images/bg3.png',
              fit: BoxFit.fill,
              width: double.infinity,
            ),
      Scaffold(
        appBar: AppBar(
          title: Text(
            model.title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: Card(
            color: provider.isDarkMode()?
                AppColors.primaryDarkColor :
                AppColors.primaryLightColor,
          elevation: 4,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.transparent)),
          margin: EdgeInsets.all(12),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Text(
                  model.contant[index],
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(color: Colors.white),
                );
              },
              itemCount: model.contant.length,
            ),
          ),
        ),
      ),
    ]);
  }
}
