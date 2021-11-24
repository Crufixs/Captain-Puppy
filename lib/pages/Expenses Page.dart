import 'package:fap/components/CustomNavBar.dart';
import 'package:fap/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ExpensesPage extends StatefulWidget {
  @override
  _ExpensesPageState createState() => _ExpensesPageState();
}

enum ExpensesMode { summary, list }

class _ExpensesPageState extends State<ExpensesPage> {
  @override
  ExpensesMode current = ExpensesMode.summary;
  int touchedIndex = -1;
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text(
                "EXPENSES",
                style: TextTitle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 4),
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
                    padding: const EdgeInsets.only(left: 4, right: 8),
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
          Expanded(
            child: Row(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  color: Colors.white,
                  onPressed: () {},
                  child: Text(
                    "<",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                Text("Octember", style: TextContent),
                FlatButton(
                  color: Colors.white,
                  onPressed: () {},
                  child: Text(
                    ">",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              "Total Expenses: 0",
              style: TextContent,
            ),
          ),
          Expanded(
            flex: 8,
            child: current == ExpensesMode.summary
                ? getSummarySection()
                : getListSection(),
          ),
        ],
      ),
    );
  }

  Widget getListComponents(String picture, iconColor, breedName) {
    return Row(
      children: [
        DecoratedBox(
          child: Container(
            padding: const EdgeInsets.all(8.00),
            width: 70,
            height: 70,
            child: Image.asset(
              'icons/dog_icons/$picture.png',
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: iconColor,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                breedName,
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Flexible(
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget getSummarySection() {
    return PieChart(
      PieChartData(
        pieTouchData:
            PieTouchData(touchCallback: (FlTouchEvent event, pieTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                pieTouchResponse == null ||
                pieTouchResponse.touchedSection == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
          });
        }),
        borderData: FlBorderData(
          show: false,
        ),
        sectionsSpace: 0,
        centerSpaceRadius: 40,
        sections: showingSections(),
      ),
      swapAnimationDuration: Duration(milliseconds: 150), // Optional
      swapAnimationCurve: Curves.linear, // Optional
    );
  }

  Widget getListSection() {
    final children = <Widget>[];
    children.add(getListComponents("1dog", Colors.red, "Rawr"));
    children.add(getListComponents("2dog", Colors.red, "Rawr"));
    children.add(getListComponents("3dog", Colors.red, "Rawr"));
    return ListView(
      children: children,
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 15.0 : 12.0;
      final radius = isTouched ? 125.0 : 120.0;
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
