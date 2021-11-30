import 'package:fap/components/Button.dart';
import 'package:fap/components/ExpensesDialog.dart';
import 'package:fap/components/Indicator.dart';
import 'package:fap/components/ReusableComponent.dart';
import 'package:fap/model/expenses.dart';
import 'package:fap/services/expenses_brain.dart';
import 'package:fap/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class ExpensesPage extends StatefulWidget {
  ExpensesPage({required this.eb, Key? key}) : super(key: key);

  ExpensesBrain eb;
  @override
  ExpensesPageState createState() => ExpensesPageState(eb: eb);
}

enum ExpensesMode { summary, list }

class ExpensesPageState extends State<ExpensesPage> {
  ExpensesPageState({required this.eb});
  ExpensesBrain eb;
  @override
  ExpensesMode current = ExpensesMode.summary;
  int touchedIndex = -1;

  void updateState() {
    setState(() {});
  }

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
                        child: Button(
                          hPadding: 10,
                          vPadding: 20,
                          color: current == ExpensesMode.summary
                              ? firstColor
                              : firstTransparentColor,
                          onClicked: () {
                            setState(() {
                              current = ExpensesMode.summary;
                            });
                          },
                          text: "Summary",
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Button(
                          hPadding: 10,
                          vPadding: 20,
                          color: current == ExpensesMode.list
                              ? firstColor
                              : firstTransparentColor,
                          onClicked: () {
                            setState(() {
                              current = ExpensesMode.list;
                            });
                          },
                          text: "List",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Total Expenses: \$" +
                      (eb.getTotalHealthCare() +
                              eb.getTotalToy() +
                              eb.getTotalUtilities() +
                              eb.getTotalFood())
                          .toStringAsFixed(2),
                  style: TextContent,
                ),
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

  Widget getListComponents(
      int index, String productName, String type, String cost, String date) {
    Color color = Colors.red;
    switch (eb.StringToType(type)) {
      case ProductType.Toys:
        color = secondColor;
        break;
      case ProductType.Healthcare:
        color = fourthColor;
        break;
      case ProductType.Utilities:
        color = thirdColor;
        break;
      case ProductType.Food:
        color = pieChartColor4;
        break;
    }

    var brightness = MediaQuery.of(context).platformBrightness;
    print(brightness);

    return ReusableComponent(
        insideComponents: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
                        fontSize: 18,
                        color: brightness == Brightness.dark ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      type,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      cost,
                      style: TextStyle(
                        fontSize: 15,
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
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        index: index,
        height: 100,
        function: showEditExpenseDialog,
        color: color,
        title: "Rawr");
  }

  Future<void> showEditExpenseDialog(context, int index) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return EditExpensePopUp(eb, index);
      },
    );
    setState(() {});
  }

  Widget getSummarySection() {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.75,
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
              centerSpaceRadius: 30,
              sections: showingSections(),
            ),
            swapAnimationDuration: Duration(milliseconds: 150), // Optional
            swapAnimationCurve: Curves.linear, // Optional
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Indicator(
                color: secondColor,
                text: 'Toys',
                isSquare: false,
                size: touchedIndex == 0 ? 18 : 16,
                textWeight:
                    touchedIndex == 0 ? FontWeight.bold : FontWeight.normal,
              ),
              Indicator(
                color: fourthColor,
                text: 'Utilities',
                isSquare: false,
                size: touchedIndex == 1 ? 18 : 16,
                textWeight:
                    touchedIndex == 1 ? FontWeight.bold : FontWeight.normal,
              ),
              Indicator(
                color: thirdColor,
                text: 'Food',
                isSquare: false,
                size: touchedIndex == 2 ? 18 : 16,
                textWeight:
                    touchedIndex == 2 ? FontWeight.bold : FontWeight.normal,
              ),
              Indicator(
                color: pieChartColor4,
                text: 'Healthcare',
                isSquare: false,
                size: touchedIndex == 3 ? 18 : 16,
                textWeight:
                    touchedIndex == 3 ? FontWeight.bold : FontWeight.normal,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget getListSection() {
    final ListChildren = <Widget>[];
    for (Expense e in eb.getListOfExpenses()) {
      int index = e.getIndex();
      String productName = e.getProductName();
      String type = eb.TypeToString(e.getProductType());
      String cost = "\$" + e.getCost().toStringAsFixed(2);
      String date = DateFormat.yMMMd().format(e.getDate());
      ListChildren.add(getListComponents(index, productName, type, cost, date));
    }
    return SizedBox(
      child: Column(
        children: ListChildren,
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    double totalFood = eb.getTotalFood();
    double totalUtilities = eb.getTotalUtilities();
    double totalToys = eb.getTotalToy();
    double totalHealth = eb.getTotalHealthCare();
    double totaltotal = totalHealth + totalUtilities + totalToys + totalHealth;

    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 18.0;
      final radius = isTouched
          ? MediaQuery.of(context).size.width * 0.25
          : MediaQuery.of(context).size.width * 0.225;
      switch (i) {
        case 0:
          //TOYS
          return PieChartSectionData(
            color: secondColor,
            value: totalToys,
            title: (totalToys / totaltotal * 100).toStringAsFixed(2) + '%',
            radius: radius,
            titleStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: fontSize,
            ),
          );
        case 1:
          //UTILITIES
          return PieChartSectionData(
            color: fourthColor,
            value: totalUtilities,
            title: (totalUtilities / totaltotal * 100).toStringAsFixed(2) + '%',
            radius: radius,
            titleStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: fontSize,
            ),
          );
        case 2:
          //FOOD
          return PieChartSectionData(
            color: thirdColor,
            value: totalFood,
            title: (totalFood / totaltotal * 100).toStringAsFixed(2) + '%',
            radius: radius,
            titleStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: fontSize,
            ),
          );
        case 3:
          //HEALTHCARE
          return PieChartSectionData(
            color: pieChartColor4,
            value: totalHealth,
            title: (totalHealth / totaltotal * 100).toStringAsFixed(2) + '%',
            radius: radius,
            titleStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: fontSize,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
