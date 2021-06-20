import 'package:Grabzo/model/ItemBean.dart';

class ItemsBean {
  List<ItemBean> items;

  ItemsBean({this.items});

  ItemsBean.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = new List<ItemBean>();
      json['items'].forEach((v) {
        items.add(new ItemBean.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
