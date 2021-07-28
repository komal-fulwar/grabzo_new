import 'package:grabzo/model/CategoryBean.dart';

class CategoriesBean {
  List<CategoryBean> categories;

  CategoriesBean({this.categories});

  CategoriesBean.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      // ignore: deprecated_member_use
      categories = new List<CategoryBean>();
      json['categories'].forEach((v) {
        categories.add(new CategoryBean.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
