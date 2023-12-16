import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/random_words_widget.dart';

class TipRoute extends StatelessWidget {
  TipRoute({
    Key? key,
    required this.text,  // 接收一个text参数
  }) : super(key: key);
  final String text;

  RandomWordsWidget _randomWordsWidget = RandomWordsWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),/**/
              ElevatedButton(
                onPressed: _backButton,
                child: Text("返回"),
              ),
              _randomWordsWidget,
            ],
          ),
        ),
      ),
    );
  }

  void _backButton() {
    // Navigator.pop(this, "我是返回值");
  }
}

