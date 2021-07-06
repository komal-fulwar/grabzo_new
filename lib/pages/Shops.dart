import 'package:grabzo/model/ShopsBean.dart';
import 'package:grabzo/pages/SeeAllShopItems.dart';
import 'package:grabzo/pages/SeeAllShops.dart';
import 'package:grabzo/service/Items.dart';
import 'package:flutter/material.dart';

class Shops extends StatelessWidget {
  const Shops({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Items().getAllShops(),
        builder: (BuildContext context, AsyncSnapshot<ShopsBean> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError)
              return Center(child: Text('Error: ${snapshot.error}'));
            else {
              return shopColumn(context, snapshot.data);
            }
          }
        });
  }

  Column shopColumn(BuildContext context, ShopsBean data) {
    return Column(
      children: [
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: (20)),
        // child:
        ShopTitle(),
        // SectionTitle(
        //   title: "Shops Near You",
        //   press: () {},
        // ),
        // ),
        SizedBox(height: (20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (var shop in data.shops)
                SpecialOfferCard(
                  image: "assets/images/bestfood/ic_best_food_1.jpeg",
                  category: shop.shopName,
                  address: shop.shopAddress,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SeeAllShopItems(shop.shopId, shop.shopName),
                      ),
                    );
                  },
                ),
              SizedBox(width: (20)),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key key,
    @required this.category,
    @required this.image,
    @required this.address,
    @required this.press,
  }) : super(key: key);

  final String category, image;
  final String address;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: (20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: (242),
          height: (100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: (15.0),
                    vertical: (10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: (18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$address")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShopTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 10, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Shops Near You",
            style: TextStyle(
                fontSize: 18,
                color: Color(0xff000000),
                fontWeight: FontWeight.w400),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SeeAllShops(),
                ),
              );
            },
            child: Text(
              "See More",
              style: TextStyle(color: Color(0xFFBBBBBB)),
            ),
          ),
        ],
      ),
    );
  }
}
