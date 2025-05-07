// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(count, product) =>
      "(${count}) of (${product}) just Added to Cart";

  static String m1(count) => "Your shopping cart (${count})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "Arabic": MessageLookupByLibrary.simpleMessage("Arabic"),
    "ChooseItems": MessageLookupByLibrary.simpleMessage(
      "Choose Items First!!!!",
    ),
    "English": MessageLookupByLibrary.simpleMessage("English"),
    "HomeHeadline": MessageLookupByLibrary.simpleMessage(
      "Make Your Interior More Minimalistic & Modern",
    ),
    "HomeHeadline2": MessageLookupByLibrary.simpleMessage(
      "Turn your room with panto into a lot more minimalist and modern with ease and speed",
    ),
    "Language": MessageLookupByLibrary.simpleMessage("Language"),
    "Menu": MessageLookupByLibrary.simpleMessage("Menu"),
    "NoCategories": MessageLookupByLibrary.simpleMessage("No Categories"),
    "NotificationBody": m0,
    "Theme": MessageLookupByLibrary.simpleMessage("Theme"),
    "YourCustomerDataForTheOrder": MessageLookupByLibrary.simpleMessage(
      "Your customer data for the order",
    ),
    "addToCart": MessageLookupByLibrary.simpleMessage("Add to Cart"),
    "addedToCartSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Added to cart successfully",
    ),
    "addingProductsLoading": MessageLookupByLibrary.simpleMessage(
      "Adding products To Cart...",
    ),
    "address": MessageLookupByLibrary.simpleMessage("Address"),
    "badRequest": MessageLookupByLibrary.simpleMessage(
      "Bad request. Please check the data you\'re submitting.",
    ),
    "bringingYouStyleHome": MessageLookupByLibrary.simpleMessage(
      "Bringing you style home",
    ),
    "buildingNumber": MessageLookupByLibrary.simpleMessage("Building Number"),
    "cardPayment": MessageLookupByLibrary.simpleMessage("Card Payment"),
    "cart": MessageLookupByLibrary.simpleMessage("Cart"),
    "categories": MessageLookupByLibrary.simpleMessage("Categories"),
    "choosePaymentMethod": MessageLookupByLibrary.simpleMessage(
      "Choose Payment Method",
    ),
    "city": MessageLookupByLibrary.simpleMessage("City"),
    "connectionError": MessageLookupByLibrary.simpleMessage(
      "No internet connection. Please check your connection and try again.",
    ),
    "connectionTimeout": MessageLookupByLibrary.simpleMessage(
      "Connection timed out. Please check your internet connection or try again later.",
    ),
    "darkMode": MessageLookupByLibrary.simpleMessage("Dark Mode"),
    "deletedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Deleted successfully",
    ),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "error": MessageLookupByLibrary.simpleMessage("Error"),
    "firstName": MessageLookupByLibrary.simpleMessage("First Name"),
    "home": MessageLookupByLibrary.simpleMessage("Home"),
    "lastName": MessageLookupByLibrary.simpleMessage("Last Name"),
    "lightMode": MessageLookupByLibrary.simpleMessage("Light Mode"),
    "loading": MessageLookupByLibrary.simpleMessage("Loading..."),
    "loginExpired": MessageLookupByLibrary.simpleMessage(
      "Your session has expired. Please log in again.",
    ),
    "loginSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Login successfully",
    ),
    "moreInfo": MessageLookupByLibrary.simpleMessage("More Info"),
    "newOrder": MessageLookupByLibrary.simpleMessage("New Order"),
    "next": MessageLookupByLibrary.simpleMessage("Next"),
    "noInternetConnection": MessageLookupByLibrary.simpleMessage(
      "No internet connection. Please check your connection and try again.",
    ),
    "notFound": MessageLookupByLibrary.simpleMessage(
      "The requested resource could not be found.",
    ),
    "notificationPermissionDenied": MessageLookupByLibrary.simpleMessage(
      "Notification permission denied. Please allow notifications.",
    ),
    "orderPlacedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Order placed successfully",
    ),
    "ourCategories": MessageLookupByLibrary.simpleMessage("Our Categories"),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "paypalPayment": MessageLookupByLibrary.simpleMessage("PayPal Payment"),
    "placeOrder": MessageLookupByLibrary.simpleMessage("Place Order"),
    "placingOrder": MessageLookupByLibrary.simpleMessage("Placing order..."),
    "productsAddedToCartSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Products added to cart successfully",
    ),
    "receiveTimeout": MessageLookupByLibrary.simpleMessage(
      "The server took too long to respond. Please try again.",
    ),
    "registerSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Register successfully",
    ),
    "requestCancelled": MessageLookupByLibrary.simpleMessage(
      "The request was cancelled. Would you like to retry?",
    ),
    "requestFailed": MessageLookupByLibrary.simpleMessage(
      "Request failed. Would you like to retry?",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("Retry"),
    "reviewYourItems": MessageLookupByLibrary.simpleMessage(
      "Review your items",
    ),
    "selectCategoryFirst": MessageLookupByLibrary.simpleMessage(
      "Select a Category First",
    ),
    "selectPaymentMethod": MessageLookupByLibrary.simpleMessage(
      "Select Payment Method",
    ),
    "sendTimeout": MessageLookupByLibrary.simpleMessage(
      "Request timed out. Please try again.",
    ),
    "serverError": MessageLookupByLibrary.simpleMessage(
      "Server error. Please try again later.",
    ),
    "shoppingCartItems": m1,
    "signIn": MessageLookupByLibrary.simpleMessage("Sign In"),
    "signUp": MessageLookupByLibrary.simpleMessage("Sign Up"),
    "streetName": MessageLookupByLibrary.simpleMessage("Street Name"),
    "success": MessageLookupByLibrary.simpleMessage("Success"),
    "totalPrice": MessageLookupByLibrary.simpleMessage("Total Price"),
    "unauthorized": MessageLookupByLibrary.simpleMessage(
      "Unauthorized. Please log in again.",
    ),
    "unexpectedError": MessageLookupByLibrary.simpleMessage(
      "An unexpected error occurred. Please try again.",
    ),
    "wolcomeToYourStore": MessageLookupByLibrary.simpleMessage(
      "Welcome to your store",
    ),
    "yourCart": MessageLookupByLibrary.simpleMessage("Your Cart"),
    "yourCartIsEmpty": MessageLookupByLibrary.simpleMessage(
      "Your cart is empty",
    ),
  };
}
