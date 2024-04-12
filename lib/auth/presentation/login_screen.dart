import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/auth/presentation/bloc/login_bloc.dart';
import 'package:task_manager_app/di/serviece_locator.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
        create: (context) => getIt<LoginBloc>(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Task Manager App" , style: TextStyle(fontWeight: FontWeight.bold),),
            backgroundColor: Colors.green,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 1,
                ),
                const Text("LOGIN into Our App" , style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic
                ),),
                const Spacer(
                  flex: 1,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    hintText: "name"
                  ),
                  controller: nameController,
                  keyboardType: TextInputType.name,
                ),
                const Spacer(
                  flex: 1,
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                      hintText: "password"
                  ),
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                ),
                const Spacer(
                  flex: 1,
                ),
            BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginCompletes) {
                  Navigator.of(context).pushReplacementNamed('/home_screen');
                }
              },
              child: BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return ElevatedButton(
                    style:  const ButtonStyle(
                      fixedSize: MaterialStatePropertyAll(Size(200,50)),
                      backgroundColor: MaterialStatePropertyAll(Colors.greenAccent),
                    ),
                      onPressed: ()  {
                        context.read<LoginBloc>().add(OnLoginButtonPressed(
                            username: nameController.text,
                            password: passwordController.text));
                      },
                      child: const Text("Login" ,style: TextStyle(fontSize: 20),));
                },
              ),
            ),

                const Spacer(flex: 1,)
              ],
            ),
          ),
        ));
  }
}
