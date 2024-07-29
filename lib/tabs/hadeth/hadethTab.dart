import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/tabs/hadeth/ahadethModel.dart';
import 'package:flutter_application_1/tabs/hadeth/hadethDetailesScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Hadethtab extends StatefulWidget {
  @override
  State<Hadethtab> createState() => _HadethtabState();
}
class _HadethtabState extends State<Hadethtab> {
  List<Ahadethmodel> allAhadeth = [];
  @override
  Widget build(BuildContext context) {
    if(allAhadeth.isEmpty){
          loadHadethfile();
    }
    return Column(children: [
      Expanded(
        child: Image.asset(
          'assets/images/h1.png',
        ),
      ),
      Divider(
        thickness: 3,
        color: Theme.of(context).primaryColor,
      ),
      Text(
       AppLocalizations.of(context)!.hadeth_name,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      Divider(
        thickness: 3,
        color: Theme.of(context).primaryColor,
      ),
      Expanded(
          flex: 2,
          child: ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 1,
                  endIndent: 10,
                  indent: 10,
                  color: Theme.of(context).primaryColor,
                );
              },
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, Hadethdetailesscreen.routeName , 
                          arguments: allAhadeth[index] );
                    },
                    child: Text(
                      allAhadeth[index].title,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ));
              },
              itemCount: allAhadeth.length))
    ]);
  }

  loadHadethfile() async {
    String hadethContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> hadethList = hadethContent.split('#\r\n');
    for (int i = 0; i < hadethList.length; i++) {
      List<String> hadethLines = hadethList[i].split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      Ahadethmodel ahadethmodel =
          Ahadethmodel(contant: hadethLines, title: title);
      allAhadeth.add(ahadethmodel);
    }
    setState(() {});
  }
}  
