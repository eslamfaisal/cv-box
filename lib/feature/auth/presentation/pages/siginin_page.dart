import 'package:cv_box/core/navigator/app_navigator.dart';
import 'package:cv_box/feature/auth/presentation/cubit/auth_state.dart';
import 'package:cv_box/feature/auth/presentation/pages/forget_password_page.dart.dart';
import 'package:cv_box/feature/auth/presentation/pages/signup_page.dart';
import 'package:cv_box/feature/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cv_box/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:cv_box/feature/auth/data/models/user_signin_req.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _emailCon;
  late final TextEditingController _passwordCon;

  @override
  void initState() {
    super.initState();
    _emailCon = TextEditingController();
    _passwordCon = TextEditingController();
  }

  @override
  void dispose() {
    _emailCon.dispose();
    _passwordCon.dispose();
    super.dispose();
  }

  void _submitSignin() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().signIn(
        UserSigninReq(email: _emailCon.text, password: _passwordCon.text),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Welcome Back!',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),

                TextFormField(
                  controller: _emailCon,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _passwordCon,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),

                BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is SigninSuccess) {
                      AppNavigator.pushAndRemove(context, HomePage());
                    } else if (state is SigninFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text("email or password are incorrect"),
                        ),
                      );
                    }
                  },

                  child: BlocBuilder<AuthCubit, AuthState>(
                    buildWhen: (previous, current) {
                      return current is SigninLoading ||
                          current is SigninSuccess ||
                          current is SigninFailure;
                    },
                    builder: (context, state) {
                      if (state is SigninLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: _submitSignin,
                        child: const Text('Sign In'),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    // Navigate to Sign Up page
                    AppNavigator.push(context, SignupPage());
                  },
                  child: const Text("Don't have an account? Sign Up"),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    // Handle forgot password
                    AppNavigator.push(context, ForgetPasswordPage());
                  },
                  child: const Text("Forgot Password?"),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
