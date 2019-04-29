import 'package:flutter/material.dart';
import 'counter.dart';
import 'package:flutter_bloc_demo/list/infinite_list.dart';
import 'login/login.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Home(),//BlocProvider(bloc: _counterBloc, child: CounterPage(),),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final listItem = [
      ListTile(
        title: Text(CounterPage().runtimeType.toString()),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CounterPage())),
      ),
      ListTile(
        title: Text(InfiniteList().runtimeType.toString()),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => InfiniteList())),
      ),
      ListTile(
        title: Text(LoginDemo().runtimeType.toString()),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginDemo())),
      ),
    ];

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Home'),
      ),
      body: Container(
        child: ListView(
          children: listItem,
        ),
      ),
    );
  }
}