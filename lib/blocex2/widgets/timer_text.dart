import 'package:bloc_education/blocex2/bloc/timer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class TimerText extends StatelessWidget {
  const TimerText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final duration = context.select((TimerBloc bloc) => bloc.state.duration);
    final minutesStr =
        ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final secondsStr = (duration % 60).floor().toString().padLeft(2, '0');
    return Text(
      "$minutesStr : $secondsStr",
      style: textTheme.headline4,
    );
  }
}
