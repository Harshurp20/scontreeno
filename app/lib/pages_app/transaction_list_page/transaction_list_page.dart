import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:scontreeno/misc/palette.dart';
import 'package:scontreeno/pages_app/transaction_list_page/widgets/newappbar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:scontreeno/states/general_state.dart';

class TransactionListPage extends StatefulWidget {
  @override
  _TransactionListPageState createState() => _TransactionListPageState();
}

class _TransactionListPageState extends State<TransactionListPage> {
  GeneralState _notifier;
  TextEditingController _searchController;
  ScrollController _scrollController;
  bool _showMonthHeader = false;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(_scrollNotifier);
  }

  void _scrollNotifier() {
    if ((!_showMonthHeader && _scrollController.offset > 200.0) ||
        (_showMonthHeader && _scrollController.offset <= 200.0))
      setState(() {
        _showMonthHeader = !_showMonthHeader;
      });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_notifier == null) _notifier = Provider.of<GeneralState>(context);
    if (_searchController == null)
      _searchController = new TextEditingController();
    return Scaffold(
      bottomSheet: Container(
        color: _notifier.nfcStatus ? Palette.lightBlue : Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                _notifier.nfcStatus ? 'NFC attivo' : 'NFC disattivato',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 24.0,
                child: Switch(
                  value: _notifier.nfcStatus,
                  onChanged: (_) => _notifier.changeNFCState(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: !_notifier.nfcStatus
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FloatingActionButton.extended(
                  label: Text('Scansione QR'),
                  icon: Icon(Icons.camera_alt),
                  foregroundColor: Colors.white,
                  backgroundColor: Palette.lightBlue,
                  onPressed: () {},
                ),
                SizedBox(
                  height: 32.0,
                ),
              ],
            )
          : null,
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          NewAppBar(),
          ListView(
            controller: _scrollController,
            padding: EdgeInsets.only(top: 230.0, left: 16.0, right: 16.0),
            children: <Widget>[
              Material(
                borderRadius: BorderRadius.circular(12.0),
                shadowColor: Colors.black45,
                elevation: 0.0,
                clipBehavior: Clip.antiAlias,
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Column(
                  children: <Widget>[
                    Material(
                      borderRadius: BorderRadius.circular(12.0),
                      clipBehavior: Clip.antiAlias,
                      elevation: 6.0,
                      shadowColor: Colors.black26,
                      child: Container(
                        width: double.infinity,
                        height: 156.0,
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
                                  swapAnimationDuration:
                                      Duration(milliseconds: 350),
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
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold),
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
                                            borderData:
                                                FlBorderData(show: false),
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

                    //End of the Chart Widget

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Material(
                        clipBehavior: Clip.antiAlias,
                        borderRadius: BorderRadius.circular(10.0),
                        elevation: 0.0,
                        shadowColor: Colors.black38,
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            fillColor: Colors.black.withOpacity(0.04),
                            filled: true,
                            border: InputBorder.none,
                            suffixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            hintText: 'Cerca',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1024,
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (_showMonthHeader)
            AnimatedOpacity(
              opacity: _showMonthHeader ? 1 : 0,
              duration: Duration(seconds: 1),
              child: Material(
                borderRadius: BorderRadius.circular(12.0),
                elevation: 6.0,
                shadowColor: Colors.black54,
                child: Container(
                  width: double.infinity,
                  height: 256.0,
                  color: Palette.lightBlue,
                  child: Text('coglione'),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
