import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: ListView(
                  children: [
                    SizedBox(height: 16),
                    Text('MyListItem w/o being wrapped by ExpansionTile'),
                    SizedBox(height: 16),
                    MyListItem(),
                    SizedBox(height: 16),
                    MyListItem(increaseFontSize: true),
                    SizedBox(height: 16),
                    Text('MyListItem wrapped by ExpansionTile'),
                    SizedBox(height: 16),
                    ExpansionTile(
                      title: Text('ExpansionTile'),
                      children: [
                        MyListItem(),
                        SizedBox(height: 16),
                        MyListItem(increaseFontSize: true),
                        SizedBox(height: 16),
                        MyListItem(),
                        SizedBox(height: 16),
                        MyListItem(),
                        SizedBox(height: 16),
                        MyListItem(increaseFontSize: true),
                        SizedBox(height: 16),
                        MyListItem(),
                        SizedBox(height: 16),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text('ExpansionTile with a Text widget inside'),
                    ExpansionTile(
                      title: Text('only text inside'),
                      children: [
                        SizedBox(
                          width: 90,
                          height: 90,
                          child: Text(
                            'expansion tile with just text that goes on forever and ever and ever and forever and ever and ever',
                            style: Theme.of(context)
                                .textTheme
                                .overline
                                ?.copyWith(fontSize: 10),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyListItem extends StatelessWidget {
  final bool increaseFontSize;

  const MyListItem({
    Key? key,
    this.increaseFontSize = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: 88.0,
              child: _MyListItemLeftSide(
                increaseFontSize: increaseFontSize,
              ),
            ),
            Flexible(
              child: _MyListItemRightSide(
                fontSizeIncreased: increaseFontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MyListItemLeftSide extends StatelessWidget {
  final bool increaseFontSize;

  const _MyListItemLeftSide({
    Key? key,
    this.increaseFontSize = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 4.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Flexible(
                child: Text(
                  '10:55 AM — 09:12 PM'
                  /* 'blabl BL AA blabl BL' */, // Using this string yields the same result
                  style: Theme.of(context)
                      .textTheme
                      .overline
                      ?.copyWith(fontSize: increaseFontSize ? 12 : 10),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: 4.0),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 2.0,
                ),
                child: Icon(Icons.replay, size: 12),
              ),
            ],
          ),
        ),
        SizedBox(height: 32),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              bottom: 8.0,
              right: 4.0,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.crop_square,
                  size: 16,
                ),
                SizedBox(width: 4.0),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _MyListItemRightSide extends StatelessWidget {
  final bool fontSizeIncreased;

  const _MyListItemRightSide({
    Key? key,
    this.fontSizeIncreased = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: Colors.grey),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              top: 8.0,
              bottom: 8.0,
            ),
            child: Text(
              fontSizeIncreased
                  ? 'Font size on left side is 12 px'
                  : 'Font size on left side is 10 px',
              style: Theme.of(context).textTheme.bodyText1,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(width: 8),
                      Container(color: Colors.blue, height: 24, width: 24),
                      SizedBox(width: 8.0),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Text(
                                  'Lorem ipsum blablabla',
                                  style: Theme.of(context)
                                      .textTheme
                                      .overline
                                      ?.copyWith(fontSize: 10),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8, bottom: 8),
                child: _MyCheckbox(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MyCheckbox extends StatefulWidget {
  const _MyCheckbox({
    Key? key,
  }) : super(key: key);

  @override
  __MyCheckboxState createState() => __MyCheckboxState();
}

class __MyCheckboxState extends State<_MyCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => isChecked = !isChecked),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: kMinInteractiveDimension,
        height: kMinInteractiveDimension,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color: Colors.black,
          ),
          color: _fillColor(),
        ),
        child: Icon(
          Icons.check,
          color: _checkmarkColor(),
          size: kMinInteractiveDimension,
        ),
      ),
    );
  }

  Color _checkmarkColor() {
    return isChecked ? Colors.black : Colors.transparent;
  }

  Color _fillColor() {
    return isChecked ? Colors.lightBlue : Colors.transparent;
  }
}
