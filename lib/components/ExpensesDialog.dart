import 'package:fap/components/Button.dart';
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
  double price = 0.0;

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
                        text: "Submit",
                        onClicked: () {},
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
  const EditExpensePopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("XD");
    return AlertDialog(
      content: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            right: -40.0,
            top: -40.0,
            child: InkResponse(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                child: Icon(Icons.close),
                backgroundColor: fourthColor,
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text("Product Name", style: TextStyle(fontSize: 40)),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  child: Text("\$ Price", style: TextStyle(fontSize: 20)),
                ),
              ),
              Row(children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Button(
                    text: "Edit",
                    onClicked: () {},
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Button(
                      text: "Delete",
                      onClicked: () {},
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
  EditExpense(
      {required this.productName,
      required this.productType,
      required this.price,
      required this.eb});
  ExpensesBrain eb;
  String productName;
  String productType;
  double price;
  @override
  _EditExpenseState createState() => _EditExpenseState(
        eb: eb,
        productName: productName,
        productType: productType,
        price: price,
      );
}

class _EditExpenseState extends State<EditExpense> {
  _EditExpenseState(
      {required this.productName,
      required this.productType,
      required this.price,
      required this.eb});
  final _formKey = GlobalKey<FormState>();

  ExpensesBrain eb;
  String productName;
  String productType;
  double price;

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
                        initialValue: productName,
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
                        initialValue: price.toString(),
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
                        text: "Submit",
                        onClicked: () {},
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
