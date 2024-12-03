import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecomerce2/Screens/models/Cubit_State_Product_Model.dart';
import 'package:flutter_ecomerce2/Screens/models/productmodel.dart';
class ModelCubit extends Cubit<ModelState>{
  List<Product> products = [] ;
  List<Product> favorites = [] ;
  List<Product> cart = [] ;
 ModelCubit() : super(ModelInitial());
 static ModelCubit get(context) => BlocProvider.of(context);
 int currentIndex = 0;
 void changeIndex(int index) {
   currentIndex = index;
   emit(InCRRMMENTModel());
 }
 void toggleFavorite(Product product){
   if(favorites.contains(product)){
     favorites.remove(product);
   }else{
     favorites.add(product);
   }emit(ModelFavoriteUpdated());
 }
 bool isFavorite(Product product){
   return favorites.contains(product);
 }
 void addToCart(Product product){
   cart.add(product);
   emit(ModelCartUpdated());
 }
 void removeFromCart(Product product){
   cart.remove(product) ;
   emit(ModelCartUpdated());
 }
  double calculateTotalPrice() {
    return cart.fold(0.0, (sum, product) => sum + product.price * product.quantity);
  }




}
