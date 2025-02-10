import 'dart:io';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import '../iap_quick.dart';

extension ProductDetailsExt on ProductDetails {
  bool get hasTrialPeriod {
    if (Platform.isAndroid) return rawPrice == 0.0;
    return (this as AppStoreProductDetails).skProduct.introductoryPrice != null;
  }
}

extension PurchaseDetailsExt on PurchaseDetails{
  Future<void> get completePurchase async {
    if (pendingCompletePurchase) {
      await InAppPurchase.instance.completePurchase(this);
    }
  }
}
