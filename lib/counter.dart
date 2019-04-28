import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum CounterEvent {
  increment,
  decrement,
}

class CounterBloc extends Bloc<CounterEvent, int> {
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.decrement:
        yield currentState - 1;
        break;
      case CounterEvent.increment:
        yield currentState + 1;
        break;
    }
  }
}

class CounterPage extends StatelessWidget {
  final CounterBloc _counterBloc = CounterBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      bloc: _counterBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Counter'),
        ),
        body: BlocBuilder<CounterEvent, int>(
            bloc: _counterBloc,
            builder: (context, snapshot) {
              return Center(
                child: Text(
                  '$snapshot',
                  style: Theme.of(context).textTheme.display1,
                ),
              );
            }),
        floatingActionButton: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(5.0),
              child: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () => _counterBloc.dispatch(CounterEvent.increment),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
