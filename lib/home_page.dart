import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Dio dio = Dio();

  @override
  void initState() {
    super.initState();
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
        child: Column(
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
                FormData form = FormData.fromMap({
                  "username": emailController.text,
                  "password": passwordController.text,
                });
                final response = await dio.post(
                  "https://rscheme.pagodalabs.com.np/auth/login/",
                  data: form,
                  options: Options(
                    responseType: ResponseType.json,
                    validateStatus: (status) => status == 200 || status == 400 ,
                  ),
                );
                try {
                  if (response.statusCode == 200) {
                    print(response.data);
                  }
                } catch (e) {
                  print(e.toString());
                }
                print("Response :$response");
              },
              child: const Center(
                child: Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
