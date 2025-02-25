import 'dart:convert';

import 'package:vievif/models/store_model.dart';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.id,
    this.name,
    this.slug,
    this.permalink,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.type,
    this.status,
    this.featured,
    this.catalogVisibility,
    this.description,
    this.shortDescription,
    this.sku,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.dateOnSaleFrom,
    this.dateOnSaleFromGmt,
    this.dateOnSaleTo,
    this.dateOnSaleToGmt,
    this.priceHtml,
    this.onSale,
    this.purchasable,
    this.totalSales,
    this.virtual,
    this.downloadable,
    this.downloads,
    this.downloadLimit,
    this.downloadExpiry,
    this.externalUrl,
    this.buttonText,
    this.taxStatus,
    this.taxClass,
    this.manageStock,
    this.stockQuantity,
    this.stockStatus,
    this.backorders,
    this.backordersAllowed,
    this.backordered,
    this.soldIndividually,
    this.weight,
    this.dimensions,
    this.shippingRequired,
    this.shippingTaxable,
    this.shippingClass,
    this.shippingClassId,
    this.reviewsAllowed,
    this.averageRating,
    this.ratingCount,
    this.relatedIds,
    this.upsellIds,
    this.crossSellIds,
    this.parentId,
    this.purchaseNote,
    this.categories,
    this.tags,
    this.images,
    this.attributes,
    this.defaultAttributes,
    this.variations,
    this.groupedProducts,
    this.menuOrder,
    this.metaData,
    this.yoastHead,
    this.store,
    this.isPurchased,
    this.attributesData,
    this.productUnits,
    this.wcfmProductPolicyData,
    this.showAdditionalInfoTab,
    this.links,
  });

  int id;
  String name;
  String slug;
  String permalink;
  DateTime dateCreated;
  DateTime dateCreatedGmt;
  DateTime dateModified;
  DateTime dateModifiedGmt;
  String type;
  String status;
  bool featured;
  String catalogVisibility;
  String description;
  String shortDescription;
  String sku;
  String price;
  String regularPrice;
  String salePrice;
  dynamic dateOnSaleFrom;
  dynamic dateOnSaleFromGmt;
  dynamic dateOnSaleTo;
  dynamic dateOnSaleToGmt;
  String priceHtml;
  bool onSale;
  bool purchasable;
  int totalSales;
  bool virtual;
  bool downloadable;
  List<dynamic> downloads;
  int downloadLimit;
  int downloadExpiry;
  String externalUrl;
  String buttonText;
  String taxStatus;
  String taxClass;
  bool manageStock;
  dynamic stockQuantity;
  String stockStatus;
  String backorders;
  bool backordersAllowed;
  bool backordered;
  bool soldIndividually;
  String weight;
  Dimensions dimensions;
  bool shippingRequired;
  bool shippingTaxable;
  String shippingClass;
  int shippingClassId;
  bool reviewsAllowed;
  String averageRating;
  int ratingCount;
  List<dynamic> relatedIds;
  List<dynamic> upsellIds;
  List<dynamic> crossSellIds;
  int parentId;
  String purchaseNote;
  List<Category> categories;
  List<dynamic> tags;
  List<ImageModel> images;
  List<AttributeModel> attributes;
  List<dynamic> defaultAttributes;
  List<dynamic> variations;
  List<dynamic> groupedProducts;
  int menuOrder;
  List<MetaDatum> metaData;
  String yoastHead;
  StoreModel store;
  bool isPurchased;
  List<dynamic> attributesData;
  ProductUnits productUnits;
  WcfmProductPolicyData wcfmProductPolicyData;
  bool showAdditionalInfoTab;
  Links links;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    permalink: json["permalink"],
    dateCreated: DateTime.parse(json["date_created"]),
    dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
    dateModified: DateTime.parse(json["date_modified"]),
    dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
    type: json["type"],
    status: json["status"],
    featured: json["featured"],
    catalogVisibility: json["catalog_visibility"],
    description: json["description"],
    shortDescription: json["short_description"],
    sku: json["sku"],
    price: json["price"],
    regularPrice: json["regular_price"],
    salePrice: json["sale_price"],
    dateOnSaleFrom: json["date_on_sale_from"],
    dateOnSaleFromGmt: json["date_on_sale_from_gmt"],
    dateOnSaleTo: json["date_on_sale_to"],
    dateOnSaleToGmt: json["date_on_sale_to_gmt"],
    priceHtml: json["price_html"],
    onSale: json["on_sale"],
    purchasable: json["purchasable"],
    totalSales: json["total_sales"],
    virtual: json["virtual"],
    downloadable: json["downloadable"],
    downloads: List<dynamic>.from(json["downloads"].map((x) => x)),
    downloadLimit: json["download_limit"],
    downloadExpiry: json["download_expiry"],
    externalUrl: json["external_url"],
    buttonText: json["button_text"],
    taxStatus: json["tax_status"],
    taxClass: json["tax_class"],
    manageStock: json["manage_stock"],
    stockQuantity: json["stock_quantity"],
    stockStatus: json["stock_status"],
    backorders: json["backorders"],
    backordersAllowed: json["backorders_allowed"],
    backordered: json["backordered"],
    soldIndividually: json["sold_individually"],
    weight: json["weight"],
    dimensions: Dimensions.fromJson(json["dimensions"]),
    shippingRequired: json["shipping_required"],
    shippingTaxable: json["shipping_taxable"],
    shippingClass: json["shipping_class"],
    shippingClassId: json["shipping_class_id"],
    reviewsAllowed: json["reviews_allowed"],
    averageRating: json["average_rating"],
    ratingCount: json["rating_count"],
    relatedIds: List<dynamic>.from(json["related_ids"].map((x) => x)),
    upsellIds: List<dynamic>.from(json["upsell_ids"].map((x) => x)),
    crossSellIds: List<dynamic>.from(json["cross_sell_ids"].map((x) => x)),
    parentId: json["parent_id"],
    purchaseNote: json["purchase_note"],
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    tags: List<dynamic>.from(json["tags"].map((x) => x)),
    images: List<ImageModel>.from(json["images"].map((x) => ImageModel.fromJson(x))),
    attributes: List<AttributeModel>.from(json["attributes"].map((x) => AttributeModel.fromJson(x))),
    defaultAttributes: List<dynamic>.from(json["default_attributes"].map((x) => x)),
    variations: List<dynamic>.from(json["variations"].map((x) => x)),
    groupedProducts: List<dynamic>.from(json["grouped_products"].map((x) => x)),
    menuOrder: json["menu_order"],
    metaData: List<MetaDatum>.from(json["meta_data"].map((x) => MetaDatum.fromJson(x))),
    yoastHead: json["yoast_head"],
    //store: Store.fromJson(json["store"]),
    store: StoreModel.fromJson(json["store"]),
    //store: json["store"].toString(),
    isPurchased: json["is_purchased"],
    attributesData: List<dynamic>.from(json["attributesData"].map((x) => x)),
    productUnits: ProductUnits.fromJson(json["product_units"]),
    wcfmProductPolicyData: WcfmProductPolicyData.fromJson(json["wcfm_product_policy_data"]),
    showAdditionalInfoTab: json["showAdditionalInfoTab"],
    links: Links.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "permalink": permalink,
    "date_created": dateCreated.toIso8601String(),
    "date_created_gmt": dateCreatedGmt.toIso8601String(),
    "date_modified": dateModified.toIso8601String(),
    "date_modified_gmt": dateModifiedGmt.toIso8601String(),
    "type": type,
    "status": status,
    "featured": featured,
    "catalog_visibility": catalogVisibility,
    "description": description,
    "short_description": shortDescription,
    "sku": sku,
    "price": price,
    "regular_price": regularPrice,
    "sale_price": salePrice,
    "date_on_sale_from": dateOnSaleFrom,
    "date_on_sale_from_gmt": dateOnSaleFromGmt,
    "date_on_sale_to": dateOnSaleTo,
    "date_on_sale_to_gmt": dateOnSaleToGmt,
    "price_html": priceHtml,
    "on_sale": onSale,
    "purchasable": purchasable,
    "total_sales": totalSales,
    "virtual": virtual,
    "downloadable": downloadable,
    "downloads": List<dynamic>.from(downloads.map((x) => x)),
    "download_limit": downloadLimit,
    "download_expiry": downloadExpiry,
    "external_url": externalUrl,
    "button_text": buttonText,
    "tax_status": taxStatus,
    "tax_class": taxClass,
    "manage_stock": manageStock,
    "stock_quantity": stockQuantity,
    "stock_status": stockStatus,
    "backorders": backorders,
    "backorders_allowed": backordersAllowed,
    "backordered": backordered,
    "sold_individually": soldIndividually,
    "weight": weight,
    "dimensions": dimensions.toJson(),
    "shipping_required": shippingRequired,
    "shipping_taxable": shippingTaxable,
    "shipping_class": shippingClass,
    "shipping_class_id": shippingClassId,
    "reviews_allowed": reviewsAllowed,
    "average_rating": averageRating,
    "rating_count": ratingCount,
    "related_ids": List<dynamic>.from(relatedIds.map((x) => x)),
    "upsell_ids": List<dynamic>.from(upsellIds.map((x) => x)),
    "cross_sell_ids": List<dynamic>.from(crossSellIds.map((x) => x)),
    "parent_id": parentId,
    "purchase_note": purchaseNote,
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "attributes": List<dynamic>.from(attributes.map((x) => x)),
    "default_attributes": List<dynamic>.from(defaultAttributes.map((x) => x)),
    "variations": List<dynamic>.from(variations.map((x) => x)),
    "grouped_products": List<dynamic>.from(groupedProducts.map((x) => x)),
    "menu_order": menuOrder,
    "meta_data": List<dynamic>.from(metaData.map((x) => x.toJson())),
    "yoast_head": yoastHead,
    "store": store.toJson(),
   // "store": store,
    "is_purchased": isPurchased,
    "attributesData": List<dynamic>.from(attributesData.map((x) => x)),
    "product_units": productUnits.toJson(),
    "wcfm_product_policy_data": wcfmProductPolicyData.toJson(),
    "showAdditionalInfoTab": showAdditionalInfoTab,
    "_links": links.toJson(),
  };
}

class Category {
  Category({
    this.id,
    this.name,
    this.slug,
  });

  int id;
  String name;
  String slug;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
  };
}

class Dimensions {
  Dimensions({
    this.length,
    this.width,
    this.height,
  });

  String length;
  String width;
  String height;

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
    length: json["length"],
    width: json["width"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "length": length,
    "width": width,
    "height": height,
  };
}

class ImageModel {
  ImageModel({
    this.id,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.src,
    this.name,
    this.alt,
  });

  int id;
  DateTime dateCreated;
  DateTime dateCreatedGmt;
  DateTime dateModified;
  DateTime dateModifiedGmt;
  String src;
  String name;
  String alt;

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
    id: json["id"],
    dateCreated: DateTime.parse(json["date_created"]),
    dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
    dateModified: DateTime.parse(json["date_modified"]),
    dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
    src: json["src"],
    name: json["name"],
    alt: json["alt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date_created": dateCreated.toIso8601String(),
    "date_created_gmt": dateCreatedGmt.toIso8601String(),
    "date_modified": dateModified.toIso8601String(),
    "date_modified_gmt": dateModifiedGmt.toIso8601String(),
    "src": src,
    "name": name,
    "alt": alt,
  };
}

class Links {
  Links({
    this.self,
    this.collection,
  });

  List<Collection> self;
  List<Collection> collection;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: List<Collection>.from(json["self"].map((x) => Collection.fromJson(x))),
    collection: List<Collection>.from(json["collection"].map((x) => Collection.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "self": List<dynamic>.from(self.map((x) => x.toJson())),
    "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
  };
}

class Collection {
  Collection({
    this.href,
  });

  String href;

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
  };
}

class MetaDatum {
  MetaDatum({
    this.id,
    this.key,
    this.value,
  });

  int id;
  String key;
  dynamic value;

  factory MetaDatum.fromJson(Map<String, dynamic> json) => MetaDatum(
    id: json["id"],
    key: json["key"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "key": key,
    "value": value,
  };
}

class PurpleValue {
  PurpleValue({
    this.reviewPostName,
    this.reviewPostScore,
  });

  String reviewPostName;
  String reviewPostScore;

  factory PurpleValue.fromJson(Map<String, dynamic> json) => PurpleValue(
    reviewPostName: json["review_post_name"],
    reviewPostScore: json["review_post_score"],
  );

  Map<String, dynamic> toJson() => {
    "review_post_name": reviewPostName,
    "review_post_score": reviewPostScore,
  };
}

class FluffyValue {
  FluffyValue({
    this.commissionMode,
    this.commissionPercent,
    this.commissionFixed,
    this.taxName,
    this.taxPercent,
    this.mon,
    this.day,
    this.year,
  });

  String commissionMode;
  String commissionPercent;
  String commissionFixed;
  String taxName;
  String taxPercent;
  String mon;
  String day;
  String year;

  factory FluffyValue.fromJson(Map<String, dynamic> json) => FluffyValue(
    commissionMode: json["commission_mode"] == null ? null : json["commission_mode"],
    commissionPercent: json["commission_percent"] == null ? null : json["commission_percent"],
    commissionFixed: json["commission_fixed"] == null ? null : json["commission_fixed"],
    taxName: json["tax_name"] == null ? null : json["tax_name"],
    taxPercent: json["tax_percent"] == null ? null : json["tax_percent"],
    mon: json["mon"] == null ? null : json["mon"],
    day: json["day"] == null ? null : json["day"],
    year: json["year"] == null ? null : json["year"],
  );

  Map<String, dynamic> toJson() => {
    "commission_mode": commissionMode == null ? null : commissionMode,
    "commission_percent": commissionPercent == null ? null : commissionPercent,
    "commission_fixed": commissionFixed == null ? null : commissionFixed,
    "tax_name": taxName == null ? null : taxName,
    "tax_percent": taxPercent == null ? null : taxPercent,
    "mon": mon == null ? null : mon,
    "day": day == null ? null : day,
    "year": year == null ? null : year,
  };
}

class ProductUnits {
  ProductUnits({
    this.weightUnit,
    this.dimensionUnit,
  });

  String weightUnit;
  String dimensionUnit;

  factory ProductUnits.fromJson(Map<String, dynamic> json) => ProductUnits(
    weightUnit: json["weight_unit"],
    dimensionUnit: json["dimension_unit"],
  );

  Map<String, dynamic> toJson() => {
    "weight_unit": weightUnit,
    "dimension_unit": dimensionUnit,
  };
}

/*class Store {
  Store();

  factory Store.fromJson(Map<String, dynamic> json) => Store(
  );

  Map<String, dynamic> toJson() => {
  };
}*/

class WcfmProductPolicyData {
  WcfmProductPolicyData({
    this.visible,
    this.shippingPolicy,
    this.shippingPolicyHeading,
    this.refundPolicy,
    this.refundPolicyHeading,
    this.cancellationPolicy,
    this.cancellationPolicyHeading,
    this.tabTitle,
  });

  bool visible;
  String shippingPolicy;
  String shippingPolicyHeading;
  String refundPolicy;
  String refundPolicyHeading;
  String cancellationPolicy;
  String cancellationPolicyHeading;
  String tabTitle;

  factory WcfmProductPolicyData.fromJson(Map<String, dynamic> json) => WcfmProductPolicyData(
    visible: json["visible"],
    shippingPolicy: json["shipping_policy"],
    shippingPolicyHeading: json["shipping_policy_heading"],
    refundPolicy: json["refund_policy"],
    refundPolicyHeading: json["refund_policy_heading"],
    cancellationPolicy: json["cancellation_policy"],
    cancellationPolicyHeading: json["cancellation_policy_heading"],
    tabTitle: json["tab_title"],
  );

  Map<String, dynamic> toJson() => {
    "visible": visible,
    "shipping_policy": shippingPolicy,
    "shipping_policy_heading": shippingPolicyHeading,
    "refund_policy": refundPolicy,
    "refund_policy_heading": refundPolicyHeading,
    "cancellation_policy": cancellationPolicy,
    "cancellation_policy_heading": cancellationPolicyHeading,
    "tab_title": tabTitle,
  };
}

class AttributeModel {
  AttributeModel({
    this.id,
    this.name,
    this.position,
    this.visible,
    this.variation,
    this.options,
  });

  int id;
  String name;
  int position;
  bool visible;
  bool variation;
  List<String> options;

  factory AttributeModel.fromJson(Map<String, dynamic> json) => AttributeModel(
    id: json["id"],
    name: json["name"],
    position: json["position"],
    visible: json["visible"],
    variation: json["variation"],
    options: List<String>.from(json["options"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "position": position,
    "visible": visible,
    "variation": variation,
    "options": List<dynamic>.from(options.map((x) => x)),
  };
}

