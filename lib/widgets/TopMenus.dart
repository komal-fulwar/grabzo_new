import 'package:flutter/material.dart';
import 'package:grabzo/model/CategoryBean.dart';
import 'package:grabzo/service/Items.dart';

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
          InkWell(
            onTap: () {},
            child: Column(
              children: <Widget>[
                Container(
                  padding:
                      EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
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
                          'assets/images/topmenu/' + "ic_burger" + ".png",
                          width: 24,
                          height: 24,
                        )),
                      )),
                ),
                Text("name",
                    style: TextStyle(
                        color: Color(0xFF6e6e71),
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
              ],
            ),
          ),
          // OutlineButton.icon()
        ],
      ),
    );
  }
}
