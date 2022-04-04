import 'package:flutter/material.dart';

class SnackBarApp extends StatelessWidget {
  const SnackBarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'WebSocket Demo';
    return const MaterialApp(
      title: title,
      home: SnackPage(),
    );
  }
}

class SnackPage extends StatefulWidget {
  const SnackPage({Key? key}) : super(key: key);

  @override
  _SnackPageState createState() => _SnackPageState();
}

class _SnackPageState extends State<SnackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Snack Bar")),
      body: const Center(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Your Text"),
                duration: Duration(milliseconds: 300),
                dismissDirection: DismissDirection.up,
              ));
            },
          ),
          FloatingActionButton(
            onPressed: () {
              // Flushbar(
              //   flushbarPosition: FlushbarPosition.TOP,
              // )
              //   ..title = "Hey Ninja"
              //   ..message = "Lorem Ipsum is simply dummy text of the printing and typesetting industry"
              //   ..duration = Duration(seconds: 3)
              //   ..show(context);
            },
          ),
          FloatingActionButton(
            onPressed: () {},
          ),
          FloatingActionButton(
            onPressed: () {},
          ),
          FloatingActionButton(
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
