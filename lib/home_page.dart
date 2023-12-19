import 'package:auth_flutter/cubit/auth_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late final AuthCubit authCubit;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Dio dio = Dio();

  @override
  void initState() {
    super.initState();
    authCubit = BlocProvider.of<AuthCubit>(context);
    emailController.text = "superadmin";
    passwordController.text = "admin@123";
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            bool loading = state.loading;
            return Column(
              children: [
                //email
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      hintText: "Enter your email",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                //password
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: "Enter your email",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await authCubit.login();
                  },
                  child:  Center(
                    child: loading ? const CircularProgressIndicator() : const Text("Login"),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
