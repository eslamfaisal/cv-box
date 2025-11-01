import 'package:cv_box/feature/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cv_box/feature/auth/presentation/cubit/auth_cubit.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailCon;

  @override
  void initState() {
    super.initState();
    _emailCon = TextEditingController();
  }

  @override
  void dispose() {
    _emailCon.dispose();
    super.dispose();
  }

  void _submitResetEmail() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().sendResetEmail(_emailCon.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reset Password')),
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
                  'Forgot Your Password?',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'Enter your email and we will send you a link to reset your password.',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),

                // --- حقل الإيميل ---
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
                const SizedBox(height: 32),

                // --- الاستماع والتغيير ---
                BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is SendPasswordResetEmailSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Password reset link sent to your email!',
                          ),
                        ),
                      );
                      Navigator.of(context).pop(); // العودة
                    } else if (state is SendPasswordResetEmailFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(state.message),
                        ),
                      );
                    }
                  },
                  child: BlocBuilder<AuthCubit, AuthState>(
                    // !! buildWhen: تصفية حالات ForgetPassword فقط !!
                    buildWhen: (previous, current) {
                      return current is SendPasswordResetEmailLoading ||
                          current is SendPasswordResetEmailFailure ||
                          current is SendPasswordResetEmailSuccess ||
                          current is AuthInitial;
                    },
                    builder: (context, state) {
                      if (state is SendPasswordResetEmailLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: _submitResetEmail,
                        child: const Text('Send Reset Link'),
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
