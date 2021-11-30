import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/app/screens/home/home_screen.dart';
import 'package:flutter_clean_architecture/app/widgets/appbar/appbar_widget.dart';
import 'package:flutter_clean_architecture/app/widgets/button/button_widget.dart';
import 'package:flutter_clean_architecture/app/widgets/loader/loader_widget.dart';
import 'package:flutter_clean_architecture/app/widgets/textfield/textfield_widget.dart';
import 'package:flutter_clean_architecture/core/components/blocs/user/login/login_bloc.dart';
import 'package:flutter_clean_architecture/core/components/data/models/request/login_body.dart';
import 'package:flutter_clean_architecture/core/utility/palette.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key, required this.loginBloc}) : super(key: key);

  final LoginBloc loginBloc;

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // final loginBloc = sl<LoginBloc>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  onLoginPressed() {
    print("Tap yo");
    widget.loginBloc.add(OnLoginEvent(LoginBody(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    )));
  }

  bool obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => widget.loginBloc,
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
                        padding: EdgeInsets.only(left: 24, right: 24, top: 24),
                        color: Theme.of(context).cardColor,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFieldWidget(
                                key: const Key("emailField"),
                                controller: emailController,
                                hintText: "Type yout email address",
                                labelText: "Email Address",
                                prefixIcon: Icon(Icons.email),
                              ),
                              TextFieldWidget(
                                key: const Key("passwordField"),
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
                                key: const Key("loginBtn"),
                                onPressed: onLoginPressed,
                                height: 45,
                                width: double.infinity,
                                text: "Login",
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
    );
  }
}
