import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:training/auth/add_user_detail.dart';
import 'package:training/helper/const.dart';
import 'package:training/widgets/custom_action_botton.dart';
import 'package:training/widgets/custom_auth_form_field.dart';

import '../auth/user_regestration.dart';
import '../widgets/custom_text_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static String id = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _fNameController = TextEditingController();

  final _lNameController = TextEditingController();

  final _emialController = TextEditingController();

  final _passwordController = TextEditingController();

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
                controller: _fNameController,
                preffixIcon: const Icon(Icons.person),
                labelText: 'Your First Name',
              ),
              const SizedBox(
                height: 16,
              ),
              CustomAuthTextField(
                controller: _lNameController,
                preffixIcon: const Icon(Icons.person),
                labelText: 'Your Last Name',
              ),
              const SizedBox(
                height: 16,
              ),
              CustomAuthTextField(
                controller: _emialController,
                preffixIcon: const Icon(Icons.email),
                labelText: 'Your Email',
              ),
              const SizedBox(
                height: 16,
              ),
              CustomAuthTextField(
                controller: _passwordController,
                preffixIcon: const Icon(Icons.lock),
                labelText: 'Your Password',
                isPassword: true,
              ),
              const SizedBox(
                height: 40,
              ),
              CustomActionButton(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      _isLoading = true;
                    });
                    try {
                      await userRegestration(
                        context,
                        email: _emialController.text,
                        password: _passwordController.text,
                      );
                      //add user infos to the firestore data base
                      addUserDetails(
                        fName: _fNameController.text,
                        lName: _lNameController.text,
                        email: _emialController.text,
                      );
                    } catch (e) {
                      throw Exception(e.toString());
                    }
                    setState(() {
                      _isLoading = false;
                    });
                  }
                },
                iconName: 'Sign Up',
                backGroundColor: kPrimary,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("have an account?"),
                  CustomTextButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    actionText: 'Log In',
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
