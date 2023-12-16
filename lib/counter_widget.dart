import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/get_state_object_route.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key, this.initValue = 0});

  final int initValue;

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _counter = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text('$_counter'),
          onPressed: () => setState(
            // () => ++_counter,
              () => _jumpToGetStateRoute(),
          ),
        ),
      ),
    );
  }

  void _jumpToGetStateRoute() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return GetStateObjectRoute();
        })
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget ");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}

class StateLifecycleText extends StatelessWidget {
  const StateLifecycleText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    throw CounterWidget();
  }
}