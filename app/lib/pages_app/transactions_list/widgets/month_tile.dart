import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:scontreeno/misc/palette.dart';

class MonthTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12.0),
      clipBehavior: Clip.antiAlias,
      elevation: 6.0,
      shadowColor: Colors.black26,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Material(
        borderRadius: BorderRadius.circular(12.0),
        clipBehavior: Clip.antiAlias,
        elevation: 6.0,
        shadowColor: Colors.black26,
        child: SizedBox.fromSize(
          size: Size.fromHeight(156.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: AbsorbPointer(
                  absorbing: true,
                  child: LineChart(
                    LineChartData(
                      borderData: FlBorderData(show: false),
                      titlesData: FlTitlesData(show: false),
                      gridData: FlGridData(
                        show: true,
                        drawVerticalGrid: false,
                        drawHorizontalGrid: false,
                      ),
                      maxX: 30,
                      maxY: 40,
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(10, 20),
                            FlSpot(13, 35),
                            FlSpot(19, 30),
                            FlSpot(25, 25),
                          ],
                          isCurved: true,
                          isStrokeCapRound: true,
                          colors: [Palette.lightBlue],
                          dotData: FlDotData(show: false),
                        ),
                      ],
                    ),
                    swapAnimationDuration: Duration(milliseconds: 350),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'Novembre',
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '€376,21',
                      style: TextStyle(
                        color: Palette.lightBlue,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '13 scontrini',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: SizedBox(
                        height: 32.0,
                        width: 32.0,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: PieChart(
                            PieChartData(
                              sections: [
                                PieChartSectionData(
                                    value: 4,
                                    showTitle: false,
                                    color: Colors.lightBlue),
                                PieChartSectionData(
                                    value: 6,
                                    showTitle: false,
                                    color: Colors.red),
                                PieChartSectionData(
                                    value: 2,
                                    showTitle: false,
                                    color: Palette.lightBlue),
                              ],
                              borderData: FlBorderData(show: false),
                            ),
                            swapAnimationDuration: Duration(milliseconds: 350),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
