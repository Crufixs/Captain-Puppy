import 'package:fap/model/expenses.dart';
import 'package:fap/pages/Expenses%20Page.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ExpensesBrain {
  double _totalFoodExpense = 0;
  double _totalUtilityExpense = 0;
  double _totalHealthCareExpense = 0;
  double _totalToyExpense = 0;

  List<Expense> _listOfExpenses = [];

  ExpensesBrain() {
    addExpense("productName1", "Food", 12);
    addExpense("productName2", "Utilities", 15);
    addExpense("productName3", "Healthcare", 19);
    addExpense("productName4", "Toys", 24);
    setTotal();
  }

  void setTotal() {
    for (Expense e in _listOfExpenses) {
      ProductType type = e.getProductType();
      switch (type) {
        case ProductType.Food:
          _totalFoodExpense += e.getCost();
          break;
        case ProductType.Utilities:
          _totalUtilityExpense += e.getCost();
          break;
        case ProductType.Healthcare:
          _totalHealthCareExpense += e.getCost();
          break;
        case ProductType.Toys:
          _totalToyExpense += e.getCost();
          break;
      }
    }
  }

  void addExpense(String productName, String productType, double cost) {
    Expense e = new Expense(
        _listOfExpenses.length, productName, StringToType(productType), cost);
    _listOfExpenses.add(e);
    setTotal();
  }

  void deleteExpense(int index) {
    _listOfExpenses.removeAt(index);
    for (int i = index; i < _listOfExpenses.length; i++) {
      _listOfExpenses[i].decrementId();
    }
    setTotal();
  }

  ProductType StringToType(String pt) {
    switch (pt) {
      case "Food":
        return ProductType.Food;
      case "Utilities":
        return ProductType.Utilities;
      case "Healthcare":
        return ProductType.Healthcare;
      case "Toys":
        return ProductType.Toys;
      default:
        return ProductType.ERROR;
    }
  }

  String TypeToString(ProductType pt) {
    switch (pt) {
      case ProductType.Food:
        return "Food";
      case ProductType.Utilities:
        return "Utilities";
      case ProductType.Healthcare:
        return "Healthcare";
      case ProductType.Toys:
        return "Toys";
      default:
        return "ERROR";
    }
  }

  Expense getExpenseAt(int index) {
    return _listOfExpenses[index];
  }

  List getListOfExpenses() {
    return _listOfExpenses;
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

  double getTotalHealthCare() {
    return _totalHealthCareExpense;
  }
}
