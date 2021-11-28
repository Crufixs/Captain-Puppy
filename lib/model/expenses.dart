class Expense {
  int _index = 0;
  String _productName = "";
  ProductType _productType = ProductType.ERROR;
  DateTime _date = DateTime.now();
  double _cost = 0;

  Expense(int index, String productName, ProductType productType, double cost) {
    this._index = index;
    this._productName = productName;
    this._productType = productType;
    this._cost = cost;
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
}

enum ProductType { Food, Healthcare, Utilities, Toys, ERROR }
