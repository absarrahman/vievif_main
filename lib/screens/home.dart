import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:vievif/models/product_category.dart';
import 'package:vievif/models/product_model.dart';
import 'package:vievif/screens/auth/login.dart';
import 'package:vievif/screens/product_page.dart';
import 'package:vievif/services/api_service.dart';
import 'package:vievif/utils/colors.dart';
import 'package:vievif/widgets/common_widgets.dart';
import 'package:vievif/widgets/product_card_widget.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories;
  List<ProductModel> products;

  @override
  void initState() {
    super.initState();
    callCategory();
  }

  callCategory() async {
    categories = await ApiService().getCategories();
    products = await ApiService().getProducts(pgNumber: 1, orderBy: 'modified');
    setState(() {});
  }

  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket_outlined), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined), label: 'Wishlist'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Wishlist'),
        ],
        currentIndex: tabIndex,
        onTap: (index) {
          setState(() {
            tabIndex = index;
          });
        },
        type: BottomNavigationBarType.shifting,
        selectedFontSize: 15,
        unselectedFontSize: 10,
        selectedItemColor: kYellowish,
        unselectedItemColor: kRedColor,
      ),
      body: categories == null
          ? CommonWidgets.loading()
          : CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: kYellowish,
                  pinned: true,
                  expandedHeight: 100.0,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.cover,
                      width: 150,
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    //animatedJoinUsText(context),
                    imageSlider(products, context),
                    //_header(),
                    FlatButton(onPressed: _login, child: Text("login")),
                    CommonWidgets.header('FAITS SAILLANTS'),
                  ]),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 184,
                    child: CommonWidgets.rowProducts(products),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    SizedBox(
                      height: 10,
                    ),
                    CommonWidgets.header('All categories'),
                    Container(
                      height: 184,
                      child: _buildListCategory(),
                    ),
                  ]),
                )
              ],
            ),
    );
  }

  /*Widget _latestProducts(List<ProductModel> products) {
    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          var product = products[index];
          return ProductCardWidget(product: product);
        });
  }*/

  /*Widget _header(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }*/

  Widget _buildListCategory() {
    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          var category = categories[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductPage(
                        categoryId: category.id,
                      )),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  width: 80,
                  height: 80,
                  alignment: Alignment.center,
                  child: Text(
                    '${category.name}',
                    textAlign: TextAlign.center,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kYellowish,
                  ),
                )
              ],
            ),
          );
        });
  }

  Widget imageSlider(List<ProductModel> imageList, BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: 300,
      width: width,
      child: Carousel(
        boxFit: BoxFit.none,
        autoplay: true,
        dotSize: 2,
        dotColor: kYellowish,
        dotIncreasedColor: kRedColor,
        images: imageList
            .map((item) => Image.network(
                  'https:${item.images[0].src}',
                  fit: BoxFit.fitWidth,
                ))
            .toList(),
      ),
    );
  }

  Widget animatedJoinUsText(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          wave(context),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 40, 8, 0),
            child: Container(
              child: FadeAnimatedTextKit(
                repeatForever: true,
                text: [
                  "VOULEZ-VOUS VENDRE",
                  "VOTRE PRODUIT OU SERVICE?",
                  "REJOIGNEZ-NOUS!"
                ],
                textStyle: TextStyle(
                  color: kBlueish,
                  fontSize: 40.0,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget wave(BuildContext context) {
    return Container(
      height: 150,
      child: WaveWidget(
        config: CustomConfig(
          gradients: [
            [kRedColor, kYellowish],
            [kYellowish, kRedColor]
          ],
          durations: [25800, 20000],
          heightPercentages: [0.07, 0.06],
          blur: const MaskFilter.blur(BlurStyle.outer, 10),
          gradientBegin: Alignment.bottomLeft,
          gradientEnd: Alignment.topRight,
        ),
        waveAmplitude: 2,
        backgroundColor: kYellowish,
        size: const Size(
          double.infinity,
          double.infinity,
        ),
      ),
    );
  }

  _login() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
