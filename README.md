# 🛍️ Easy In-App Purchase Plugin for Flutter

## 🚀 Introduction
This plugin makes integrating **In-App Purchase** in your Flutter app easy and fast. With a simple API, multi-platform support, and secure payment processing, this plugin lets you focus on user experience without worrying about complex technical issues.

## ✨ Key Features
- ✅ **Supports Google Play & App Store**
- 🔧 **Quick integration**, just a few lines of code
- 🔒 **Secure payment processing**, with automatic transaction verification
- 🔄 **Supports subscriptions & one-time purchases**
- 📡 **Real-time transaction status updates**

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

## 🚀 Usage

### Initialize IAP
```dart
final iap = IAPQuick();
final available = await iap.isAvailable();
```

### Fetch Products
```dart
final products = await iap.getProducts(ids: {'id1,id2,id3'}, notFoundIDs: (ids) {});
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

## 📖 Detailed Guide
Check the full documentation at [Wiki](#).

## 🎯 Contribution
Feel free to open an issue or submit a pull request to improve this plugin!

## 📄 License
MIT License.
