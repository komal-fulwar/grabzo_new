import 'ShopBean.dart';

class ShopsBean {
  List<ShopBean> shops;

  ShopsBean({this.shops});

  ShopsBean.fromJson(Map<String, dynamic> json) {
    if (json['shops'] != null) {
      // ignore: deprecated_member_use
      shops = new List<ShopBean>();
      json['shops'].forEach((v) {
        shops.add(new ShopBean.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.shops != null) {
      data['shops'] = this.shops.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
