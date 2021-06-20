class ItemBean {
  int itemId;
  String itemName;
  int itemPrice;
  int shopId;
  String shopName;

  ItemBean(
      {this.itemId, this.itemName, this.itemPrice, this.shopId, this.shopName});

  ItemBean.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemPrice = json['item_price'];
    shopId = json['shop_id'];
    shopName = json['shop_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_id'] = this.itemId;
    data['item_name'] = this.itemName;
    data['item_price'] = this.itemPrice;
    data['shop_id'] = this.shopId;
    data['shop_name'] = this.shopName;
    return data;
  }
}
