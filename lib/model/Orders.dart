class Orders {
  int orderId;
  int orderStatus;
  int orderCount;
  int orderBaseTotal;
  double orderDelivery;
  double orderTotal;
  String orderDatetime;
  List<OrderItems> orderItems;

  Orders(
      {this.orderId,
      this.orderStatus,
      this.orderCount,
      this.orderBaseTotal,
      this.orderDelivery,
      this.orderTotal,
      this.orderDatetime,
      this.orderItems});

  Orders.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderStatus = json['order_status'];
    orderCount = json['order_count'];
    orderBaseTotal = json['order_base_total'];
    orderDelivery = json['order_delivery'];
    orderTotal = json['order_total'];
    orderDatetime = json['order_datetime'];
    if (json['order_items'] != null) {
      orderItems = new List<OrderItems>();
      json['order_items'].forEach((v) {
        orderItems.add(new OrderItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['order_status'] = this.orderStatus;
    data['order_count'] = this.orderCount;
    data['order_base_total'] = this.orderBaseTotal;
    data['order_delivery'] = this.orderDelivery;
    data['order_total'] = this.orderTotal;
    data['order_datetime'] = this.orderDatetime;
    if (this.orderItems != null) {
      data['order_items'] = this.orderItems.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderItems {
  int cartItemId;
  int cartItemQuantity;
  int cartItemTotalPrice;
  int itemId;
  String itemName;
  int itemPrice;

  OrderItems(
      {this.cartItemId,
      this.cartItemQuantity,
      this.cartItemTotalPrice,
      this.itemId,
      this.itemName,
      this.itemPrice});

  OrderItems.fromJson(Map<String, dynamic> json) {
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
