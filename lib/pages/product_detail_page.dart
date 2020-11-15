import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'store.dart';

class ProductDetailPage extends StatefulWidget {
  final String id;
  final String name;
  final String code;
  final String img;
  final String price;
  final String promotionPrice;
  final List size;
  final List color;
  final String company;
  final String logo;

  const ProductDetailPage(
      {Key key,
      this.id,
      this.name,
      this.code,
      this.img,
      this.price,
      this.company,
      this.logo,
      this.promotionPrice,
      this.size,
      this.color})
      : super(key: key);
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int activeSize = 0;
  int activeColor = 0;
  String activeImg = '';
  int qty = 1;
  @override
  void initState() {
    super.initState();
    setState(() {
      activeImg = widget.img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe5e0dd),
      body: getBody(),
      bottomSheet: getBottom(),
    );
  }

  Widget getBottom() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Color(0xFF1ba8f0),
        ),
        height: 50,
        //width: 200,
        width: size.width,
        child: FlatButton(
            //color: primary,
            onPressed: () {
              // your add cart here
              print('Add to cart button clicked');
            },
            child: Text(
              "ADD TO CART",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            )),
      ),
    );
  }

  Widget getBody() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 60),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      size: 30.0,
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
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            Stack(
              children: [
                Card(
                  elevation: 2,
                  child: Hero(
                    tag: widget.id.toString(),
                    child: Container(
                      height: 400,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(activeImg),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(widget.logo),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      // Text(widget.company),
                      Icon(
                        LineIcons.heart,
                        color: Colors.red,
                        size: 30.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),

            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, left: 5.0, right: 10.0, bottom: 10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Flexible(
                            child: Text(
                              widget.code,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Color(0xFFf06b1b),
                            ),
                            width: 100.0,
                            height: 30.0,
                            child: FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Store()),
                                );
                              },
                              child: Text(
                                'Store',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Flexible(
                        child: Text(
                          widget.name,
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Flexible(
                        child: Row(
                          children: <Widget>[
                            Text(
                              'R ' + widget.price,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 10, bottom: 20.0),
                      child: Row(
                        children: [
                          Container(
                            width: 20.0,
                            height: 20.0,
                            decoration: new BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Container(
                            width: 20.0,
                            height: 20.0,
                            decoration: new BoxDecoration(
                              color: Colors.brown[800],
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Container(
                            width: 20.0,
                            height: 20.0,
                            decoration: new BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
