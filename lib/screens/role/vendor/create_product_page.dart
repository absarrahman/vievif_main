import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vievif/models/product_category.dart';
import 'package:vievif/models/user_model.dart';
import 'package:vievif/provider/create_product_provider.dart';
import 'package:vievif/screens/failure_page.dart';
import 'package:vievif/screens/success_page.dart';
import 'package:vievif/services/api_service.dart';
import 'package:vievif/utils/colors.dart';
import 'package:vievif/widgets/common_widgets.dart';

class CreateProductPage extends StatefulWidget {
  final UserModel user;

  CreateProductPage(this.user);

  @override
  _CreateProductPageState createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
  List<CategoryModel> categories;
  CategoryModel selected;

  @override
  void initState() {
    super.initState();
    callCategory();
  }

  callCategory() async {
    categories = await ApiService().getCategories();
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var createProvider =
        Provider.of<CreateProductProvider>(context, listen: false);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CommonWidgets.appbar(),
      body: categories != null
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _name(
                        context: context,
                        productProvider: createProvider,
                        size: size),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _type(
                        context: context,
                        productProvider: createProvider,
                        size: size),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _regularPrice(
                        context: context,
                        productProvider: createProvider,
                        size: size),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _description(
                        context: context,
                        productProvider: createProvider,
                        size: size),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _shortDescription(
                        context: context,
                        productProvider: createProvider,
                        size: size),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _setCategory(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _image(
                        context: context,
                        productProvider: createProvider,
                        size: size),
                  ),
                  RaisedButton(
                    onPressed: () async {
                      createProvider.addCategory(selected.id);

                      bool res = await ApiService().addVendorProducts(
                          user: widget.user,
                          id: widget.user.id,
                          createProductProvider: createProvider);

                      if (res) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SuccessPage()));
                      } else {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FailurePage()));
                      }
                    },
                    child: Text('Soumettre'),
                    shape: StadiumBorder(),
                    color: kYellowish,
                  )
                ],
              ),
            )
          : CommonWidgets.loading(),
    );
  }

  Widget _name(
      {BuildContext context,
      CreateProductProvider productProvider,
      Size size}) {
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
            hintText: "Nom",
            hintStyle:
                TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
          ),
          onChanged: (value) {
            productProvider.setName(value);
          },
        ),
      ),
      width: size.width,
    );
  }

  Widget _type(
      {BuildContext context,
      CreateProductProvider productProvider,
      Size size}) {
    return Container(
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
          hintText: "Type",
          hintStyle: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
        ),
        onChanged: (value) {
          productProvider.setType(value);
        },
      ),
      width: size.width,
    );
  }

  Widget _regularPrice(
      {BuildContext context,
      CreateProductProvider productProvider,
      Size size}) {
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
            hintText: "Prix habituel",
            hintStyle:
                TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
          ),
          onChanged: (value) {
            productProvider.setRegularPrice(value);
          },
        ),
      ),
      width: size.width,
    );
  }

  Widget _description(
      {BuildContext context,
      CreateProductProvider productProvider,
      Size size}) {
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
            hintText: "La description",
            hintStyle:
                TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
          ),
          onChanged: (value) {
            productProvider.setDescription(value);
          },
        ),
      ),
      width: size.width,
    );
  }

  Widget _shortDescription(
      {BuildContext context,
      CreateProductProvider productProvider,
      Size size}) {
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
            hintText: "Brève description",
            hintStyle:
                TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
          ),
          onChanged: (value) {
            productProvider.setShortDescription(value);
          },
        ),
      ),
      width: size.width,
    );
  }

  Widget _image(
      {BuildContext context,
      CreateProductProvider productProvider,
      Size size}) {
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
            hintText: "Lien image",
            hintStyle:
                TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
          ),
          onChanged: (value) {
            productProvider.addImage(value);
          },
        ),
      ),
      width: size.width,
    );
  }

  Widget _setCategory() {
    return DropdownButton<CategoryModel>(
      hint: Text('Choisir une catégorie'),
      value: selected,
      icon: Icon(Icons.color_lens_outlined),
      items: categories.map((CategoryModel value) {
        return DropdownMenuItem(
          value: value,
          child: Text('${value.name}'),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selected = value;
        });
      },
    );
  }
}
