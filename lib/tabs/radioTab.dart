import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/add_provider.dart';
import 'package:provider/provider.dart';

class Radiotab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigprovider>(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Image.asset('assets/images/radio1.png'),
            SizedBox(
              height: 30,
            ),
            Text('إذاعة القرءان الكريم'),
            SizedBox(
              height: 40,
            ),
            provider.isDarkMode()
                ? Image.asset('assets/images/group1.png')
                : Image.asset('assets/images/group.png'),
          ],
        ),
      ),
    );
  }
}
