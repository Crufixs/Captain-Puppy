import 'package:fap/utilities/constants.dart';
import 'package:flutter/material.dart';

class AddExpense extends StatefulWidget {
  AddExpense({required this.context});
  BuildContext context;

  @override
  State<AddExpense> createState() => _AddExpense();
}

class _AddExpense extends State<AddExpense> {
  final _formKey = GlobalKey<FormState>();

  String productName = "";
  String productType = "";
  double price = 0.0;

  Widget build(BuildContext context) {
    double hPadding = MediaQuery.of(context).size.width * 0.10;
    double vPadding = MediaQuery.of(context).size.height * 0.10;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: vPadding),
        child: Center(
          child: Column(
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
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
                        padding: EdgeInsets.all(8.0),
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
                        icon: Icon(Icons.add_shopping_cart),
                        hintText: 'What did you buy?',
                        labelText: 'Product',
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
                        icon: Icon(Icons.attach_money),
                        hintText: 'How much did it cost?',
                        labelText: 'Cost',
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
                        labelText: 'Product Type',
                        icon: Icon(Icons.person),
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
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      child: Text("Submit"),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                        }
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditExpense extends StatelessWidget {
  const EditExpense({Key? key}) : super(key: key);

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
                backgroundColor: Colors.red,
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Enter New Expense",
                  style: TextContent,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  child: Text("Submit"),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
