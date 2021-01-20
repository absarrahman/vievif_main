import 'package:flutter/material.dart';
import 'package:vievif/utils/colors.dart';

import 'navigation_page.dart';

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text('Succès',style: TextStyle(
                  fontSize: 24,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.check,
                size: 150,
                color: kGreen,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 200,
                child: RaisedButton(
                  color: kYellowish,
                  shape: StadiumBorder(),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => NavigationPage()));
                  },
                  child: Text('Aller à la page d\'accueil'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
