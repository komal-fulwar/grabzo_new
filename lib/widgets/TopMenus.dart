import 'package:Grabzo/model/CategoryBean.dart';
import 'package:Grabzo/pages/SeeCategoryItem.dart';
import 'package:Grabzo/service/Items.dart';
import 'package:flutter/material.dart';

class TopMenus extends StatefulWidget {
  @override
  _TopMenusState createState() => _TopMenusState();
}

class _TopMenusState extends State<TopMenus> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Items().getAllCategory(),
        builder: (BuildContext context, AsyncSnapshot<CategoryBean> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError)
              return Center(child: Text('Error: ${snapshot.error}'));
            else {
              return topMenuContainer(context, snapshot.data);
            }
          }
        });
  }

  Container topMenuContainer(BuildContext context, CategoryBean data) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          //iterate for loop (categories)
          //for (var item in data.)
          TopMenuTiles(name: "Burger", imageUrl: "ic_burger", id: 1),
          // TopMenuTiles(name: "Sushi", imageUrl: "ic_sushi", id: ""),
          // TopMenuTiles(name: "Pizza", imageUrl: "ic_pizza", id: ""),
          // TopMenuTiles(name: "Cake", imageUrl: "ic_cake", id: ""),
          // TopMenuTiles(name: "Ice Cream", imageUrl: "ic_ice_cream", id: ""),
          // TopMenuTiles(name: "Soft Drink", imageUrl: "ic_soft_drink", id: ""),
          // TopMenuTiles(name: "Burger", imageUrl: "ic_burger", id: ""),
          // TopMenuTiles(name: "Sushi", imageUrl: "ic_sushi", id: ""),
          // OutlineButton.icon()
        ],
      ),
    );
  }
}

class TopMenuTiles extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int id;

  TopMenuTiles(
      {Key key,
      @required this.name,
      @required this.imageUrl,
      @required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => SeeCategoryItem(id)));
      },
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
            decoration: new BoxDecoration(boxShadow: [
              new BoxShadow(
                color: Color(0xffeefae2),
                blurRadius: 25.0,
                offset: Offset(0.0, 0.75),
              ),
            ]),
            child: Card(
                color: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(3.0),
                  ),
                ),
                child: Container(
                  width: 50,
                  height: 50,
                  child: Center(
                      child: Image.asset(
                    'assets/images/topmenu/' + imageUrl + ".png",
                    width: 24,
                    height: 24,
                  )),
                )),
          ),
          Text(name,
              style: TextStyle(
                  color: Color(0xFF6e6e71),
                  fontSize: 14,
                  fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}
