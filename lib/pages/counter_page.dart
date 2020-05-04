import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prime_demo/pages/prime_modal_page.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('CounterPage build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    child: Icon(Icons.remove),
                    onPressed: () {},
                  ),
                  FlatButton(
                    child: Icon(Icons.add),
                    onPressed: () {},
                  )
                ],
              ),
              FlatButton(
                child: Text(
                  'Is this prime?',
                  style: TextStyle(fontSize: 25.0),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => PrimeModalPage(),
                  ));
                },
              ),
              FlatButton(
                child:
                    Text('What is nth prime', style: TextStyle(fontSize: 25.0)),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
