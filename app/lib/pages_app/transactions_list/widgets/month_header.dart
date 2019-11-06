import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:scontreeno/misc/palette.dart';

class MonthHeader extends StatelessWidget {
  final bool showMonthHeader;
  const MonthHeader({Key key, @required this.showMonthHeader})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.fromHeight(156.0 + MediaQuery.of(context).padding.top),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
        opacity: showMonthHeader ? 1.0 : 0.0,
        child: Material(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(24.0),
          ),
          clipBehavior: Clip.antiAlias,
          shadowColor: Colors.black54,
          color: Palette.lightBlue,
          elevation: 6.0,
          child: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
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
                            colors: [Colors.white],
                            dotData: FlDotData(show: false),
                            barWidth: 5.0,
                          ),
                        ],
                      ),
                      swapAnimationDuration: Duration(milliseconds: 350),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(24.0).copyWith(left: 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'Novembre',
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '€376,21',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '13 scontrini',
                        style: TextStyle(color: Colors.white70),
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
                                    color: Colors.lightBlue,
                                  ),
                                  PieChartSectionData(
                                    value: 6,
                                    showTitle: false,
                                    color: Colors.red,
                                  ),
                                  PieChartSectionData(
                                    value: 2,
                                    showTitle: false,
                                    color: Colors.white,
                                  ),
                                ],
                                borderData: FlBorderData(show: false),
                              ),
                              swapAnimationDuration:
                                  Duration(milliseconds: 350),
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
      ),
    );
  }
}
