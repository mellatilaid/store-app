import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:training/auth/user_log_in.dart';
import 'package:training/helper/const.dart';
import 'package:training/views/register_view.dart';
import 'package:training/widgets/custom_action_botton.dart';
import 'package:training/widgets/custom_auth_form_field.dart';

import '../widgets/custom_text_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});
  static String id = 'signInPage';

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passowrdController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _isLoading,
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Image.asset('assets/app_icon.png'),
              ),
              CustomAuthTextField(
                controller: _emailController,
                preffixIcon: const Icon(Icons.email),
                labelText: 'Enter Your Email',
              ),
              const SizedBox(
                height: 16,
              ),
              CustomAuthTextField(
                controller: _passowrdController,
                preffixIcon: const Icon(Icons.lock),
                labelText: 'Enter Your Password',
                isPassword: true,
              ),
              const SizedBox(
                height: 80,
              ),
              CustomActionButton(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      _isLoading = true;
                    });
                    try {
                      await userLogIn(context,
                          email: _emailController.text,
                          password: _passowrdController.text);
                    } catch (e) {
                      throw Exception(e.toString());
                    }
                    setState(() {
                      _isLoading = false;
                    });
                  }
                },
                iconName: 'Log In',
                backGroundColor: kPrimary,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("don't have an account?"),
                  CustomTextButton(
                    onTap: () {
                      Navigator.pushNamed(context, RegisterPage.id);
                    },
                    actionText: 'Create An Account',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
