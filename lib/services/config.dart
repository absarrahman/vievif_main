class WooConfig {
  static String consumerKey = 'ck_a7b190461cb910c5e5d3890e0cbe7a1d9c4cd7d5';
  static String consumerSecret = 'cs_2d24afeb068f36780ae600a8d0e92f87ca9c0c4a';
  static String baseUrl = 'https://www.vievif.fr/wp-json/wc/v3/';
  static String categoriesUrl = 'products/categories/';
  static String productsUrl = 'products/';
  static String authTokenUrl = 'https://www.vievif.fr/wp-json/jwt-auth/v1/token';
  static String userDetailsUrl = 'https://www.vievif.fr/wp-json/wc/v3/customers/';
  static String userCartUrl = 'cart';
  static String saleStateUrl = 'https://vievif.fr/wp-json/wcfmmp/v1/sales-stats/';
  static String deliveryUrl = 'https://vievif.fr/wp-json/wcfmmp/v1/deliveries';
  static String vendorProductUrl = 'https://vievif.fr/wp-json/wcfmmp/v1/products';
  static String storeVendorList = 'https://vievif.fr/wp-json/wcfmmp/v1/store-vendors';
  static String variableProductUrl = 'variations';
  static String orderProductUrl = 'orders';
}

class UserType {
  static const String admin = 'administrator';
  static const String customer = 'customer';
  static const String vendor = 'wcfm_vendor';
  static const String deliveryMan = 'wcfm_delivery_boy';
}