import 'package:flutter/material.dart';


class Product {
  String name;
  double price;
  int qty=1;
  int qntty;
  List imagesUrl;
  String documentId;
  String suppId;
  Product({
    required this.name,
    required this.suppId,
    required this.imagesUrl,
    required this.qntty,
    required this.qty,
    required this.documentId,
    required this.price,

  });
}

class Cart extends ChangeNotifier{
  final List<Product> _list=[];
   List<Product> get getItems{
    return _list;
   } 
   int? get count{
    return _list.length;
    
   }
   void addItem(
      String name,
  double price,
  int qty,
  int qntty,
  List imagesUrl,
  String documentId,
  String suppId,
   ){final product =Product(

    name:name,
    price:price,
    qty:qty,
    qntty:qntty,
    imagesUrl:imagesUrl,
    documentId:documentId,
    suppId:suppId);
    _list.add(product);
    notifyListeners();  

   }
}