import 'package:cv_box/feature/auth/presentation/cubit/auth_state.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

// --- ( افترض أن هذه المسارات صحيحة ) ---

import 'package:cv_box/feature/auth/presentation/cubit/auth_cubit.dart';

import 'package:cv_box/feature/auth/data/models/user_creation_req.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameCon;

  late final TextEditingController _emailCon;

  late final TextEditingController _passwordCon;

  @override
  void initState() {
    super.initState();

    _nameCon = TextEditingController();

    _emailCon = TextEditingController();

    _passwordCon = TextEditingController();
  }

  @override
  void dispose() {
    _nameCon.dispose();

    _emailCon.dispose();

    _passwordCon.dispose();

    super.dispose();
  }

  void _submitSignup() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().signUp(
        UserCreationReq(
          firstName: _nameCon.text,
          lastName: '',
          email: _emailCon.text,
          image: '',
          password: _passwordCon.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Account')),

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
                  'Join Us!',

                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),

                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 32),

                TextFormField(
                  controller: _nameCon,

                  decoration: const InputDecoration(
                    labelText: 'First Name',

                    border: OutlineInputBorder(),
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 16),

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
                    if (state is SignupSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Account created! Welcome ')),
                      );

                      Navigator.of(context).pop();
                    } else if (state is SignupFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,

                          content: Text("Signup Failed!!!"),
                        ),
                      );
                    }
                  },

                  child: BlocBuilder<AuthCubit, AuthState>(
                    buildWhen: (previous, current) {
                      return current is SignupLoading;
                    },

                    builder: (context, state) {
                      if (state is SignupLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),

                        onPressed: _submitSignup,
                        child: const Text('Create Account'),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
