import 'package:grabzo/model/ItemBean.dart';

class ShopBean {
  int shopId;
  String shopName;
  String aboutShop;
  String shopImage;
  String shopAddress;
  List<ItemBean> items;

  ShopBean(
      {this.shopId,
      this.shopName,
      this.aboutShop,
      this.shopImage,
      this.shopAddress,
      this.items});

  ShopBean.fromJson(Map<String, dynamic> json) {
    shopId = json['shop_id'];
    shopName = json['shop_name'];
    aboutShop = json['about_shop'];
    shopImage = json['shop_image'];
    shopAddress = json['shop_address'];
    if (json['items'] != null) {
      items = new List<ItemBean>();
      json['items'].forEach((v) {
        items.add(ItemBean.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shop_id'] = this.shopId;
    data['shop_name'] = this.shopName;
    data['about_shop'] = this.aboutShop;
    data['shop_image'] = this.shopImage;
    data['shop_address'] = this.shopAddress;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
