<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

LikeMinds Feed is a plug and play package for creating feed in your flutter app using your LikeMinds account. Provides all functionality for the data layer that can be used with any UI.

## Features

Get a feed setup in your app in minutes

- Feed functionality
- Posting functionality
- Comment functionality
- Feedroom functionality

## Getting started

The starting point is the LikeMinds website. Create your account and get and API key, then initialize the package and get your feed ready in less than 15 minutes.

Then add the package as dependency in pubspec.yaml

```
likeminds_feed: 1.19.0
```

or you can run this command in the terminal

```bash
flutter pub add likeminds_feed
```

## Usage

After adding the import, get an object of the SdkApplication that exposes public methods

```dart
LMFeedClient _feedClient_ = (LMFeedClientBuilder()
          ..apiKey(key)
          ..sdkCallback(sdkCallback))
        .build();
```
