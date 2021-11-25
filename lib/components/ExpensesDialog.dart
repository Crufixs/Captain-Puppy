import 'package:fap/utilities/constants.dart';
import 'package:flutter/material.dart';

class ExpensesDialog extends StatelessWidget {
  ExpensesDialog({required this.context});
  BuildContext context;
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
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
          Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Enter New Expense",
                    style: TextContent,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.add_shopping_cart),
                      hintText: 'What did you buy?',
                      labelText: 'Product',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.numberWithOptions(
                        decimal: true, signed: false),
                    decoration: const InputDecoration(
                      icon: Icon(Icons.attach_money),
                      hintText: 'How much did it cost?',
                      labelText: 'Cost',
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: DropDownFormField(
                      titleText: 'My workout',
                      hintText: 'Please choose one',
                      value: _myActivity,
                      onSaved: (value) {
                        setState(() {
                          _myActivity = value;
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          _myActivity = value;
                        });
                      },
                      dataSource: [
                        {
                          "display": "Running",
                          "value": "Running",
                        },
                        {
                          "display": "Climbing",
                          "value": "Climbing",
                        },
                        {
                          "display": "Walking",
                          "value": "Walking",
                        },
                        {
                          "display": "Swimming",
                          "value": "Swimming",
                        },
                        {
                          "display": "Soccer Practice",
                          "value": "Soccer Practice",
                        },
                        {
                          "display": "Baseball Practice",
                          "value": "Baseball Practice",
                        },
                        {
                          "display": "Football Practice",
                          "value": "Football Practice",
                        },
                      ],
                      textField: 'display',
                      valueField: 'value',
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
          ),
        ],
      ),
    );
  }
}

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({Key? key}) : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      value: dropdownValue,
      icon: const Icon(Icons.airline_seat_legroom_extra),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
