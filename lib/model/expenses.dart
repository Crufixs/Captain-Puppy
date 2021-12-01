import 'package:fap/services/expenses_brain.dart';

class Expense {
  int _index;
  String _productName;
  ProductType _productType;
  String _date;
  double _cost;

  Expense(this._index, this._productName, this._productType, this._cost,
      this._date);

  int getIndex() {
    return _index;
  }

  void decrementId() {
    _index--;
  }

  String getProductName() {
    return _productName;
  }

  ProductType getProductType() {
    return _productType;
  }

  double getCost() {
    return _cost;
  }

  String getDate() {
    return _date;
  }

  void setProductName(String name) {
    this._productName = name;
  }

  void setProductType(ProductType type) {
    this._productType = type;
  }

  void setCost(double cost) {
    this._cost = cost;
  }

  Map<String, dynamic> toJson() {
    return {
      'index': _index,
      'productName': _productName,
      'productType': ExpensesBrain.typeToString(_productType),
      'date': _date,
      'cost': _cost,
    };
  }
}

enum ProductType { Food, Health, Utilities, Toys, ERROR }
