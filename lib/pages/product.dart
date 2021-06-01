import 'package:coffee_shop/services/my_color.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:coffee_shop/model/product.dart';
import 'package:line_icons/line_icon.dart';
import 'package:coffee_shop/widgets/product.dart';

class Product extends StatefulWidget {
  const Product({Key key}) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> with TickerProviderStateMixin {
  final List<ProductModel> drinktList = saleProductList;
  final List<ProductModel> foodList = foodProductList;
  TabController _cateTabController;
  int _indexTab;
  @override
  void initState() {
    _indexTab = 0;
    _cateTabController = TabController(vsync: this, length: 5);
  }

  void setTabActive() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
          SizedBox(
            height: 50.0,
          ),
          Expanded(
              child: Container(
            clipBehavior: Clip.none,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
                color: Colors.white),
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      child: Container(
                        height: 35.0,
                        margin: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 10.0),
                        child: TabBar(
                          controller: _cateTabController,
                          labelColor: colorPrimary,
                          unselectedLabelColor: Colors.grey[500],
                          labelStyle: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w600),
                          isScrollable: true,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorPadding: EdgeInsets.all(0.0),
                          indicatorWeight: 0.0,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(color: colorPrimary),
                          ),
                          tabs: [
                            Tab(text: 'Coffee'),
                            Tab(text: 'Tea'),
                            Tab(text: 'Milk Tea'),
                            Tab(text: 'Cold Brew'),
                            Tab(text: 'Macciato'),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: -35.0,
                      left: 0,
                      right: 0,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        height: 70.0,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 4.0,
                                  spreadRadius: 5.0),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                                flex: 5,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: Size(50, 50),
                                      shape: StadiumBorder(),
                                      padding: EdgeInsets.all(0.0),
                                      elevation: 0.0,
                                      primary: _indexTab == 0
                                          ? colorPrimary
                                          : colorPrimary_light),
                                  onPressed: () {
                                    if (_indexTab != 0)
                                      setState(() {
                                        _indexTab = 0;
                                      });
                                  },
                                  child: Text(
                                    'Drinks',
                                    style: TextStyle(
                                        color: _indexTab == 0
                                            ? Colors.white
                                            : colorPrimary,
                                        fontSize: 20.0),
                                  ),
                                )),
                            SizedBox(
                              width: 15.0,
                            ),
                            Expanded(
                                flex: 5,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: Size(50, 50),
                                      shape: StadiumBorder(),
                                      padding: EdgeInsets.all(0.0),
                                      elevation: 0.0,
                                      primary: _indexTab == 1
                                          ? colorPrimary
                                          : colorPrimary_light),
                                  onPressed: () {
                                    if (_indexTab != 1)
                                      setState(() {
                                        _indexTab = 1;
                                      });
                                  },
                                  child: Text(
                                    'Foods',
                                    style: TextStyle(
                                        color: _indexTab == 1
                                            ? Colors.white
                                            : colorPrimary,
                                        fontSize: 20.0),
                                  ),
                                )),
                            SizedBox(width: 15.0),
                            Expanded(
                                flex: 2,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.all(0.0),
                                      elevation: 0.0,
                                      primary: Colors.transparent),
                                  onPressed: () => print('aa'),
                                  child: LineIcon.search(
                                      color: colorPrimary, size: 30.0),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: IndexedStack(
                    index: _indexTab,
                    children: [
                      Container(
                        child: ListView(
                          clipBehavior: Clip.hardEdge,
                          children: drinktList
                              .map((product) => ProductWidget(
                                    product: product,
                                    isLarge: true,
                                  ))
                              .toList(),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 40.0),
                        child: ListView(
                          clipBehavior: Clip.hardEdge,
                          children: foodList
                              .map((product) => ProductWidget(
                                    product: product,
                                    isLarge: true,
                                  ))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ))
        ]));
  }
}
