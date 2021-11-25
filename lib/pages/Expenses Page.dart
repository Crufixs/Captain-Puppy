import 'package:fap/components/CustomNavBar.dart';
import 'package:fap/components/ReusableComponent.dart';
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
                      child: Text(
                        "<",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Text("Octember", style: TextContent),
                    FlatButton(
                      color: Color(0x00000000),
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

  Widget getListComponents(String picture, iconColor, color, breedName) {
    print("RAWR INSIDE");
    return ReusableComponent(
        insideComponents: Row(
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
        ),
        iconColor: iconColor,
        color: color,
        breedName: "Rawr");
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
          getListComponents("1dog", firstColor, firstTransparentColor, "Rawr"),
          getListComponents("1dog", firstColor, firstTransparentColor, "Rawr"),
          getListComponents("1dog", firstColor, firstTransparentColor, "Rawr"),
          getListComponents("1dog", firstColor, firstTransparentColor, "Rawr")
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
