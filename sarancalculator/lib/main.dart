import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarancalculator/feature/calc/presentation/bloc/results_bloc.dart';
import 'package:sarancalculator/feature/calc/presentation/pages/calc_page.dart';

import 'init_dependencies.dart';
import 'init_dependencies_main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependenciesMain();
  runApp(const CalcApp());
}

class CalcApp extends StatelessWidget {
  const CalcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ResultsBloc>(
          create: (context) => serviceLocator<ResultsBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Calc App',
        theme: ThemeData.dark(),
        home: const CalcPage(),
      ),
    );
  }
}
