import 'package:Grabzo/model/ItemBean.dart';
import 'package:Grabzo/model/SearchItemBean.dart';
import 'package:Grabzo/service/Items.dart';
import 'package:flutter/material.dart';
import 'package:Grabzo/animation/ScaleRoute.dart';
import 'package:Grabzo/pages/ProductInfo.dart';

class SearchSeeAll extends StatefulWidget {
  SearchSeeAll({this.search});
  String search;
  @override
  _SearchSeeAllState createState() => _SearchSeeAllState(search);
}

class _SearchSeeAllState extends State<SearchSeeAll> {
  _SearchSeeAllState(this._search);
  String _search;
  var _getResult;
  void initState() {
    super.initState();
    _getResult = Items().searchItem(_search);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getResult,
        builder:
            (BuildContext context, AsyncSnapshot<SearchItemBean> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError)
              return Center(child: Text('Error: ${snapshot.error}'));
            else
              return searchItemScaffold(context, snapshot.data);
          }
        });
  }

  Scaffold searchItemScaffold(BuildContext context, SearchItemBean data) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          title: Text(_search,
              style: TextStyle(
                color: Color(0xff000000),
              )),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(3),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        crossAxisCount: 2,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(context, ScaleRoute(page: ProductInfo()));
            },
            child: Card(
                color: Colors.white,
                elevation: 0,
                // shape: RoundedRectangleBorder(
                //   borderRadius: const BorderRadius.all(
                //     Radius.circular(5.0),
                //   ),
                // ),
                child: Container(
                  width: 170,
                  height: 210,
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Center(
                                child: Image.asset(
                              'assets/images/popular_foods/ic_popular_food_1.png',
                              width: 130,
                              height: 140,
                            )),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.bottomLeft,
                            padding: EdgeInsets.only(left: 5, top: 5),
                            child: Text('Food Name',
                                style: TextStyle(
                                    color: Color(0xFF6e6e71),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500)),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            padding: EdgeInsets.only(right: 5),
                            child: Container(
                              height: 28,
                              width: 28,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white70,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFFfae3e2),
                                      blurRadius: 25.0,
                                      offset: Offset(0.0, 0.75),
                                    ),
                                  ]),
                              child: Icon(
                                Icons.favorite,
                                color: Color(0xfffb3132),
                                size: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.bottomLeft,
                            padding: EdgeInsets.only(left: 5, top: 5, right: 5),
                            child: Text('\$' + '17.30',
                                style: TextStyle(
                                    color: Color(0xFF6e6e71),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600)),
                          )
                        ],
                      )
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
