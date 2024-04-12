import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/di/serviece_locator.dart';
import 'package:task_manager_app/home/presentaion/bloc/home_bloc.dart';
import 'package:task_manager_app/home/presentaion/widgets/todo_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController controller = ScrollController(
    keepScrollOffset: true
  );

  @override
  void initState(){
    controller.addListener(() {
      if(controller.position.pixels == controller.position.maxScrollExtent){
        String skip = (int.parse(getIt<HomeBloc>().skip) + 10).toString();
        String limit = (int.parse(getIt<HomeBloc>().limit) + 10).toString();
        getIt<HomeBloc>().add(LoadMore(
          limit: limit , skip: skip
        ));
        }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()..add(LoadTodos()),
      child: Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is LoadingTodos) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            }
            if (state is TodosLoaded) {
              return ListView.builder(
                controller: controller,
                itemCount: state.tasks.length,
                itemBuilder: (ctx, index) {
                  return todoItem(context, state.tasks[index]);
                }
              ,);
            }
            state is AuthenticationError;
            return const Center(
              child: Text("error"),
            );
          },
        ),
      ),
    );
  }
}
