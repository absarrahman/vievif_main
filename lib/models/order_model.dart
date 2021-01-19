import 'package:vievif/models/user_model.dart';

class OrderModel {
  OrderModel({
    this.customerId,
    this.orderId,
    this.paymentMethod,
    this.paymentMethodTitle,
    this.setPaid,
    this.orderKey,
    this.status,
    this.shippingTotal,
    this.billing,
    this.shipping,
    this.lineItems,
    this.shippingLines,
  });

  int customerId;
  int orderId;
  String paymentMethod;
  String paymentMethodTitle;
  String orderKey;
  String status;
  String shippingTotal;
  bool setPaid;
  Ing billing;
  Ing shipping;
  List<LineItem> lineItems;
  List<ShippingLine> shippingLines;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        paymentMethod: json["payment_method"],
        customerId: json["customer_id"],
        orderId: json["id"],
        paymentMethodTitle: json["payment_method_title"],
        setPaid: json["set_paid"],
        shippingTotal: json["shipping_total"],
        orderKey: json["order_key"],
        status: json["status"],
        billing: Ing.fromJson(json["billing"]),
        shipping: Ing.fromJson(json["shipping"]),
        lineItems: List<LineItem>.from(
            json["line_items"].map((x) => LineItem.fromJson(x))),
        shippingLines: List<ShippingLine>.from(
            json["shipping_lines"].map((x) => ShippingLine.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "payment_method": paymentMethod,
        "customer_id": customerId,
        /*"id": orderId,*/
        "payment_method_title": paymentMethodTitle,
        "set_paid": setPaid,
        "billing": billing.toJson(),
        "shipping": shipping.toJson(),
        "line_items": List<dynamic>.from(lineItems.map((x) => x.toJson())),
        /*"shipping_lines":
            List<dynamic>.from(shippingLines.map((x) => x.toJson())),*/
      };
}

class LineItem {
  LineItem({
    this.productId,
    this.quantity,
    this.variationId,
  });

  int productId;
  int quantity;
  int variationId;
  String name;
  String total;

  factory LineItem.fromJson(Map<String, dynamic> json) => LineItem(
        productId: json["product_id"],
        quantity: json["quantity"],
        variationId: json["variation_id"] == null ? null : json["variation_id"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "quantity": quantity,
        "variation_id": variationId == null ? null : variationId,
      };
}

class ShippingLine {
  ShippingLine({
    this.methodId,
    this.methodTitle,
    this.total,
  });

  String methodId;
  String methodTitle;
  String total;

  factory ShippingLine.fromJson(Map<String, dynamic> json) => ShippingLine(
        methodId: json["method_id"],
        methodTitle: json["method_title"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "method_id": methodId,
        "method_title": methodTitle,
        "total": total,
      };
}
