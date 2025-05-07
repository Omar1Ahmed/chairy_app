// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Make Your Interior More Minimalistic & Modern`
  String get HomeHeadline {
    return Intl.message(
      'Make Your Interior More Minimalistic & Modern',
      name: 'HomeHeadline',
      desc: '',
      args: [],
    );
  }

  /// `Turn your room with panto into a lot more minimalist and modern with ease and speed`
  String get HomeHeadline2 {
    return Intl.message(
      'Turn your room with panto into a lot more minimalist and modern with ease and speed',
      name: 'HomeHeadline2',
      desc: '',
      args: [],
    );
  }

  /// `Menu`
  String get Menu {
    return Intl.message('Menu', name: 'Menu', desc: '', args: []);
  }

  /// `Language`
  String get Language {
    return Intl.message('Language', name: 'Language', desc: '', args: []);
  }

  /// `Theme`
  String get Theme {
    return Intl.message('Theme', name: 'Theme', desc: '', args: []);
  }

  /// `English`
  String get English {
    return Intl.message('English', name: 'English', desc: '', args: []);
  }

  /// `Arabic`
  String get Arabic {
    return Intl.message('Arabic', name: 'Arabic', desc: '', args: []);
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message('Dark Mode', name: 'darkMode', desc: '', args: []);
  }

  /// `Light Mode`
  String get lightMode {
    return Intl.message('Light Mode', name: 'lightMode', desc: '', args: []);
  }

  /// `Connection timed out. Please check your internet connection or try again later.`
  String get connectionTimeout {
    return Intl.message(
      'Connection timed out. Please check your internet connection or try again later.',
      name: 'connectionTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Request timed out. Please try again.`
  String get sendTimeout {
    return Intl.message(
      'Request timed out. Please try again.',
      name: 'sendTimeout',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection. Please check your connection and try again.`
  String get connectionError {
    return Intl.message(
      'No internet connection. Please check your connection and try again.',
      name: 'connectionError',
      desc: '',
      args: [],
    );
  }

  /// `Bad request. Please check the data you're submitting.`
  String get badRequest {
    return Intl.message(
      'Bad request. Please check the data you\'re submitting.',
      name: 'badRequest',
      desc: '',
      args: [],
    );
  }

  /// `Unauthorized. Please log in again.`
  String get unauthorized {
    return Intl.message(
      'Unauthorized. Please log in again.',
      name: 'unauthorized',
      desc: '',
      args: [],
    );
  }

  /// `The requested resource could not be found.`
  String get notFound {
    return Intl.message(
      'The requested resource could not be found.',
      name: 'notFound',
      desc: '',
      args: [],
    );
  }

  /// `Server error. Please try again later.`
  String get serverError {
    return Intl.message(
      'Server error. Please try again later.',
      name: 'serverError',
      desc: '',
      args: [],
    );
  }

  /// `The request was cancelled. Would you like to retry?`
  String get requestCancelled {
    return Intl.message(
      'The request was cancelled. Would you like to retry?',
      name: 'requestCancelled',
      desc: '',
      args: [],
    );
  }

  /// `The server took too long to respond. Please try again.`
  String get receiveTimeout {
    return Intl.message(
      'The server took too long to respond. Please try again.',
      name: 'receiveTimeout',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected error occurred. Please try again.`
  String get unexpectedError {
    return Intl.message(
      'An unexpected error occurred. Please try again.',
      name: 'unexpectedError',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: '', args: []);
  }

  /// `No internet connection. Please check your connection and try again.`
  String get noInternetConnection {
    return Intl.message(
      'No internet connection. Please check your connection and try again.',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Request failed. Would you like to retry?`
  String get requestFailed {
    return Intl.message(
      'Request failed. Would you like to retry?',
      name: 'requestFailed',
      desc: '',
      args: [],
    );
  }

  /// `Your session has expired. Please log in again.`
  String get loginExpired {
    return Intl.message(
      'Your session has expired. Please log in again.',
      name: 'loginExpired',
      desc: '',
      args: [],
    );
  }

  /// `Our Categories`
  String get ourCategories {
    return Intl.message(
      'Our Categories',
      name: 'ourCategories',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message('Cart', name: 'cart', desc: '', args: []);
  }

  /// `Categories`
  String get categories {
    return Intl.message('Categories', name: 'categories', desc: '', args: []);
  }

  /// `More Info`
  String get moreInfo {
    return Intl.message('More Info', name: 'moreInfo', desc: '', args: []);
  }

  /// `No Categories`
  String get NoCategories {
    return Intl.message(
      'No Categories',
      name: 'NoCategories',
      desc: '',
      args: [],
    );
  }

  /// `Add to Cart`
  String get addToCart {
    return Intl.message('Add to Cart', name: 'addToCart', desc: '', args: []);
  }

  /// `Success`
  String get success {
    return Intl.message('Success', name: 'success', desc: '', args: []);
  }

  /// `Added to cart successfully`
  String get addedToCartSuccessfully {
    return Intl.message(
      'Added to cart successfully',
      name: 'addedToCartSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Your Cart`
  String get yourCart {
    return Intl.message('Your Cart', name: 'yourCart', desc: '', args: []);
  }

  /// `Review your items`
  String get reviewYourItems {
    return Intl.message(
      'Review your items',
      name: 'reviewYourItems',
      desc: '',
      args: [],
    );
  }

  /// `Deleted successfully`
  String get deletedSuccessfully {
    return Intl.message(
      'Deleted successfully',
      name: 'deletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Total Price`
  String get totalPrice {
    return Intl.message('Total Price', name: 'totalPrice', desc: '', args: []);
  }

  /// `Place Order`
  String get placeOrder {
    return Intl.message('Place Order', name: 'placeOrder', desc: '', args: []);
  }

  /// `Choose Items First!!!!`
  String get ChooseItems {
    return Intl.message(
      'Choose Items First!!!!',
      name: 'ChooseItems',
      desc: '',
      args: [],
    );
  }

  /// `Your cart is empty`
  String get yourCartIsEmpty {
    return Intl.message(
      'Your cart is empty',
      name: 'yourCartIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to your store`
  String get wolcomeToYourStore {
    return Intl.message(
      'Welcome to your store',
      name: 'wolcomeToYourStore',
      desc: '',
      args: [],
    );
  }

  /// `Bringing you style home`
  String get bringingYouStyleHome {
    return Intl.message(
      'Bringing you style home',
      name: 'bringingYouStyleHome',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message('First Name', name: 'firstName', desc: '', args: []);
  }

  /// `Last Name`
  String get lastName {
    return Intl.message('Last Name', name: 'lastName', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `Building Number`
  String get buildingNumber {
    return Intl.message(
      'Building Number',
      name: 'buildingNumber',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `Sign In`
  String get signIn {
    return Intl.message('Sign In', name: 'signIn', desc: '', args: []);
  }

  /// `Register successfully`
  String get registerSuccessfully {
    return Intl.message(
      'Register successfully',
      name: 'registerSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Login successfully`
  String get loginSuccessfully {
    return Intl.message(
      'Login successfully',
      name: 'loginSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Your customer data for the order`
  String get YourCustomerDataForTheOrder {
    return Intl.message(
      'Your customer data for the order',
      name: 'YourCustomerDataForTheOrder',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Street Name`
  String get streetName {
    return Intl.message('Street Name', name: 'streetName', desc: '', args: []);
  }

  /// `Select Payment Method`
  String get selectPaymentMethod {
    return Intl.message(
      'Select Payment Method',
      name: 'selectPaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Choose Payment Method`
  String get choosePaymentMethod {
    return Intl.message(
      'Choose Payment Method',
      name: 'choosePaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Card Payment`
  String get cardPayment {
    return Intl.message(
      'Card Payment',
      name: 'cardPayment',
      desc: '',
      args: [],
    );
  }

  /// `PayPal Payment`
  String get paypalPayment {
    return Intl.message(
      'PayPal Payment',
      name: 'paypalPayment',
      desc: '',
      args: [],
    );
  }

  /// `Your shopping cart ({count})`
  String shoppingCartItems(int count) {
    return Intl.message(
      'Your shopping cart ($count)',
      name: 'shoppingCartItems',
      desc: 'Shows how many items are in the user\'s shopping cart',
      args: [count],
    );
  }

  /// `Products added to cart successfully`
  String get productsAddedToCartSuccessfully {
    return Intl.message(
      'Products added to cart successfully',
      name: 'productsAddedToCartSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Order placed successfully`
  String get orderPlacedSuccessfully {
    return Intl.message(
      'Order placed successfully',
      name: 'orderPlacedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Placing order...`
  String get placingOrder {
    return Intl.message(
      'Placing order...',
      name: 'placingOrder',
      desc: '',
      args: [],
    );
  }

  /// `Adding products To Cart...`
  String get addingProductsLoading {
    return Intl.message(
      'Adding products To Cart...',
      name: 'addingProductsLoading',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message('Loading...', name: 'loading', desc: '', args: []);
  }

  /// `Select a Category First`
  String get selectCategoryFirst {
    return Intl.message(
      'Select a Category First',
      name: 'selectCategoryFirst',
      desc: '',
      args: [],
    );
  }

  /// `({count}) of ({product}) just Added to Cart`
  String NotificationBody(int count, String product) {
    return Intl.message(
      '($count) of ($product) just Added to Cart',
      name: 'NotificationBody',
      desc: 'Notification Order Body and quantity',
      args: [count, product],
    );
  }

  /// `New Order`
  String get newOrder {
    return Intl.message('New Order', name: 'newOrder', desc: '', args: []);
  }

  /// `Notification permission denied. Please allow notifications.`
  String get notificationPermissionDenied {
    return Intl.message(
      'Notification permission denied. Please allow notifications.',
      name: 'notificationPermissionDenied',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
