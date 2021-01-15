import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vievif/models/user_model.dart';
import 'package:vievif/provider/user_provider.dart';
import 'file:///D:/Projects/DEEPSIGHT/vievifCus/vievif/lib/screens/role/admin/admin_screen.dart';
import 'file:///D:/Projects/DEEPSIGHT/vievifCus/vievif/lib/screens/role/customer/customer_screen.dart';
import 'file:///D:/Projects/DEEPSIGHT/vievifCus/vievif/lib/screens/role/delivery/delivery_screen.dart';
import 'file:///D:/Projects/DEEPSIGHT/vievifCus/vievif/lib/screens/role/vendor/vendor_screen.dart';
import 'package:vievif/services/api_service.dart';
import 'package:vievif/services/config.dart';
import 'package:vievif/services/user_route.dart';
import 'package:vievif/utils/colors.dart';
import 'package:vievif/widgets/common_widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    var userProvider = Provider.of<UserProvider>(context,listen: false);

    return Scaffold(
      appBar: CommonWidgets.appbar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Image.asset('assets/images/logo.png',height: screenWidth * 0.77,
                width: screenWidth * 0.77,),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
              child: Theme(
                data: Theme.of(context).copyWith(
                  primaryColor: kRedColor,
                ),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    //border: InputBorder.none,
                    hintText: "Identifiant ou adresse de messagerie",
                    hintStyle: TextStyle(color: Colors.grey,fontStyle: FontStyle.italic),
                  ),
                  onChanged: (value) {
                    userProvider.setEmail(value);
                  },
                ),
              ),
              width: 350,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
              child: Theme(
                data: Theme.of(context).copyWith(
                  primaryColor: kRedColor,
                ),
                child: TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.vpn_key,),
                    //border: InputBorder.none,
                    hintText: "Mot de passe",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  onChanged: (value) {
                    userProvider.setPassword(value);
                  },
                ),
              ),
              width: 350,
            ),
            SizedBox(
              height: screenHeight * 0.08,
            ),
            Container(
              alignment: Alignment.center,
              child: ButtonTheme(
                minWidth: 130.0,
                height: 50.0,
                child: RaisedButton(
                  child: Text(
                    "Identification",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: kSurfaceWhite
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () async {
                    var email = userProvider.email;
                    var password = userProvider.password;

                    try {
                      UserModel user =
                          await ApiService().login(email, password);
                      print('USER TOKEN LOGIN ${user.token}');
                      userProvider.setUser(user);
                      userProvider.setLoginStatus(true);
                      UserRoute.navigateUserScreen(user: user,context: context,isFromLoginPage: true);
                    } catch (e) {
                      print('ERROR');
                      _exitDialogue();
                    }
                  },
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

  _exitDialogue() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: kYellowish,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        title: Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.cover,
          width: 10,
        ),
        content: Text(
          "Identifiant ou mot de passe incorrect",
          style: TextStyle(fontSize: 20, color: kBlack),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              "D'accord",
              style: TextStyle(color: kBlack),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

}
