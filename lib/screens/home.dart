import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:vievif/models/product_category.dart';
import 'package:vievif/screens/product_page.dart';
import 'package:vievif/services/api_service.dart';
import 'package:vievif/utils/colors.dart';
import 'package:vievif/widgets/common_widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callCategory();
  }

  callCategory() async {
    categories = await ApiService().getCategories();
    setState(() {});
  }

  int tabIndex = 0;

  List<String> imgList = [
    'https://i.imgur.com/gLXJLjj.jpeg',
    'https://i.imgur.com/N06PgpO.jpg',
    'https://i.imgur.com/UjJmlBb.jpg',
  ];

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
      // appBar: CommonWidgets.appbar(),
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
                    title: Image.asset('assets/images/logo.png',fit: BoxFit.cover,width: 150,),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    imageSlider(imgList, context),
                    animatedJoinUsText(),
                    _header(),
                  ]),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 100,
                    child: _buildListCategory(),
                  ),
                )
              ],
            ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'All categories',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

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

  Widget imageSlider(List imageList, BuildContext context) {
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
                  item,
                  fit: BoxFit.fitWidth,
                ))
            .toList(),
      ),
    );
  }

  Widget animatedJoinUsText() {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              color: kSurfaceWhite,
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
}
