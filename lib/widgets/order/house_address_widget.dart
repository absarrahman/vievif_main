import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vievif/provider/user_provider.dart';
import 'package:vievif/utils/colors.dart';
import 'package:vievif/widgets/common_widgets.dart';

class AddressWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              CommonWidgets.header('Détails de facturation'),
              _nameFields(context: context, userProvider: userProvider),
              SizedBox(
                height: 10,
              ),
              _countryField(context: context, userProvider: userProvider,size: size),
              SizedBox(
                height: 10,
              ),
              CommonWidgets.header("Numéro et nom de rue"),
              SizedBox(
                height: 10,
              ),
              _addressField(context: context, userProvider: userProvider, size: size),
              _postalCode(context: context,userProvider: userProvider, size: size),
              _cityField(context: context,userProvider: userProvider,size: size),
              _telephoneField(context: context,userProvider: userProvider,size: size),

            ],
          ),
        ),
      ),
    );
  }

  Widget _telephoneField({BuildContext context, UserProvider userProvider,Size size}) {
    return Container(
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
          keyboardType: TextInputType.phone,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: "Téléphone",
            hintStyle: TextStyle(
                color: Colors.grey, fontStyle: FontStyle.italic),
          ),
          onChanged: (value) {
            userProvider.setUserBillingPhone(value);
          },
        ),
      ),
      width: size.width,
    );
  }

  Widget _cityField({BuildContext context, UserProvider userProvider,Size size}) {
    return Container(
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
            hintText: "Ville",
            hintStyle: TextStyle(
                color: Colors.grey, fontStyle: FontStyle.italic),
          ),
          onChanged: (value) {
            userProvider.setUserBillingCountryName(value);
          },
        ),
      ),
      width: size.width,
    );
  }

  Widget _postalCode({BuildContext context, UserProvider userProvider,Size size}) {
    return Container(
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
            hintText: "Code postal",
            hintStyle: TextStyle(
                color: Colors.grey, fontStyle: FontStyle.italic),
          ),
          onChanged: (value) {
            userProvider.setUserFirstName(value);
          },
        ),
      ),
      width: size.width,
    );
  }

  Widget _addressField({BuildContext context, UserProvider userProvider,Size size}) {
    return Container(
      height: 100,
      child: Column(
        children: [
          Flexible(
            child: Container(
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
                    hintText: "Numéro de voie et nom de la rue",
                    hintStyle: TextStyle(
                        color: Colors.grey, fontStyle: FontStyle.italic),
                  ),
                  onChanged: (value) {
                    userProvider.setUserBillingAddress1(value);
                  },
                ),
              ),
              width: size.width,
            ),
          ),
          Flexible(
            child: Container(
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
                    hintText: "Bâtiment, appartement, lot, etc. (facultatif)",
                    hintStyle: TextStyle(
                        color: Colors.grey, fontStyle: FontStyle.italic),
                  ),
                  onChanged: (value) {
                    userProvider.setUserBillingAddress2(value);
                  },
                ),
              ),
              width: size.width,
            ),
          ),
        ],
      ),
    );
  }

  Widget _countryField({BuildContext context, UserProvider userProvider,Size size}) {
    return Container(
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
            hintText: "Pays/région",
            hintStyle: TextStyle(
                color: Colors.grey, fontStyle: FontStyle.italic),
          ),
          onChanged: (value) {
            userProvider.setUserFirstName(value);
          },
        ),
      ),
      width: size.width,
    );
  }

  Widget _nameFields({BuildContext context, UserProvider userProvider}) {
    return Row(
      children: [
        Expanded(
          child: Container(
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
                  hintText: "Prénom",
                  hintStyle: TextStyle(
                      color: Colors.grey, fontStyle: FontStyle.italic),
                ),
                onChanged: (value) {
                  userProvider.setUserFirstName(value);
                },
              ),
            ),
            width: 150,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
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
                  hintText: "Nom",
                  hintStyle: TextStyle(
                      color: Colors.grey, fontStyle: FontStyle.italic),
                ),
                onChanged: (value) {
                  userProvider.setUserLastName(value);
                },
              ),
            ),
            width: 150,
          ),
        ),
      ],
    );
  }
}
