part of 'cart_cubit.dart';

// @immutable
sealed class CartStates {
  const CartStates();
}

final class CartInit extends CartStates {}

final class CartUpdated extends CartStates {}

final class CartCheckout extends CartStates {}

final class CartCreated extends CartStates {}
