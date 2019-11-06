import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:scontreeno/managers/qr_manager.dart';
import 'package:scontreeno/managers/receipts_manager.dart';
import 'package:scontreeno/misc/consts.dart';
import 'package:scontreeno/misc/palette.dart';
import 'package:scontreeno/pages_app/transactions_list/widgets/month_header.dart';
import 'package:scontreeno/pages_app/transactions_list/widgets/month_tile.dart';
import 'package:scontreeno/pages_app/transactions_list/widgets/receipt_tile.dart';
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

    ReceiptsManager.getStatistics();
    ReceiptsManager.getReceipts();
    ReceiptsManager.getStatus();
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

  void _scanQr() async {
    final token = await QrManager.scanToken(context);
    print(token);
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
                  onPressed: _scanQr,
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
          CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverToBoxAdapter(child: SizedBox(height: 230.0)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 16.0,
                  ),
                  child: MonthTile(),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) =>
                      FiscalReceiptTile(receipt: _notifier.tempReceipts[i]),
                  childCount: _notifier.tempReceipts.length,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 16.0,
                  ),
                  child: SearchBar(),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) => FiscalReceiptTile(
                      receipt: _notifier.fiscalReceipts[/* i */ 0]),
                  childCount: _notifier.fiscalReceipts.length * 50,
                ),
              ),
            ],
          ),
          MonthHeader(showMonthHeader: _showMonthHeader),
        ],
      ),
    );
  }
}
