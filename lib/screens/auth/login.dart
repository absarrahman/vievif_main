import 'package:flutter/material.dart';
import 'package:vievif/widgets/common_widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CommonWidgets.appbar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  icon: Icon(Icons.email),
                  border: InputBorder.none,
                  hintText: "Email address",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              width: 250,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
              child: TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  icon: Icon(Icons.vpn_key),
                  border: InputBorder.none,
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              width: 250,
            ),
            SizedBox(
              height: screenHeight*0.08,
            ),
            Container(
              alignment: Alignment.center,
              child: ButtonTheme(
                minWidth: 130.0,
                height: 50.0,
                child: RaisedButton(
                  child: Text(
                    "Log in",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () => {},
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                buttonColor: Color(0xffffaa3c),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
