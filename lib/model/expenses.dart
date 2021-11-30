class Expense {
  int _index = 0;
  String _productName = "";
  ProductType _productType = ProductType.ERROR;
  DateTime _date = DateTime.now();
  double _cost = 0;

  Expense(int index, String productName, ProductType productType, double cost,
      DateTime date) {
    this._index = index;
    this._productName = productName;
    this._productType = productType;
    this._cost = cost;
    this._date = date;
  }

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

  DateTime getDate() {
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
      'productType': _productType,
      'date': _date,
      'cost': _cost,
    };
  }
}

enum ProductType { Food, Healthcare, Utilities, Toys, ERROR }
