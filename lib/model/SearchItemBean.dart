import 'package:grabzo/model/ItemBean.dart';

class SearchItemBean {
  List<ItemBean> search;

  SearchItemBean({this.search});

  SearchItemBean.fromJson(Map<String, dynamic> json) {
    if (json['search'] != null) {
      // ignore: deprecated_member_use
      search = new List<ItemBean>();
      json['search'].forEach((v) {
        search.add(new ItemBean.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.search != null) {
      data['search'] = this.search.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
