import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:scontreeno/misc/consts.dart';
import 'package:scontreeno/misc/palette.dart';
import 'package:scontreeno/pages_app/transactions_list/widgets/month_header.dart';
import 'package:scontreeno/pages_app/transactions_list/widgets/month_tile.dart';
import 'package:scontreeno/pages_app/transactions_list/widgets/search_bar.dart';
import 'package:scontreeno/pages_app/transactions_list/widgets/stats_appbar.dart';
import 'package:scontreeno/states/general_state.dart';

class TransactionsListPage extends StatefulWidget {
  @override
  _TransactionsListPageState createState() => _TransactionsListPageState();
}

class _TransactionsListPageState extends State<TransactionsListPage> {
  GeneralState _notifier;

  TextEditingController _searchController;
  ScrollController _scrollController;
  bool _showMonthHeader = false;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _searchController = TextEditingController();

    _scrollController.addListener(_scrollNotifier);
  }

  void _scrollNotifier() {
    if ((!_showMonthHeader &&
            _scrollController.offset > MONTH_HEADER_SLIDE_OFFSET) ||
        (_showMonthHeader &&
            _scrollController.offset <= MONTH_HEADER_SLIDE_OFFSET)) {
      setState(() {
        _showMonthHeader = !_showMonthHeader;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_notifier == null) _notifier = Provider.of<GeneralState>(context);

    return Scaffold(
      bottomSheet: Container(
        color: _notifier.nfcStatus ? Palette.lightBlue : Colors.black12,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.nfc, color: Colors.white),
                  SizedBox(width: 6.0),
                  Text(
                    _notifier.nfcStatus ? 'NFC attivo' : 'NFC disattivato',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24.0,
                child: Switch(
                  value: _notifier.nfcStatus,
                  activeColor: Colors.white,
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
          StatsAppbar(hide: _showMonthHeader),
          ListView(
            controller: _scrollController,
            padding: EdgeInsets.only(top: 230.0, left: 16.0, right: 16.0),
            children: <Widget>[
              MonthTile(),
              SearchBar(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: MonthTile(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: MonthTile(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: MonthTile(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: MonthTile(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: MonthTile(),
              ),
            ],
          ),
          MonthHeader(showMonthHeader: _showMonthHeader),
        ],
      ),
    );
  }
}
