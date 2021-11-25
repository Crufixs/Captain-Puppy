import 'package:fap/components/ExpensesDialog.dart';
import 'package:fap/components/ReusableComponent.dart';
import 'package:fap/services/expenses_brain.dart';
import 'package:fap/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ExpensesPage extends StatefulWidget {
  ExpensesPage({required this.eb});
  ExpensesBrain eb;
  @override
  _ExpensesPageState createState() => _ExpensesPageState(eb: eb);
}

enum ExpensesMode { summary, list }

class _ExpensesPageState extends State<ExpensesPage> {
  _ExpensesPageState({required this.eb});
  ExpensesBrain eb;
  @override
  ExpensesMode current = ExpensesMode.summary;
  int touchedIndex = -1;
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Text(
                "EXPENSES",
                style: TextTitle,
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Row(
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: FlatButton(
                          height: 55,
                          color: current == ExpensesMode.summary
                              ? firstColor
                              : firstTransparentColor,
                          onPressed: () {
                            setState(() {
                              current = ExpensesMode.summary;
                            });
                          },
                          child: Text(
                            "Summary",
                            style: TextForButton,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: FlatButton(
                          height: 55,
                          color: current == ExpensesMode.list
                              ? firstColor
                              : firstTransparentColor,
                          onPressed: () {
                            setState(() {
                              current = ExpensesMode.list;
                            });
                          },
                          child: Text(
                            "List",
                            style: TextForButton,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Row(
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      color: Color(0x00000000),
                      onPressed: () {},
                      child: Icon(Icons.arrow_back),
                    ),
                    Text("Octember", style: TextContent),
                    FlatButton(
                      color: Color(0x00000000),
                      onPressed: () {},
                      child: Icon(Icons.arrow_forward),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Text(
                "Total Expenses: 0",
                style: TextContent,
              ),
            ),
            current == ExpensesMode.summary
                ? getSummarySection()
                : getListSection(),
          ],
        ),
      ),
    );
  }

  Widget getListComponents(String type, String cost, String date,
      String productName, String picture, iconColor, color) {
    print("RAWR INSIDE");
    return ReusableComponent(
        insideComponents: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DecoratedBox(
              child: Container(
                //color: Colors.deepOrangeAccent,
                padding: const EdgeInsets.all(8.00),
                width: 100,
                height: 100,
                child: Image.asset(
                  'icons/dog_icons/$picture.png',
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: iconColor,
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      type,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      cost,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                //color: Colors.red,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    date,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        function: showEditExpenseDialog,
        iconColor: iconColor,
        color: color,
        title: "Rawr");
  }

  void showEditExpenseDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return EditExpense();
      },
    );
  }

  Widget getSummarySection() {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.90,
      child: Container(
        child: PieChart(
          PieChartData(
            pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
              setState(() {
                if (!event.isInterestedForInteractions ||
                    pieTouchResponse == null ||
                    pieTouchResponse.touchedSection == null) {
                  touchedIndex = -1;
                  return;
                }
                touchedIndex =
                    pieTouchResponse.touchedSection!.touchedSectionIndex;
              });
            }),
            borderData: FlBorderData(
              show: false,
            ),
            sectionsSpace: 0,
            centerSpaceRadius: 0,
            sections: showingSections(),
          ),
          swapAnimationDuration: Duration(milliseconds: 150), // Optional
          swapAnimationCurve: Curves.linear, // Optional
        ),
      ),
    );
  }

  Widget getListSection() {
    print("rawr");
    return SizedBox(
      child: Column(
        children: [
          getListComponents("Type", "Cost", "Date", "ProductName", "1dog",
              firstColor, firstTransparentColor),
          getListComponents("Type", "Cost", "Date", "ProductName", "1dog",
              firstColor, firstTransparentColor),
          getListComponents("Type", "Cost", "Date", "ProductName", "1dog",
              firstColor, firstTransparentColor),
          getListComponents("Type", "Cost", "Date", "ProductName", "1dog",
              firstColor, firstTransparentColor)
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 15.0 : 12.0;
      final radius = isTouched
          ? MediaQuery.of(context).size.width * 0.35
          : MediaQuery.of(context).size.width * 0.325;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 40,
            title: 'Food\n300 Pesos',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 30,
            title: 'Utilities\n300 Pesos',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 15,
            title: 'Toys\n300 Pesos',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 15,
            title: 'Health Care\n300 Pesos',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
  }
}
