import 'package:fap/components/Button.dart';
import 'package:fap/services/expenses_brain.dart';
import 'package:fap/utilities/constants.dart';
import 'package:flutter/material.dart';

import 'Expense Create.dart';

class EditExpensePopUp extends StatefulWidget {
  EditExpensePopUp(this.eb, this.index);
  final ExpensesBrain eb;
  final int index;

  @override
  State<EditExpensePopUp> createState() => _EditExpensePopUpState(eb, index);
}

class _EditExpensePopUpState extends State<EditExpensePopUp> {
  late String price;
  late String productName;

  ExpensesBrain eb;
  int index;

  _EditExpensePopUpState(this.eb, this.index);

  @override
  Widget build(BuildContext context) {
    price = eb.getExpenseAt(index).getCost().toString();
    productName = eb.getExpenseAt(index).getProductName();
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      content: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  productName,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
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
                      Text("\$ $price", style: TextStyle(fontSize: 30)),
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
                          return EditExpense(widget.eb, widget.index);
                        },
                      ).then(
                        (value) => setState(() {}),
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
