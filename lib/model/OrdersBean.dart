import 'package:grabzo/model/Orders.dart';

class OrdersBean {
  List<Orders> orders;

  OrdersBean({this.orders});

  OrdersBean.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      // ignore: deprecated_member_use
      orders = new List<Orders>();
      json['orders'].forEach((v) {
        orders.add(new Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orders != null) {
      data['orders'] = this.orders.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
