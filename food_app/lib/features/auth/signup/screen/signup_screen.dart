import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/app_color.dart';
import 'package:food_app/core/validator/validat.dart';
import 'package:food_app/core/widgets/custom_button.dart';
import 'package:food_app/core/widgets/custom_form_text_field.dart';
import 'package:food_app/features/auth/cubit/auth_cubit.dart';
import 'package:food_app/features/auth/cubit/states.dart';
import 'package:food_app/features/auth/widgets/auth_footer.dart';
import 'package:food_app/core/widgets/custom_text_button.dart';
import 'package:food_app/features/auth/widgets/divider_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _usernameController;
  @override
  initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _usernameController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: BlocListener<AuthCubit, AuthStates>(
            listener: (BuildContext context, state) {
              if (state is AuthErrorState) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.error)));
              }
              if (state is SignUpSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Account created successfully")),
                );

                Navigator.pushReplacementNamed(context, '/login');
              }
            },
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 30),

                  CustomFormTextField(
                    hintText: "Username",
                    icon: Icons.person,
                    validator: Validat.isName,
                    controller: _usernameController,
                  ),

                  const SizedBox(height: 16),

                  CustomFormTextField(
                    hintText: "Email",
                    icon: Icons.email,
                    validator: Validat.isEmail,
                    controller: _emailController,
                  ),

                  const SizedBox(height: 16),

                  CustomFormTextField(
                    hintText: "Password",
                    icon: Icons.lock,
                    validator: Validat.isPassword,
                    controller: _passwordController,
                  ),

                  const SizedBox(height: 24),
                  Align(
                    alignment: Alignment.topRight,
                    child: CustomTextButton(
                      title: 'do you have an account',
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/login',
                          (route) => false,
                        );
                      },
                    ),
                  ),

                  CustomButton(
                    title: "Sign Up",
                    onPressed: () {
                      context.read<AuthCubit>().signUp(
                        _usernameController.text.trim(),
                        _emailController.text.trim(),
                        _passwordController.text.trim(),
                      );
                    },
                  ),

                  const SizedBox(height: 24),

                  const DividerWidget(),

                  const SizedBox(height: 24),

                  const AuthFooter(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
