# 🛍️ Easy In-App Purchase Plugin for Flutter

## 🚀 Introduction
This plugin makes integrating **In-App Purchase** in your Flutter app easy and fast. With a simple API, multi-platform support, and secure payment processing, this plugin lets you focus on user experience without worrying about complex technical issues.

---

## ✨ Key Features
- ✅ **Supports Google Play & App Store**
- 🔧 **Quick integration**, just a few lines of code
- 🔒 **Secure payment processing**, with automatic transaction verification
- 🔄 **Supports subscriptions & one-time purchases**
- 📡 **Real-time transaction status updates**

---

## 📦 Installation
Add this to your `pubspec.yaml`:

```yaml
dependencies:
  iap_quick: latest_version
```

Then run:

```sh
flutter pub get
```

---

## 🚀 Usage

### Initialize IAP
```dart
final iap = IAPQuick();
final available = await iap.isAvailable();
```

### Fetch Products
```dart
final response = await iap.getProducts(ids: {'id1,id2,id3'});
```

### Restore Purchases
```dart
await iap.restorePurchases();
```

### Purchase Products
#### Buy a Consumable Product
```dart
await iap.buyConsumable(productDetails);
```

#### Buy a Non-Consumable Product
```dart
await iap.buyNonConsumable(productDetails);
```

### Listen to Purchase Updates
```dart
iap.listen(
    onData: (List<PurchaseDetails> purchases) {},
    onDone: () {},
    onError: () {},
    cancelOnError: true);
```

### Dispose IAP Instance
```dart
await iap.dispose();
```

## 🤝 Contribute

We welcome community contributions. Feel free to submit pull requests or report issues.

---  

## 🐞 Issues and Feedback

Please [file an issue](https://github.com/minhto2811/iap_quick/issues) to send feedback or
report a bug. Thank you!

---

## 📜 License

[MIT License](https://mit-license.org/).

---  


[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://buymeacoffee.com/minhto28dee)

**Made with ❤️ by minhto28**  