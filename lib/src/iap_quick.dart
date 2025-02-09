part of 'core.dart';

class IAPQuick {
  StreamSubscription<List<PurchaseDetails>>? _subscription;

  Future<bool> isAvailable() async =>
      await InAppPurchase.instance.isAvailable();

  Future<ProductDetailsResponse> getProducts({
    required Set<String> ids,
    void Function(List<String>)? notFoundIDs,
  }) async =>
      await InAppPurchase.instance.queryProductDetails(ids);

  Future<void> restorePurchases() async =>
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
    void Function()? onDone,
    Function? onError,
    bool? cancelOnError,
  }) async {
    await _reloadTransactions();
    _subscription = InAppPurchase.instance.purchaseStream.listen(
      onData,
      onDone: () {
        _subscription?.cancel();
        onDone?.call();
      },
      onError: onError,
      cancelOnError: cancelOnError,
    );
    restorePurchases();
    _finishAllTransactions();
  }

  Future<void> _reloadTransactions() async {
    if (Platform.isIOS) {
      SKPaymentQueueWrapper wrapper = SKPaymentQueueWrapper();
      List<SKPaymentTransactionWrapper> transactions =
          await wrapper.transactions();
      transactions.forEach((transaction) async {
        if (transaction.transactionState ==
            SKPaymentTransactionStateWrapper.purchased) {
          await wrapper.finishTransaction(transaction);
        }
      });
    }
  }

  Future<void> _finishAllTransactions() async {
    if (Platform.isIOS) {
      SKPaymentQueueWrapper wrapper = SKPaymentQueueWrapper();
      List<SKPaymentTransactionWrapper> transactions =
          await wrapper.transactions();
      transactions.forEach(
          (transaction) async => await wrapper.finishTransaction(transaction));
    }
  }

  Future<void> dispose() async {
    await _subscription?.cancel();
    _subscription = null;
  }
}
