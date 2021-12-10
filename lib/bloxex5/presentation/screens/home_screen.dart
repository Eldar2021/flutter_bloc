import 'package:bloc_education/bloxex5/logic/cubit/counter_cubit/counter_cubit.dart';
import 'package:bloc_education/bloxex5/logic/cubit/internet_cubit/internet_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const HomeScreen({
    Key? key,
    required this.color,
    required this.title,
  }) : super();

  final String title;
  final Color color;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected &&
            state.result == ConnectivityResult.wifi) {
           context.read<CounterCubit>().increment();
        } else if (state is InternetConnected &&
            state.result == ConnectivityResult.mobile) {
         // context.read<CounterCubit>().decrement();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: widget.color,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<InternetCubit, InternetState>(
                builder: (context, state) {
                  if (state is InternetConnected &&
                      state.result == ConnectivityResult.wifi) {
                    return Text(
                      'Wi-Fi',
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                            color: Colors.green,
                          ),
                    );
                  } else if (state is InternetConnected &&
                      state.result == ConnectivityResult.mobile) {
                    return Text(
                      'Mobile',
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                            color: Colors.red,
                          ),
                    );
                  } else if (state is InternetDisconnected) {
                    return Text(
                      'Disconnected',
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                            color: Colors.grey,
                          ),
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
              const Divider(
                height: 5,
              ),
              BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
                  if (state.wasIncrement == true) {
                    Scaffold.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Incremented!'),
                        duration: Duration(milliseconds: 300),
                      ),
                    );
                  } else if (state.wasIncrement == false) {
                    // ignore: deprecated_member_use
                    Scaffold.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Decremented!'),
                        duration: Duration(milliseconds: 300),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state.counter < 0) {
                    return Text(
                      'BRR, NEGATIVE ' + state.counter.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                  } else if (state.counter % 2 == 0) {
                    return Text(
                      'YAAAY ' + state.counter.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                  } else if (state.counter == 5) {
                    return Text(
                      'HMM, NUMBER 5',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  } else
                    // ignore: curly_braces_in_flow_control_structures
                    return Text(
                      state.counter.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                },
              ),
              // SizedBox(
              //   height: 24,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     FloatingActionButton(
              //       heroTag: Text('${widget.title}'),
              //       onPressed: () {
              //         BlocProvider.of<CounterCubit>(context).decrement();
              //         // context.bloc<CounterCubit>().decrement();
              //       },
              //       tooltip: 'Decrement',
              //       child: Icon(Icons.remove),
              //     ),
              //     FloatingActionButton(
              //       heroTag: Text('${widget.title} 2nd'),
              //       onPressed: () {
              //         // BlocProvider.of<CounterCubit>(context).increment();
              //         context.bloc<CounterCubit>().increment();
              //       },
              //       tooltip: 'Increment',
              //       child: Icon(Icons.add),
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 24,
              ),
              MaterialButton(
                color: Colors.redAccent,
                child: const Text(
                  'Go to Second Screen',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    '/second',
                  );
                },
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
