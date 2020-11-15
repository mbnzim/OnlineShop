import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:online_shopping_ui_app/Data/data_json.dart';
import 'package:online_shopping_ui_app/constast/colors.dart';

import 'package:online_shopping_ui_app/pages/product_detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeMenu = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe5e0dd),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Shopping",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      LineIcons.heart_o,
                      size: 30.0,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            //color: Color(0xFF116D51)
                          ),
                          child: Center(
                            child: Icon(
                              LineIcons.shopping_cart,
                              //color: Colors.white,
                              size: 30.0,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 20.0,
                          right: 20.0,
                          child: Container(
                            height: 18.0,
                            width: 18.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.red),
                            child: Center(
                                child: Text(
                              '5',
                              style: TextStyle(
                                  fontFamily: 'Raleway', color: Colors.white),
                            )),
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: 8.0, bottom: 10.0, left: 10.0, right: 10.0),
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(LineIcons.search),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Search",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Row(
                  children: List.generate(menuItems.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        activeMenu = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: activeMenu == index
                                      ? primary
                                      : Colors.transparent,
                                  width: 2))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          menuItems[index],
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                );
              })),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Wrap(
            children: List.generate(
              dataItems.length,
              (index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetailPage(
                          id: dataItems[index]['id'].toString(),
                          name: dataItems[index]['name'],
                          code: dataItems[index]['code'],
                          img: dataItems[index]['img'],
                          price: dataItems[index]['price'].toString(),
                          company: dataItems[index]['company'].toString(),
                          promotionPrice:
                              dataItems[index]['promotionPrice'].toString(),
                          size: dataItems[index]['size'],
                          color: dataItems[index]['color'],
                          logo: dataItems[index]['logo'],
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Card(
                        elevation: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Hero(
                              tag: dataItems[index]['id'].toString(),
                              child: Container(
                                width: (size.width - 18) / 2,
                                height: (size.width - 18) / 2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  image: DecorationImage(
                                      image:
                                          NetworkImage(dataItems[index]['img']),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              width: (size.width - 18) / 2,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      dataItems[index]['code'],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Icon(
                                      LineIcons.heart_o,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                "R " + dataItems[index]['price'].toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: (size.width - 18) / 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    dataItems[index]['logo'].toString()),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Text(dataItems[index]['company'].toString()),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
