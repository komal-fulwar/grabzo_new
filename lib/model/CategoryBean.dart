class CategoryBean {
  int categoryId;
  String categoryName;
  String categoryImageUrl;

  CategoryBean({this.categoryId, this.categoryName, this.categoryImageUrl});

  CategoryBean.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryImageUrl = json['category_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['category_image_url'] = this.categoryImageUrl;
    return data;
  }
}