import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerpractice/view_models/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // ignore: prefer_final_fields
  ValueNotifier<bool> _passVisible = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    final _loginProvider = Provider.of<LoginViewModel>(context, listen: false);

    print('build print');

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15.0),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    color: Colors.grey[89],
                    borderRadius: BorderRadius.circular(14)),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.mail),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15.0),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    color: Colors.grey[89],
                    borderRadius: BorderRadius.circular(14)),
                child: ValueListenableBuilder(
                  valueListenable: _passVisible,
                  builder: (context, value, child) {
                    return TextFormField(
                      controller: passwordController,
                      obscureText: _passVisible.value,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                            onPressed: () {
                              _passVisible.value = !_passVisible.value;
                            },
                            icon: _passVisible.value
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.remove_red_eye_outlined)),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                onTap: () {
                  _loginProvider.loginApi(
                      {'username': 'imranemp01', 'password': 'Karachi9100'},
                      context);
                },
                child: Container(
                  height: 55.0,
                  width: 335.0,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                    child: Text(
                      'Sign in',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'Forgot the password?',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10.0),
                    height: 2.0,
                    width: 100.0,
                    color: Colors.black,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'or Continue With',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10.0),
                    height: 2.0,
                    width: 100.0,
                    color: Colors.black,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20.0),
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(14)),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.facebook,
                        color: Colors.blue,
                        size: 30.0,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20.0),
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(14)),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.g_mobiledata,
                        color: Colors.blue,
                        size: 30.0,
                      ),
                    ),
                  ),
                  Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(14)),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.apple,
                        color: Colors.black,
                        size: 30.0,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Dont have an account?',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/Signup');
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
