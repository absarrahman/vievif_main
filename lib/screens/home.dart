import 'package:carousel_slider/carousel_slider.dart';
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
      appBar: CommonWidgets.appbar(),
      body: categories == null
          ? CommonWidgets.loading()
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: imageSlider(imgList, context)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'All categories',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                _buildListCategory(),
              ],
            ),
    );
  }

  Widget _buildListCategory() {
    return Expanded(
      child: ListView.builder(
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
          }),
    );
  }

  Widget imageSlider(List imageList, BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
        ),
        items: imageList
            .map((item) => Image.network(
              item,
            ))
            .toList(),
      ),
    );
  }
}
