import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part "auth_state.dart";

class AuthCubit extends Cubit<AuthState> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Dio dio = Dio();
  bool loading = false;
  AuthCubit() : super(AuthState(false));

  login() async {
    loading = true;
    emit(AuthState(loading));
    FormData form = FormData.fromMap({
      "username": emailController.text,
      "password": passwordController.text,
    });
    final response = await dio.post(
      "https://rscheme.pagodalabs.com.np/auth/login/",
      data: form,
      options: Options(
        responseType: ResponseType.json,
        validateStatus: (status) => status == 200 || status == 400,
      ),
    );
    try {
      if (response.statusCode == 200) {
        debugPrint(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    debugPrint("Response :$response");

    loading = false;
     await Future.delayed(const Duration(seconds: 4));
    emit(AuthState(loading));
  }
}
