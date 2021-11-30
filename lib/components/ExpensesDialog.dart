import 'package:fap/components/Button.dart';
import 'package:fap/model/User.dart';
import 'package:fap/model/expenses.dart';
import 'package:fap/services/expenses_brain.dart';
import 'package:fap/utilities/constants.dart';
import 'package:flutter/material.dart';

class AddExpense extends StatefulWidget {
  AddExpense({required this.eb});
  ExpensesBrain eb;

  @override
  State<AddExpense> createState() => _AddExpense(eb: eb);
}

class _AddExpense extends State<AddExpense> {
  _AddExpense({required this.eb});
  final _formKey = GlobalKey<FormState>();
  ExpensesBrain eb;

  String productName = "";
  String productType = "";
  String price = "";
  late final productNameListener;
  late final productCostListener;
  late final int index;

  void initState() {
    index = User.expenses.length;

    super.initState();
    productNameListener = TextEditingController(text: productName);
    productCostListener = TextEditingController(text: price.toString());

    productNameListener.addListener(() {
      productName = productNameListener.text;
      //print("Current Value: ${productNameListener.text}");
    });
    productCostListener.addListener(() {
      price = productCostListener.text;
      //print("Current Type ${productCostListener.text}");
    });
  }

  Widget build(BuildContext context) {
    double hPadding = MediaQuery.of(context).size.width;
    double vPadding = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: hPadding * 0.1),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkResponse(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.red,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(25.0),
                          child: Center(
                            child: Text(
                              "New Expense",
                              style: TextContent,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.add_shopping_cart,
                            color: fourthColor,
                          ),
                          focusColor: Colors.red,
                          hintText: 'What did you buy?',
                          labelText: 'Product',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        controller: productNameListener,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        onChanged: (text) {},
                        keyboardType: TextInputType.numberWithOptions(
                            decimal: true, signed: false),
                        decoration: const InputDecoration(
                          icon: Icon(Icons.attach_money, color: fourthColor),
                          hintText: 'How much did it cost?',
                          labelText: 'Cost',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        controller: productCostListener,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter numbers';
                          } else if (double.tryParse(value) == null) {
                            return 'Please enter valid numbers';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: DropdownButtonFormField<String>(
                        validator: (value) {
                          if (value == null) {
                            return 'Choose atleast one';
                          }
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          labelText: 'Product Type',
                          icon: Icon(Icons.person, color: fourthColor),
                        ),
                        items: <String>['Food', 'Utilities', 'Toys', 'Health']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            productType = newValue!;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: vPadding * 0.1,
                      ),
                      child: Button(
                        color: firstColor,
                        vPadding: 15,
                        hPadding: 40,
                        text: "Submit",
                        onClicked: () {
                          if (_formKey.currentState!.validate()) {
                            eb.addExpense(
                                productName, productType, double.parse(price));
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EditExpensePopUp extends StatelessWidget {
  final ExpensesBrain eb;
  final int index;

  EditExpensePopUp(this.eb, this.index) {
    price = eb.getExpenseAt(index).getCost().toString();
    productName = eb.getExpenseAt(index).getProductName();
  }
  late Function updateState;
  late String price;
  late String productName;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      // backgroundColor: Color(0xffF2865E),
      content: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text("PRODUCT NAME",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              ),
              Divider(
                thickness: 2,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("\$ Price", style: TextStyle(fontSize: 30)),
                    ],
                  ),
                ),
              ),
              Row(children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Button(
                    color: thirdColor,
                    vPadding: 10,
                    hPadding: 30,
                    text: "Edit",
                    onClicked: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return EditExpense(eb, index);
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Button(
                      color: thirdColor,
                      vPadding: 10,
                      hPadding: 30,
                      text: "Delete",
                      onClicked: () async {
                        await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ReconfirmationDeleteExpense(
                              eb: eb,
                              index: index,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ])
            ],
          ),
        ],
      ),
    );
  }
}

class ReconfirmationDeleteExpense extends StatelessWidget {
  ReconfirmationDeleteExpense({
    required this.eb,
    required this.index,
  });
  final int index;
  final ExpensesBrain eb;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text("Are you sure you want to delete this?",
                    style: TextStyle(fontSize: 20)),
              ),
              Row(children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Button(
                    color: firstColor,
                    vPadding: 10,
                    hPadding: 30,
                    text: "Cancel",
                    onClicked: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Button(
                      color: firstColor,
                      vPadding: 10,
                      hPadding: 30,
                      text: "Confirm",
                      onClicked: () {
                        eb.deleteExpense(index);
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ])
            ],
          ),
        ],
      ),
    );
  }
}

class EditExpense extends StatefulWidget {
  final ExpensesBrain eb;
  final int index;

  EditExpense(this.eb, this.index);

  @override
  _EditExpenseState createState() => _EditExpenseState(
        eb: eb,
        index: index,
      );
}

class _EditExpenseState extends State<EditExpense> {
  _EditExpenseState({required this.eb, required this.index});
  final _formKey = GlobalKey<FormState>();
  late final productNameListener;
  late final productCostListener;
  int index;
  ExpensesBrain eb;
  late String productName;
  late String productType;
  late String price;

  @override
  void dispose() {
    productNameListener.dispose();
    productCostListener.dispose();
    super.dispose();
  }

  @override
  void initState() {
    productName = eb.getExpenseAt(index).getProductName();
    productType =
        ExpensesBrain.TypeToString(eb.getExpenseAt(index).getProductType());
    price = eb.getExpenseAt(index).getCost().toString();

    super.initState();
    productNameListener = TextEditingController(text: productName);
    productCostListener = TextEditingController(text: price.toString());

    // Start listening to changes.
    productNameListener.addListener(() {
      productName = productNameListener.text;
      //print("Current Name: ${productNameListener.text}");
    });
    productCostListener.addListener(() {
      price = productCostListener.text;
      //print("Current Type ${productCostListener.text}");
    });
  }

  @override
  Widget build(BuildContext context) {
    double hPadding = MediaQuery.of(context).size.width;
    double vPadding = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: hPadding * 0.1),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkResponse(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.red,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(25.0),
                          child: Center(
                            child: Text(
                              "Edit Expense",
                              style: TextContent,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.add_shopping_cart,
                            color: fourthColor,
                          ),
                          focusColor: Colors.red,
                          hintText: 'What did you buy?',
                          labelText: 'Product',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        controller: productNameListener,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        onChanged: (text) {},
                        keyboardType: TextInputType.numberWithOptions(
                            decimal: true, signed: false),
                        decoration: const InputDecoration(
                          icon: Icon(Icons.attach_money, color: fourthColor),
                          hintText: 'How much did it cost?',
                          labelText: 'Cost',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        controller: productCostListener,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter numbers';
                          } else if (double.tryParse(value) == null) {
                            return 'Please enter valid numbers';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: DropdownButtonFormField<String>(
                        validator: (value) {
                          if (value == null) {
                            return 'Choose atleast one';
                          }
                        },
                        value: productType,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          labelText: 'Product Type',
                          icon: Icon(Icons.person, color: fourthColor),
                        ),
                        items: <String>['Food', 'Utilities', 'Toys', 'Health']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            productType = newValue!;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: vPadding * 0.1,
                      ),
                      child: Button(
                        color: firstColor,
                        text: "Submit",
                        vPadding: 15,
                        hPadding: 40,
                        onClicked: () {
                          if (_formKey.currentState!.validate()) {
                            Expense e = eb.getExpenseAt(index);
                            e.setProductName(productName);
                            e.setProductType(
                                ExpensesBrain.StringToType(productType));
                            e.setCost(double.parse(price));
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
