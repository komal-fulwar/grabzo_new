class ShopBean {
  int shopId;
  String shopName;
  String aboutShop;
  Null shopImage;
  String shopAddress;

  ShopBean(
      {this.shopId,
      this.shopName,
      this.aboutShop,
      this.shopImage,
      this.shopAddress});

  ShopBean.fromJson(Map<String, dynamic> json) {
    shopId = json['shop_id'];
    shopName = json['shop_name'];
    aboutShop = json['about_shop'];
    shopImage = json['shop_image'];
    shopAddress = json['shop_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shop_id'] = this.shopId;
    data['shop_name'] = this.shopName;
    data['about_shop'] = this.aboutShop;
    data['shop_image'] = this.shopImage;
    data['shop_address'] = this.shopAddress;
    return data;
  }
}
