class CartBean {
  int cartId;
  int cartCount;
  int cartTotal;
  List<CartItems> cartItems;

  CartBean({this.cartId, this.cartCount, this.cartTotal, this.cartItems});

  CartBean.fromJson(Map<String, dynamic> json) {
    cartId = json['cart_id'];
    cartCount = json['cart_count'];
    cartTotal = json['cart_total'];
    if (json['cart_items'] != null) {
      cartItems = new List<CartItems>();
      json['cart_items'].forEach((v) {
        cartItems.add(new CartItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cart_id'] = this.cartId;
    data['cart_count'] = this.cartCount;
    data['cart_total'] = this.cartTotal;
    if (this.cartItems != null) {
      data['cart_items'] = this.cartItems.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartItems {
  int cartItemId;
  int cartItemQuantity;
  int cartItemTotalPrice;
  int itemId;
  String itemName;
  int itemPrice;

  CartItems(
      {this.cartItemId,
      this.cartItemQuantity,
      this.cartItemTotalPrice,
      this.itemId,
      this.itemName,
      this.itemPrice});

  CartItems.fromJson(Map<String, dynamic> json) {
    cartItemId = json['cart_item_id'];
    cartItemQuantity = json['cart_item_quantity'];
    cartItemTotalPrice = json['cart_item_total_price'];
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemPrice = json['item_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cart_item_id'] = this.cartItemId;
    data['cart_item_quantity'] = this.cartItemQuantity;
    data['cart_item_total_price'] = this.cartItemTotalPrice;
    data['item_id'] = this.itemId;
    data['item_name'] = this.itemName;
    data['item_price'] = this.itemPrice;
    return data;
  }
}
