import 'dart:convert';

import 'package:fap/model/User.dart';
import 'package:fap/model/expenses.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExpensesBrain {
  double _totalFoodExpense = 0;
  double _totalUtilityExpense = 0;
  double _totalHealthExpense = 0;
  double _totalToyExpense = 0;

  ExpensesBrain() {
    setTotal();
  }

  void setTotal() {
    _totalFoodExpense = 0;
    _totalUtilityExpense = 0;
    _totalHealthExpense = 0;
    _totalToyExpense = 0;
    for (Expense e in User.expenses) {
      ProductType type = e.getProductType();
      switch (type) {
        case ProductType.Food:
          _totalFoodExpense += e.getCost();
          break;
        case ProductType.Utilities:
          _totalUtilityExpense += e.getCost();
          break;
        case ProductType.Health:
          _totalHealthExpense += e.getCost();
          break;
        case ProductType.Toys:
          _totalToyExpense += e.getCost();
          break;
      }
    }
  }

  void addExpense(String productName, String productType, double cost) async {
    Expense e = new Expense(
        User.expenses.length,
        productName,
        StringToType(productType),
        cost,
        DateFormat.yMMMd().format(DateTime.now()));
    SharedPreferences roar = await SharedPreferences.getInstance();
    User.expenses.add(e);
    String json = jsonEncode(User.toJson());
    roar.setString("userData", json);
    setTotal();
  }

  void deleteExpense(int index) async {
    User.expenses.removeAt(index);
    for (int i = index; i < User.expenses.length; i++) {
      User.expenses[i].decrementId();
    }
    SharedPreferences roar = await SharedPreferences.getInstance();
    String json = jsonEncode(User.toJson());
    roar.setString("userData", json);
    setTotal();
  }

  static ProductType StringToType(String pt) {
    switch (pt) {
      case "Food":
        return ProductType.Food;
      case "Utilities":
        return ProductType.Utilities;
      case "Health":
        return ProductType.Health;
      case "Toys":
        return ProductType.Toys;
      default:
        return ProductType.ERROR;
    }
  }

  static String TypeToString(ProductType pt) {
    switch (pt) {
      case ProductType.Food:
        return "Food";
      case ProductType.Utilities:
        return "Utilities";
      case ProductType.Health:
        return "Health";
      case ProductType.Toys:
        return "Toys";
      default:
        return "ERROR";
    }
  }

  Expense getExpenseAt(int index) {
    return User.expenses[index];
  }

  double getTotalToy() {
    return _totalToyExpense;
  }

  double getTotalUtilities() {
    return _totalUtilityExpense;
  }

  double getTotalFood() {
    return _totalFoodExpense;
  }

  double getTotalHealth() {
    return _totalHealthExpense;
  }
}
