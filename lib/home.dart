import 'dart:ui';

import 'package:flutter/material.dart';
import 'calculator.dart';

class ExpandedButton extends StatelessWidget {
  ExpandedButton({this.onPressed, this.child, this.color});
  final Widget? child;
  final VoidCallback? onPressed;
  final Color? color;
  @override
  Widget build(BuildContext context) => Expanded(
        flex: 1,
        child: FlatButton(
          onPressed: onPressed,
          child: child!,
          color: color,
        ),
      );
}

class ExpandedRow extends StatelessWidget {
  ExpandedRow({this.children, this.crossAxisAlignment});
  final List<Widget>? children;
  final CrossAxisAlignment? crossAxisAlignment;
  @override
  Widget build(BuildContext context) => Expanded(
        flex: 1,
        child: Row(
          children: children!,
          crossAxisAlignment: crossAxisAlignment!,
        ),
      );
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String _str = "0";

  var _calculation = Calculator();

  void add(String a) {
    setState(() {
      _calculation.add(a);
      _str = _calculation.getString();
    });
  }

  void deleteAll() {
    setState(() {
      _calculation.deleteAll();
      _str = _calculation.getString();
    });
  }

  void deleteOne() {
    setState(() {
      _calculation.deleteOne();
      _str = _calculation.getString();
    });
  }

  void getResult() {
    setState(() {
      try {
        _str = _calculation.getResult().toString();
      } on DivideByZeroException {
        _str = '0';
      } finally {
        _calculation = new Calculator();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title!),
          centerTitle: true,
          elevation: 5.0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Card(
                color: Colors.lightGreen[50],
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    _str,
                    textScaleFactor: 3.0,
                  ),
                ),
              ),
            ),
            //calculator screen
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 3,
                    child: FlatButton(
                        color: Colors.black54,
                        onPressed: () {
                          deleteAll();
                        },
                        child: const Text(
                          'C',
                          style: TextStyle(color: Colors.black54),
                        )),
                  ),
                  Expanded(
                    flex: 1,
                    child: FlatButton(
                        onPressed: () {
                          deleteOne();
                        },
                        color: Colors.black87,
                        child: const Text(
                          '<-',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  //takes two items which is the delete-all button
                  //and delete-one button
                ],
              ),
            ),

            Expanded(
              flex: 4,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //take s two column
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ExpandedRow(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            FlatButton(
                                color: Colors.blueAccent,
                                onPressed: () {
                                  add(
                                    '7',
                                  );
                                },
                                child: const Text('7',
                                    style: TextStyle(color: Colors.white))),
                            ExpandedButton(
                                color: Colors.blueAccent,
                                onPressed: () {
                                  add(
                                    '8',
                                  );
                                },
                                child: const Text('8',
                                    style: TextStyle(color: Colors.white))),
                            ExpandedButton(
                                color: Colors.blueAccent,
                                onPressed: () {
                                  add(
                                    '9',
                                  );
                                },
                                child: const Text('9',
                                    style: TextStyle(color: Colors.white))),
                          ],
                        ),
                        ExpandedRow(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            FlatButton(
                                color: Colors.blueAccent,
                                onPressed: () {
                                  add(
                                    '4',
                                  );
                                },
                                child: const Text('4',
                                    style: TextStyle(color: Colors.white))),
                            ExpandedButton(
                                color: Colors.blueAccent,
                                onPressed: () {
                                  add(
                                    '5',
                                  );
                                },
                                child: const Text('5',
                                    style: TextStyle(color: Colors.white))),
                            ExpandedButton(
                                color: Colors.blueAccent,
                                onPressed: () {
                                  add(
                                    '6',
                                  );
                                },
                                child: const Text('6',
                                    style: TextStyle(color: Colors.white))),
                          ],
                        ),
                        ExpandedRow(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ExpandedButton(
                                color: Colors.blueAccent,
                                onPressed: () {
                                  add(
                                    '1',
                                  );
                                },
                                child: const Text('1',
                                    style: TextStyle(color: Colors.white))),
                            ExpandedButton(
                                color: Colors.blueAccent,
                                onPressed: () {
                                  add(
                                    '2',
                                  );
                                },
                                child: const Text('2',
                                    style: TextStyle(color: Colors.white))),
                            ExpandedButton(
                                color: Colors.blueAccent,
                                onPressed: () {
                                  add(
                                    '3',
                                  );
                                },
                                child: const Text('3',
                                    style: TextStyle(color: Colors.white))),
                          ],
                        ),
                        ExpandedRow(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ExpandedButton(
                                color: Colors.blueAccent,
                                onPressed: () {
                                  add(
                                    '0',
                                  );
                                },
                                child: const Text('0',
                                    style: TextStyle(color: Colors.white))),
                            ExpandedButton(
                                color: Colors.blueAccent,
                                onPressed: () {
                                  add(
                                    '.',
                                  );
                                },
                                child: const Text('.',
                                    style: TextStyle(color: Colors.white))),
                            ExpandedButton(
                              color: Colors.blue[50]!,
                              onPressed: () {
                                getResult();
                              },
                              child: const Text('='),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        ExpandedButton(
                          onPressed: () {
                            add('÷');
                          },
                          child: Image.asset('icons/divide.jpg',
                              width: 10.0, height: 10.0),
                          color: Colors.blue[50]!,
                        ),
                        ExpandedButton(
                          child: const Text('x'),
                          onPressed: () {
                            add('x');
                          },
                          color: Colors.blue[50]!,
                        ),
                        ExpandedButton(
                          child: const Text('-'),
                          onPressed: () {
                            add('-');
                          },
                          color: Colors.blue[50]!,
                        ),
                        ExpandedButton(
                          child: const Text('+'),
                          onPressed: () {
                            add('+');
                          },
                          color: Colors.blue[50]!,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
