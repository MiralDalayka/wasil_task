import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasil_flutter_task/app/get_it/get_it.dart';
import 'package:wasil_flutter_task/core/common/widgets/sections/soon_page.dart';
import 'package:wasil_flutter_task/features/auth/presentation/blocs/auth_cubit.dart';
import 'package:wasil_flutter_task/features/product/data/models/product_model.dart';
import '../../../../core/common/services/shared_prefs/shared_prefs.dart';
import '../../../../core/constants/constants.dart';
import '../../../product/domain/entities/product_entity.dart';

part 'cart_states.dart';

class CartCubit extends Cubit<CartStates> {
  final Map<ProductEntity, int> _items = {};
  int _numberOfItemsInCart = 0;
  double _totalPrice = 0;

  CartCubit() : super(CartInit());
  static CartCubit get(context) => BlocProvider.of(context);

  Map<ProductEntity, int> get items => _items;
  int get numberOfItemsInCart => _numberOfItemsInCart;
  double get totalPrice => _totalPrice;

  void addToCart(ProductEntity product, int quantity) {
    _totalPrice += (product.price * quantity);
    if (_items.containsKey(product)) {
      _items[product] = _items[product]! + quantity;
    } else {
      _items[product] = quantity;
      _numberOfItemsInCart++;
    }
    _updateUserCartStoredList();

    emit(CartUpdated());
  }

  void removeFromCart(ProductEntity product) {
    if (_items.containsKey(product)) {
      final quantity = _items[product]!;
      _totalPrice -= (product.price * quantity);
      _items.remove(product);
      _numberOfItemsInCart--;
      _updateUserCartStoredList();

      emit(CartUpdated());
    }
  }

  void increaseQuantity(ProductEntity product) {
    if (_items.containsKey(product)) {
      _totalPrice += product.price;
      _items[product] = _items[product]! + 1;
      _updateUserCartStoredList();

      emit(CartUpdated());
    }
  }

  void decreaseQuantity(ProductEntity product) {
    if (_items.containsKey(product)) {
      final currentQuantity = _items[product]!;

      if (currentQuantity > 1) {
        _totalPrice -= product.price;
        _items[product] = currentQuantity - 1;
        emit(CartUpdated());
      } else {
        removeFromCart(product);
      }
      _updateUserCartStoredList();
    }
  }

  void checkout() {
    serviceLocator<AuthCubit>().authMode(SoonPage());
    emit(CartCheckout());
  }

  void clearCart() {
    _items.clear();
    emit(CartCreated());
  }

  void _updateUserCartStoredList() {
    List<Map<String, dynamic>> itemsList =
        _items.entries.map((entry) {
          return {
            'product': ProductModel.toJson(entity: entry.key),
            'quantity': entry.value,
          };
        }).toList();

    SharedPrefs.setString(Constants.cartListKey, jsonEncode(itemsList));
  }

  void loadUserCart() {
    String? cartData = SharedPrefs.getString(Constants.cartListKey);

    if (cartData == null || cartData.trim().isEmpty) {
      emit(CartUpdated());
      return;
    }

    try {
      List<dynamic> itemsList = jsonDecode(cartData);

      _items.clear();
      _numberOfItemsInCart = 0;
      _totalPrice = 0;

      for (var item in itemsList) {
        ProductEntity product = ProductModel.fromJson(item['product']);
        int quantity = item['quantity'];
        _items[product] = quantity;
        _numberOfItemsInCart += quantity;
        _totalPrice += (product.price * quantity);
      }

      emit(CartUpdated());
    } catch (e) {
      _items.clear();
      _numberOfItemsInCart = 0;
      _totalPrice = 0;
      emit(CartUpdated());
    }
  }
}
