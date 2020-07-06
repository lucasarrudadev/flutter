import 'package:flutter/material.dart';
import 'package:myblocexample/shit_mode.dart';
import 'test_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'stateful_wrapper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<TestBloc>(
        create: (context) => TestBloc(),
        child: Test(),
      ),
    );
  }
}

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StatefulWrapper(
        onInit: () async {
          final TestBloc testBloc = context.bloc<TestBloc>();
          testBloc.add(events.getShit);
        },
        child: BlocBuilder<TestBloc, List<ShitModel>>(
          builder: (context, shitModelList) {
            String str = '';
            shitModelList.forEach((shitModel) {
              str += shitModel.email + '    ';
            });
            print('-$str-');
            if (str == 'loading    ') {
              return CircularProgressIndicator();
            }
            return Text(str);
          },
        ),
      ),
    );
  }
}
