part of 'products_cubit.dart';

// @immutable
sealed class ProductsStates {
  const ProductsStates();
}

final class ProductsInit extends ProductsStates {}

final class ProductsLoading extends ProductsStates {}

final class ProductsSuccess extends ProductsStates {
  //  final ENTITY? entity;
  // const ProductsSuccess({this.entity});
}

final class ProductsError extends ProductsStates {
  final String? message;
  const ProductsError({this.message});
}

final class ProductsReOrdered extends ProductsStates {}

final class ProductsViewModeChanged extends ProductsStates {}
