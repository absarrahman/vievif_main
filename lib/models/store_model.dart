class StoreModel {
  StoreModel({
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
  VendorPolicies vendorPolicies;
  StoreTabHeadings storeTabHeadings;

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
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
    //vendorAdditionalInfo: List<VendorAdditionalInfo>.from(json["vendor_additional_info"].map((x) => VendorAdditionalInfo.fromJson(x))),
    //membershipDetails: MembershipDetails.fromJson(json["membership_details"]),
    vendorDescription: json["vendor_description"],
   // vendorPolicies: VendorPolicies.fromJson(json["vendor_policies"]),
   // storeTabHeadings: StoreTabHeadings.fromJson(json["store_tab_headings"]),
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

class VendorPolicies {
  VendorPolicies({
    this.shippingPolicyHeading,
    this.shippingPolicy,
    this.refundPolicyHeading,
    this.refundPolicy,
    this.cancellationPolicyHeading,
    this.cancellationPolicy,
  });

  String shippingPolicyHeading;
  String shippingPolicy;
  String refundPolicyHeading;
  String refundPolicy;
  String cancellationPolicyHeading;
  String cancellationPolicy;

  factory VendorPolicies.fromJson(Map<String, dynamic> json) => VendorPolicies(
    shippingPolicyHeading: json["shipping_policy_heading"],
    shippingPolicy: json["shipping_policy"],
    refundPolicyHeading: json["refund_policy_heading"],
    refundPolicy: json["refund_policy"],
    cancellationPolicyHeading: json["cancellation_policy_heading"],
    cancellationPolicy: json["cancellation_policy"],
  );

  Map<String, dynamic> toJson() => {
    "shipping_policy_heading": shippingPolicyHeading,
    "shipping_policy": shippingPolicy,
    "refund_policy_heading": refundPolicyHeading,
    "refund_policy": refundPolicy,
    "cancellation_policy_heading": cancellationPolicyHeading,
    "cancellation_policy": cancellationPolicy,
  };
}
