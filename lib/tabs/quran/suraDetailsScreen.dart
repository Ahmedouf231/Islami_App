import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/app_colors.dart';
import 'package:flutter_application_1/providers/add_provider.dart';
import 'package:provider/provider.dart';

class Suradetailsscreen extends StatefulWidget {
  static const String routeName = 'suraDetails';
  @override
  State<Suradetailsscreen> createState() => _SuradetailsscreenState();
}

class _SuradetailsscreenState extends State<Suradetailsscreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as ArgsDetalis;
    var provider = Provider.of<AppConfigprovider>(context);
    if (verses.isEmpty) {
      loadfile(args.index);
    }
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
            '${args.name}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: verses.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Card(
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
                        '${verses[index]} (${index + 1})',
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(color: Colors.white),
                      );
                    },
                    itemCount: verses.length,
                  ),
                ),
              ),
      ),
    ]);
  }

  void loadfile(int index) async {
    String sura = await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = sura.split('\n');
    verses = lines;
    setState(() {});
  }
}

class ArgsDetalis {
  String name;
  int index;
  ArgsDetalis({required this.index, required this.name});
}
