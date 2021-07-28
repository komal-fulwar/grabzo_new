class ItemBean {
  int itemId;
  String itemName;
  int itemPrice;
  String itemImage;
  int categoryId;
  String categoryName;
  int shopId;
  String shopName;
  String shopAbout;
  String shopImage;

  ItemBean(
      {this.itemId,
      this.itemName,
      this.itemPrice,
      this.itemImage,
      this.categoryId,
      this.categoryName,
      this.shopId,
      this.shopName,
      this.shopAbout,
      this.shopImage});

  ItemBean.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemPrice = json['item_price'];
    itemImage = json['item_image'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    shopId = json['shop_id'];
    shopName = json['shop_name'];
    shopAbout = json['shop_about'];
    shopImage = json['shop_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_id'] = this.itemId;
    data['item_name'] = this.itemName;
    data['item_price'] = this.itemPrice;
    data['item_image'] = this.itemImage;
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['shop_id'] = this.shopId;
    data['shop_name'] = this.shopName;
    data['shop_about'] = this.shopAbout;
    data['shop_image'] = this.shopImage;
    return data;
  }
}
