import 'package:flutter/material.dart';
import 'package:scontreeno/misc/palette.dart';
import 'package:scontreeno/models/receipt.dart';
import 'package:scontreeno/models/transaction_article.dart';

class AddReceiptDialog extends StatefulWidget {
  @override
  _AddReceiptDialogState createState() => _AddReceiptDialogState();
}

class _AddReceiptDialogState extends State<AddReceiptDialog> {
  List<TransactionArticle> _articles = [TransactionArticle.empty()];

  void _addArticle() {
    setState(() => _articles.add(TransactionArticle.empty()));
  }

  void _removeArticle(int index) {
    print(index);
    _articles.forEach((a) => print('${a?.title}:${a?.tot}'));
    setState(() => _articles.removeAt(index));
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Material(
        borderRadius: BorderRadius.circular(32.0),
        clipBehavior: Clip.antiAlias,
        elevation: 6.0,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Emetti scontrino',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32.0,
                ),
              ),
              SizedBox(height: 32.0),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(
                    _articles.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            flex: 3,
                            child: Material(
                              clipBehavior: Clip.antiAlias,
                              borderRadius: BorderRadius.circular(24.0),
                              elevation: 0.0,
                              shadowColor: Colors.black38,
                              child: TextField(
                                controller: TextEditingController(
                                  text: _articles[index].title,
                                ),
                                onChanged: (text) =>
                                    _articles[index].title = text,
                                decoration: InputDecoration(
                                  fillColor: Colors.black.withOpacity(0.04),
                                  filled: true,
                                  border: InputBorder.none,
                                  hintText: 'Descrizione prodotto',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Flexible(
                            flex: 1,
                            child: Material(
                              clipBehavior: Clip.antiAlias,
                              borderRadius: BorderRadius.circular(24.0),
                              elevation: 0.0,
                              shadowColor: Colors.black38,
                              child: TextField(
                                controller: TextEditingController(
                                  text: _articles[index].tot.toStringAsFixed(2),
                                ),
                                onChanged: (text) => _articles[index]
                                    .updateCost(double.parse(text)),
                                decoration: InputDecoration(
                                  fillColor: Colors.black.withOpacity(0.04),
                                  filled: true,
                                  border: InputBorder.none,
                                  hintText: 'Prezzo',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Opacity(
                            opacity: (index == 0 && _articles.length == 1) ||
                                    index == _articles.length - 1
                                ? 1.0
                                : 0.0,
                            child: Material(
                              clipBehavior: Clip.antiAlias,
                              shape: CircleBorder(),
                              color: (index == 0 && _articles.length == 1) ||
                                      index == _articles.length - 1
                                  ? Colors.black26
                                  : Colors.black12,
                              child: InkWell(
                                onTap: (index == 0 && _articles.length == 1) ||
                                        index == _articles.length - 1
                                    ? () => _addArticle()
                                    : null,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Material(
                            clipBehavior: Clip.antiAlias,
                            shape: CircleBorder(),
                            color: _articles.length > 1
                                ? Colors.black26
                                : Colors.black12,
                            child: InkWell(
                              onTap: _articles.length > 1
                                  ? () => _removeArticle(index)
                                  : null,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox.fromSize(
                        size: Size.fromRadius(64.0),
                        child: Image.asset('res/images/terminale.png'),
                      ),
                      SizedBox(width: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Terminale cSd783fo',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 4.0,
                                backgroundColor: Palette.lightBlue,
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                'Online',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Palette.lightBlue,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Annulla',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black45,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Material(
                        clipBehavior: Clip.antiAlias,
                        borderRadius: BorderRadius.circular(8.0),
                        elevation: 6.0,
                        color: Palette.lightBlue,
                        shadowColor: Color(0xff999999),
                        child: InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Emetti scontrino',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
