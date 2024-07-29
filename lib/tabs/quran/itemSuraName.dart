import 'package:flutter/material.dart';
import 'package:flutter_application_1/tabs/quran/suraDetailsScreen.dart';

class Itemsuraname extends StatelessWidget {
  String name;
  int index;
  Itemsuraname({required this.name, required this.index});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(Suradetailsscreen.routeName,
            arguments: ArgsDetalis(index: index, name: name));
      },
      child: Text(
        name,
        style: Theme.of(context).textTheme.bodySmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
