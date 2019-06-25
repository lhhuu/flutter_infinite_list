import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_infinite_list/HomePage.dart';
import 'package:flutter_infinite_list/SimpleBlocDelegate.dart';
import 'package:flutter_infinite_list/post_bloc.dart';
import 'package:flutter_infinite_list/post_event.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Infinite Scroll',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Posts'),
        ),
        body: BlocProvider(
          builder: (context) => PostBloc(httpClient: http.Client())..dispatch(Fetch()),
          child: HomePage(),
        ),
      ),
    );
  }
}

