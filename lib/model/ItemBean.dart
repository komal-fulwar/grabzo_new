class ItemBean {
  int itemId;
  String itemName;
  int itemPrice;
  String itemImage;
  int shopId;
  String shopName;
  String shopAbout;
  String shopImage;

  ItemBean(
      {this.itemId,
      this.itemName,
      this.itemPrice,
      this.itemImage,
      this.shopId,
      this.shopName,
      this.shopAbout,
      this.shopImage});

  ItemBean.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemPrice = json['item_price'];
    itemImage = json['item_image'];
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
    data['shop_id'] = this.shopId;
    data['shop_name'] = this.shopName;
    data['shop_about'] = this.shopAbout;
    data['shop_image'] = this.shopImage;
    return data;
  }
}
