import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarancalculator/feature/calc/presentation/bloc/get_results_bloc.dart';
import 'package:sarancalculator/feature/calc/presentation/bloc/get_results_event.dart';
import 'package:sarancalculator/feature/calc/presentation/bloc/get_results_state.dart';

class MobileCalcView extends StatefulWidget {
  const MobileCalcView({super.key});

  @override
  State<MobileCalcView> createState() => _MobileCalcViewState();
}

class _MobileCalcViewState extends State<MobileCalcView> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calc Desktop Page")),
      body: Center(
        child: BlocBuilder<GetResultsBloc, GetResultsState>(
          builder: (context, state) {
            if (state is ResultsInitial) {
              return ElevatedButton(
                onPressed: () {
                  context.read<GetResultsBloc>().add(FetchResultsEvent());
                },
                child: const Text("Fetch Results"),
              );
            } else if (state is ResultsLoading) {
              return const CircularProgressIndicator();
            } else if (state is ResultsLoaded) {
              return Text("Result: ${state.results.result}");
            } else if (state is ResultsError) {
              return Text("Error: ${state.message}");
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}