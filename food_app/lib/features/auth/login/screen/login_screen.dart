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

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Form(
        key: _formKey,
        child: BlocListener<AuthCubit, AuthStates>(
          listener: (BuildContext context, AuthStates state) {
            if (state is AuthErrorState) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.error)));
            }

            if (state is LogInSuccessState) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.userModel.name)));

              Navigator.pushReplacementNamed(context, '/home');
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),

              CustomFormTextField(
                hintText: "Email",
                icon: Icons.email,
                validator: Validat.isEmail,
                controller: _emailController,
              ),

              CustomFormTextField(
                hintText: "Password",
                icon: Icons.lock,
                validator: Validat.isPassword,
                controller: _passwordController,
              ),

              Align(
                alignment: Alignment.topRight,
                child: CustomTextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/signUp');
                  },
                  title: "Don't have an account?",
                ),
              ),

              CustomButton(
                title: "Login",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<AuthCubit>().signIn(
                      _emailController.text.trim(),
                      _passwordController.text.trim(),
                    );
                  }
                },
              ),

              const DividerWidget(),
              const AuthFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
