import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/app/screens/home/home_screen.dart';
import 'package:flutter_clean_architecture/app/widgets/appbar/appbar_widget.dart';
import 'package:flutter_clean_architecture/app/widgets/button/button_widget.dart';
import 'package:flutter_clean_architecture/app/widgets/loader/loader_widget.dart';
import 'package:flutter_clean_architecture/app/widgets/textfield/textfield_widget.dart';
import 'package:flutter_clean_architecture/core/components/blocs/user/bloc/login_bloc.dart';
import 'package:flutter_clean_architecture/core/components/data/models/request/login_body.dart';
import 'package:flutter_clean_architecture/core/di/injection_container.dart';
import 'package:flutter_clean_architecture/core/utility/palette.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginBloc = sl<LoginBloc>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  onLoginPressed() {
    print("Tap");
    loginBloc.add(OnLoginEvent(LoginBody(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    )));
  }

  bool obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: BlocProvider(
        create: (context) => loginBloc,
        child: BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
          if (state is LoginFailure) {
            Get.snackbar("Oopss", state.message,
                snackPosition: SnackPosition.TOP,
                backgroundColor: Palette.redColor,
                colorText: Colors.white);
          } else if (state is LoginSuccess) {
            Get.off(() => HomeScreen());
          }
        }, builder: (context, state) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: [
                SafeArea(
                  child: Column(
                    children: [
                      AppBarWidget(
                        title: "Sign In",
                        subtitle: "Find your best ever meal",
                        isBackIcon: false,
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding:
                              EdgeInsets.only(left: 24, right: 24, top: 24),
                          color: Theme.of(context).cardColor,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFieldWidget(
                                  controller: emailController,
                                  hintText: "Type yout email address",
                                  labelText: "Email Address",
                                  prefixIcon: Icon(Icons.email),
                                ),
                                TextFieldWidget(
                                  controller: passwordController,
                                  hintText: "Type your password",
                                  labelText: "Password",
                                  prefixIcon: Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          obsecureText = !obsecureText;
                                        });
                                      },
                                      icon: Icon(obsecureText
                                          ? IconlyLight.show
                                          : IconlyLight.hide)),
                                  obsecureText: obsecureText,
                                ),
                                SizedBox(height: 10),
                                ButtonWidget(
                                  onPressed: onLoginPressed,
                                  height: 45,
                                  width: double.infinity,
                                  text: "Sign In",
                                ),
                                SizedBox(height: 10),
                                ButtonWidget(
                                  onPressed: () {},
                                  textColor: Colors.white,
                                  height: 45,
                                  width: double.infinity,
                                  color: Palette.greyColor,
                                  text: "Create New Account",
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                (state is LoginLoading)
                    ? LoaderWidget(
                        title: "Loading",
                        color: Theme.of(context).primaryColor,
                      )
                    : SizedBox.shrink()
              ],
            ),
          );
        }),
      ),
    );
  }
}
