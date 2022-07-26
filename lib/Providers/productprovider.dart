import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'productmodel.dart';

class Products with ChangeNotifier {
  bool showfav = false;
  void favchange(int x) {
    if (x == 1) showfav = true;
    if (x == 2) showfav = false;
  }

  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];
  List get items {
    if (showfav)
      return [..._items.where((element) => element.isfav == true)];
    else
      return [..._items];
    //so to not return reference to list
  }

  void delelte(String pid) {
    _items.removeWhere((element) => element.id == pid);
    notifyListeners();
  }

  List get allitems {
    return [..._items];
  }

  Product product(String id) {
    return items.firstWhere((element) => element.id == id);
  }

  void addproduct(String pid, Product pro) {
    for (Product ele in _items) {
      if (pid == ele.id) {
        ele.title = pro.title;
        ele.imageUrl = pro.imageUrl;
        ele.description = pro.description;
        ele.price = pro.price;
        return;
      }
    }
    _items.add(Product(
        id: pid,
        title: pro.title,
        description: pro.description,
        price: pro.price,
        imageUrl: pro.imageUrl));
    notifyListeners();
  }
}
