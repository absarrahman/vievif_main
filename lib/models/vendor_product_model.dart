import 'package:vievif/models/product_model.dart';

class VendorProductModel {
  VendorProductModel({
    this.id,
    this.name,
    this.slug,
    this.postAuthor,
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
    this.lowStockAmount,
    this.inStock,
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
    this.productUnits,
    this.wcfmProductPolicyData,
    this.showAdditionalInfoTab,
    this.store,
    this.links,
  });

  int id;
  String name;
  String slug;
  String postAuthor;
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
  int stockQuantity;
  String lowStockAmount;
  bool inStock;
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
  List<int> relatedIds;
  List<dynamic> upsellIds;
  List<dynamic> crossSellIds;
  int parentId;
  String purchaseNote;
  List<Category> categories;
  List<dynamic> tags;
  List<ImageModel> images;
  List<Attribute> attributes;
  List<dynamic> defaultAttributes;
  List<dynamic> variations;
  List<dynamic> groupedProducts;
  int menuOrder;
  List<MetaDatum> metaData;
  ProductUnits productUnits;
  WcfmProductPolicyData wcfmProductPolicyData;
  bool showAdditionalInfoTab;
  Store store;
  Links links;

  factory VendorProductModel.fromJson(Map<String, dynamic> json) => VendorProductModel(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    postAuthor: json["post_author"],
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
    lowStockAmount: json["low_stock_amount"],
    inStock: json["in_stock"],
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
    relatedIds: List<int>.from(json["related_ids"].map((x) => x)),
    upsellIds: List<dynamic>.from(json["upsell_ids"].map((x) => x)),
    crossSellIds: List<dynamic>.from(json["cross_sell_ids"].map((x) => x)),
    parentId: json["parent_id"],
    purchaseNote: json["purchase_note"],
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    tags: List<dynamic>.from(json["tags"].map((x) => x)),
    images: List<ImageModel>.from(json["images"].map((x) => ImageModel.fromJson(x))),
    attributes: List<Attribute>.from(json["attributes"].map((x) => Attribute.fromJson(x))),
    defaultAttributes: List<dynamic>.from(json["default_attributes"].map((x) => x)),
    variations: List<dynamic>.from(json["variations"].map((x) => x)),
    groupedProducts: List<dynamic>.from(json["grouped_products"].map((x) => x)),
    menuOrder: json["menu_order"],
    metaData: List<MetaDatum>.from(json["meta_data"].map((x) => MetaDatum.fromJson(x))),
    productUnits: ProductUnits.fromJson(json["product_units"]),
    wcfmProductPolicyData: WcfmProductPolicyData.fromJson(json["wcfm_product_policy_data"]),
    showAdditionalInfoTab: json["showAdditionalInfoTab"],
    store: Store.fromJson(json["store"]),
    links: Links.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "post_author": postAuthor,
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
    "low_stock_amount": lowStockAmount,
    "in_stock": inStock,
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
    "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
    "default_attributes": List<dynamic>.from(defaultAttributes.map((x) => x)),
    "variations": List<dynamic>.from(variations.map((x) => x)),
    "grouped_products": List<dynamic>.from(groupedProducts.map((x) => x)),
    "menu_order": menuOrder,
    "meta_data": List<dynamic>.from(metaData.map((x) => x.toJson())),
    "product_units": productUnits.toJson(),
    "wcfm_product_policy_data": wcfmProductPolicyData.toJson(),
    "showAdditionalInfoTab": showAdditionalInfoTab,
    "store": store.toJson(),
    "_links": links.toJson(),
  };
}

class Attribute {
  Attribute({
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

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
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
    this.url,
    this.thumbnail,
    this.mon,
    this.day,
    this.year,
    this.commissionMode,
    this.commissionPercent,
    this.commissionFixed,
    this.taxName,
    this.taxPercent,
    this.gtin8,
    this.gtin12,
    this.gtin13,
    this.gtin14,
    this.isbn,
    this.mpn,
    this.the0,
    this.policyTabTitle,
    this.shippingPolicy,
    this.refundPolicy,
    this.cancellationPolicy,
  });

  String url;
  String thumbnail;
  String mon;
  String day;
  String year;
  String commissionMode;
  String commissionPercent;
  String commissionFixed;
  String taxName;
  String taxPercent;
  String gtin8;
  String gtin12;
  String gtin13;
  String gtin14;
  String isbn;
  String mpn;
  String the0;
  String policyTabTitle;
  String shippingPolicy;
  String refundPolicy;
  String cancellationPolicy;

  factory FluffyValue.fromJson(Map<String, dynamic> json) => FluffyValue(
    url: json["url"] == null ? null : json["url"],
    thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
    mon: json["mon"] == null ? null : json["mon"],
    day: json["day"] == null ? null : json["day"],
    year: json["year"] == null ? null : json["year"],
    commissionMode: json["commission_mode"] == null ? null : json["commission_mode"],
    commissionPercent: json["commission_percent"] == null ? null : json["commission_percent"],
    commissionFixed: json["commission_fixed"] == null ? null : json["commission_fixed"],
    taxName: json["tax_name"] == null ? null : json["tax_name"],
    taxPercent: json["tax_percent"] == null ? null : json["tax_percent"],
    gtin8: json["gtin8"] == null ? null : json["gtin8"],
    gtin12: json["gtin12"] == null ? null : json["gtin12"],
    gtin13: json["gtin13"] == null ? null : json["gtin13"],
    gtin14: json["gtin14"] == null ? null : json["gtin14"],
    isbn: json["isbn"] == null ? null : json["isbn"],
    mpn: json["mpn"] == null ? null : json["mpn"],
    the0: json["0"] == null ? null : json["0"],
    policyTabTitle: json["policy_tab_title"] == null ? null : json["policy_tab_title"],
    shippingPolicy: json["shipping_policy"] == null ? null : json["shipping_policy"],
    refundPolicy: json["refund_policy"] == null ? null : json["refund_policy"],
    cancellationPolicy: json["cancellation_policy"] == null ? null : json["cancellation_policy"],
  );

  Map<String, dynamic> toJson() => {
    "url": url == null ? null : url,
    "thumbnail": thumbnail == null ? null : thumbnail,
    "mon": mon == null ? null : mon,
    "day": day == null ? null : day,
    "year": year == null ? null : year,
    "commission_mode": commissionMode == null ? null : commissionMode,
    "commission_percent": commissionPercent == null ? null : commissionPercent,
    "commission_fixed": commissionFixed == null ? null : commissionFixed,
    "tax_name": taxName == null ? null : taxName,
    "tax_percent": taxPercent == null ? null : taxPercent,
    "gtin8": gtin8 == null ? null : gtin8,
    "gtin12": gtin12 == null ? null : gtin12,
    "gtin13": gtin13 == null ? null : gtin13,
    "gtin14": gtin14 == null ? null : gtin14,
    "isbn": isbn == null ? null : isbn,
    "mpn": mpn == null ? null : mpn,
    "0": the0 == null ? null : the0,
    "policy_tab_title": policyTabTitle == null ? null : policyTabTitle,
    "shipping_policy": shippingPolicy == null ? null : shippingPolicy,
    "refund_policy": refundPolicy == null ? null : refundPolicy,
    "cancellation_policy": cancellationPolicy == null ? null : cancellationPolicy,
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

class Store {
  Store({
    this.vendorId,
    this.vendorDisplayName,
    this.vendorShopName,
    this.formattedDisplayName,
    this.storeHideEmail,
    this.storeHidePhone,
    this.storeHideAddress,
    this.storeHideDescription,
    this.storeHidePolicy,
    this.storeProductsPerPage,
    this.vendorEmail,
    this.vendorPhone,
    this.vendorAddress,
    this.disableVendor,
    this.isStoreOffline,
    this.vendorShopLogo,
    this.vendorBannerType,
    this.vendorBanner,
    this.mobileBanner,
    this.vendorListBannerType,
    this.vendorListBanner,
    this.storeRating,
    this.emailVerified,
    this.vendorAdditionalInfo,
    this.membershipDetails,
    this.vendorDescription,
    this.vendorPolicies,
    this.storeTabHeadings,
  });

  int vendorId;
  String vendorDisplayName;
  String vendorShopName;
  String formattedDisplayName;
  String storeHideEmail;
  String storeHidePhone;
  String storeHideAddress;
  String storeHideDescription;
  String storeHidePolicy;
  int storeProductsPerPage;
  String vendorEmail;
  String vendorPhone;
  String vendorAddress;
  String disableVendor;
  String isStoreOffline;
  String vendorShopLogo;
  String vendorBannerType;
  String vendorBanner;
  String mobileBanner;
  String vendorListBannerType;
  String vendorListBanner;
  String storeRating;
  String emailVerified;
  List<VendorAdditionalInfo> vendorAdditionalInfo;
  MembershipDetails membershipDetails;
  String vendorDescription;
  WcfmProductPolicyData vendorPolicies;
  StoreTabHeadings storeTabHeadings;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    vendorId: json["vendor_id"],
    vendorDisplayName: json["vendor_display_name"],
    vendorShopName: json["vendor_shop_name"],
    formattedDisplayName: json["formatted_display_name"],
    storeHideEmail: json["store_hide_email"],
    storeHidePhone: json["store_hide_phone"],
    storeHideAddress: json["store_hide_address"],
    storeHideDescription: json["store_hide_description"],
    storeHidePolicy: json["store_hide_policy"],
    storeProductsPerPage: json["store_products_per_page"],
    vendorEmail: json["vendor_email"],
    vendorPhone: json["vendor_phone"],
    vendorAddress: json["vendor_address"],
    disableVendor: json["disable_vendor"],
    isStoreOffline: json["is_store_offline"],
    vendorShopLogo: json["vendor_shop_logo"],
    vendorBannerType: json["vendor_banner_type"],
    vendorBanner: json["vendor_banner"],
    mobileBanner: json["mobile_banner"],
    vendorListBannerType: json["vendor_list_banner_type"],
    vendorListBanner: json["vendor_list_banner"],
    storeRating: json["store_rating"],
    emailVerified: json["email_verified"],
    vendorAdditionalInfo: List<VendorAdditionalInfo>.from(json["vendor_additional_info"].map((x) => VendorAdditionalInfo.fromJson(x))),
    membershipDetails: MembershipDetails.fromJson(json["membership_details"]),
    vendorDescription: json["vendor_description"],
    vendorPolicies: WcfmProductPolicyData.fromJson(json["vendor_policies"]),
    storeTabHeadings: StoreTabHeadings.fromJson(json["store_tab_headings"]),
  );

  Map<String, dynamic> toJson() => {
    "vendor_id": vendorId,
    "vendor_display_name": vendorDisplayName,
    "vendor_shop_name": vendorShopName,
    "formatted_display_name": formattedDisplayName,
    "store_hide_email": storeHideEmail,
    "store_hide_phone": storeHidePhone,
    "store_hide_address": storeHideAddress,
    "store_hide_description": storeHideDescription,
    "store_hide_policy": storeHidePolicy,
    "store_products_per_page": storeProductsPerPage,
    "vendor_email": vendorEmail,
    "vendor_phone": vendorPhone,
    "vendor_address": vendorAddress,
    "disable_vendor": disableVendor,
    "is_store_offline": isStoreOffline,
    "vendor_shop_logo": vendorShopLogo,
    "vendor_banner_type": vendorBannerType,
    "vendor_banner": vendorBanner,
    "mobile_banner": mobileBanner,
    "vendor_list_banner_type": vendorListBannerType,
    "vendor_list_banner": vendorListBanner,
    "store_rating": storeRating,
    "email_verified": emailVerified,
    "vendor_additional_info": List<dynamic>.from(vendorAdditionalInfo.map((x) => x.toJson())),
    "membership_details": membershipDetails.toJson(),
    "vendor_description": vendorDescription,
    "vendor_policies": vendorPolicies.toJson(),
    "store_tab_headings": storeTabHeadings.toJson(),
  };
}

class MembershipDetails {
  MembershipDetails({
    this.membershipTitle,
    this.membershipId,
  });

  String membershipTitle;
  String membershipId;

  factory MembershipDetails.fromJson(Map<String, dynamic> json) => MembershipDetails(
    membershipTitle: json["membership_title"],
    membershipId: json["membership_id"],
  );

  Map<String, dynamic> toJson() => {
    "membership_title": membershipTitle,
    "membership_id": membershipId,
  };
}

class StoreTabHeadings {
  StoreTabHeadings({
    this.products,
    this.reviews,
    this.followers,
  });

  String products;
  String reviews;
  String followers;

  factory StoreTabHeadings.fromJson(Map<String, dynamic> json) => StoreTabHeadings(
    products: json["products"],
    reviews: json["reviews"],
    followers: json["followers"],
  );

  Map<String, dynamic> toJson() => {
    "products": products,
    "reviews": reviews,
    "followers": followers,
  };
}

class VendorAdditionalInfo {
  VendorAdditionalInfo({
    this.type,
    this.label,
    this.options,
    this.content,
    this.helpText,
    this.name,
    this.value,
  });

  String type;
  String label;
  String options;
  String content;
  String helpText;
  String name;
  String value;

  factory VendorAdditionalInfo.fromJson(Map<String, dynamic> json) => VendorAdditionalInfo(
    type: json["type"],
    label: json["label"],
    options: json["options"],
    content: json["content"],
    helpText: json["help_text"],
    name: json["name"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "label": label,
    "options": options,
    "content": content,
    "help_text": helpText,
    "name": name,
    "value": value,
  };
}

class WcfmProductPolicyData {
  WcfmProductPolicyData({
    this.shippingPolicyHeading,
    this.shippingPolicy,
    this.refundPolicyHeading,
    this.refundPolicy,
    this.cancellationPolicyHeading,
    this.cancellationPolicy,
    this.visible,
    this.tabTitle,
  });

  String shippingPolicyHeading;
  String shippingPolicy;
  String refundPolicyHeading;
  String refundPolicy;
  String cancellationPolicyHeading;
  String cancellationPolicy;
  bool visible;
  String tabTitle;

  factory WcfmProductPolicyData.fromJson(Map<String, dynamic> json) => WcfmProductPolicyData(
    shippingPolicyHeading: json["shipping_policy_heading"],
    shippingPolicy: json["shipping_policy"],
    refundPolicyHeading: json["refund_policy_heading"],
    refundPolicy: json["refund_policy"],
    cancellationPolicyHeading: json["cancellation_policy_heading"],
    cancellationPolicy: json["cancellation_policy"],
    visible: json["visible"] == null ? null : json["visible"],
    tabTitle: json["tab_title"] == null ? null : json["tab_title"],
  );

  Map<String, dynamic> toJson() => {
    "shipping_policy_heading": shippingPolicyHeading,
    "shipping_policy": shippingPolicy,
    "refund_policy_heading": refundPolicyHeading,
    "refund_policy": refundPolicy,
    "cancellation_policy_heading": cancellationPolicyHeading,
    "cancellation_policy": cancellationPolicy,
    "visible": visible == null ? null : visible,
    "tab_title": tabTitle == null ? null : tabTitle,
  };
}
