import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/CartPractice/CataLog.dart';
import 'package:flutterdemo/animate_page.dart';
import 'package:flutterdemo/counter_widget.dart';
import 'package:flutterdemo/get_state_object_route.dart';
import 'package:flutterdemo/network_practice.dart';
import 'package:flutterdemo/state_change_pate.dart';
import 'package:flutterdemo/tip_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double densityAmt = 3;
    VisualDensity density = VisualDensity(horizontal: densityAmt, vertical: densityAmt);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blueGrey,
        visualDensity: density
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    var countCeneter = Center(child: Column(
      children: [
        const Text(
          'You have pushed the button this many times:',
        ),
        Text(
          '$_counter',
          style: Theme.of(context).textTheme.headline4,
        )],
    ));

    var animateBtn = CupertinoButton(
        color: CupertinoColors.activeBlue,
        child: const Text("动画"),
        onPressed: _jumpToAnimatePage);

    var cataBtn = ElevatedButton(onPressed: _jumpToGetCataRoute, child: const Text("状态管理 - context"));

    var networkBtn = CupertinoButton(
        color: CupertinoColors.activeBlue,
        child: const Text("网络"),
        onPressed: _jumpToNetworkPage);

    var sizeBox = SizedBox(height: 10.0);

    var listView = ListView(
      children: <Widget>[
       countCeneter,
        sizeBox,
        CupertinoButton(
            color: CupertinoColors.activeBlue,
            onPressed: _jumpCounterPage,
            child: const Text("计数器")),
        sizeBox,
        ElevatedButton(
            onPressed: _jumpToGetStateRoute,
            child: const Text("生命周期-状态变化")),
        sizeBox,
        CupertinoButton(
            color: CupertinoColors.activeBlue,
            child: const Text("状态管理"),
            onPressed: _jumpToStateChangeTestPage),
        sizeBox,
        ElevatedButton(onPressed: _jumpToRoutePate,
            child: const Text("路由跳转")),
        sizeBox,
        animateBtn,
        cataBtn,
        networkBtn,
      ],
    );

    var padddingContainer = Padding(padding: EdgeInsets.all(20),
    child: listView);

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: padddingContainer,
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _jumpCounterPage() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return CounterWidget();
        })
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

  void _jumpToGetCataRoute() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return MyCatalog();
        })
    );
  }

  void _jumpToStateChangeTestPage() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return StateChangeWidget();
        })
    );
  }

  void _jumpToRoutePate() {
      var result = Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return TipRoute(
              // 路由参数
              text: "我是提示xxxx",
            );
          },
        ),
      );
      //输出`TipRoute`路由返回结果
      print("路由返回值: $result");

  }

  void _jumpToAnimatePage() {
    var route = PhysicsCardDragDemo();

    var result = Navigator.push(context, MaterialPageRoute(builder: (context) {
      return route;
    }));

    print("路由返回值: $result");
  }

  void _jumpToNetworkPage() {
    var route = NetworkRoute();

    var result = Navigator.push(context, MaterialPageRoute(builder: (context) {
      return route;
    }));

    print("路由返回值: $result");
  }
}
