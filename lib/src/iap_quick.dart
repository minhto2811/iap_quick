part of 'core.dart';

class IAPQuick {
  StreamSubscription<List<PurchaseDetails>>? _subscription;

  Future<bool> isAvailable() async =>
      await InAppPurchase.instance.isAvailable();

  Future<ProductDetailsResponse> queryProductDetails(Set<String> ids) async =>
      await InAppPurchase.instance.queryProductDetails(ids);

  Future<void> restorePurchases({int retries = 3}) async =>
      await InAppPurchase.instance.restorePurchases();

  Future<void> buyConsumable(ProductDetails productDetails) async {
    final PurchaseParam purchaseParam =
        PurchaseParam(productDetails: productDetails);
    await InAppPurchase.instance.buyConsumable(purchaseParam: purchaseParam);
  }

  Future<void> buyNonConsumable(ProductDetails productDetails) async {
    final PurchaseParam purchaseParam =
        PurchaseParam(productDetails: productDetails);
    await InAppPurchase.instance.buyNonConsumable(purchaseParam: purchaseParam);
  }

  void listen({
    required void Function(List<PurchaseDetails>) onData,
    int millisecondsDelay = 1000,
    bool isRestore = false,
    void Function()? onDone,
    Function? onError,
    bool? cancelOnError,
  }) async {
    assert(millisecondsDelay >= 0, 'milliseconds must be >= 0');
    _subscription = InAppPurchase.instance.purchaseStream.listen(
      onData,
      onDone: () {
        _subscription?.cancel();
        onDone?.call();
      },
      onError: onError,
      cancelOnError: cancelOnError,
    );
    await _finishAllTransactions();
    if (!isRestore) return;
    await Future.delayed(Duration(milliseconds: millisecondsDelay));
    try {
      restorePurchases();
    } catch (e) {
      debugPrint('IAP_QUICK: Error occurred during the data restore process');
    }
  }

  Future<void> _finishAllTransactions() async {
    if (!Platform.isIOS) return;
    final wrapper = SKPaymentQueueWrapper();
    final transactions = await wrapper.transactions();
    await Future.wait(transactions.map((t) => wrapper.finishTransaction(t)));
  }

  Future<void> dispose() async {
    await _subscription?.cancel();
    _subscription = null;
  }
}
