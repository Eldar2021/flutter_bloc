import 'package:bloc_education/blocex2/widgets/action.dart';
import 'package:bloc_education/blocex2/widgets/background.dart';
import 'package:bloc_education/blocex2/widgets/timer_text.dart';
import 'package:flutter/material.dart';
class TimerView extends StatelessWidget {
  const TimerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Timer With Bloc"),
      ),
      body: Stack(
        children: [
          const Background(),
          Column(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 100),
                child: TimerText(),
              ),
              ActionBloc(),
            ],
          ),
        ],
      ),
    );
  }
}
