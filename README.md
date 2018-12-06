# payment


A flutter ui design of the Settings for iOS and Android.

<img src="/flutter.jpg">

## Usage

To set your publishable key set:
```dart
import 'package:payment/Payment/card.dart';
import 'package:payment/Payment/payment_card_tile.dart';
import 'package:flutter/material.dart';
```
from somewhere in your code, e.g. your main.dart file.

To open the dialog:
```dart
@override
  _PaymentCardTileState createState() => _PaymentCardTileState();
```

## Android

Please be aware that your main activity must extend from FlutterFragmentActivity. Otherwise the Android dialog would've looked very nasty.

## TODO

- [ ] better error handling
- [ ] internationalization
- [ ] more stripe library implementations?

