import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordviewBody extends StatefulWidget {
  const ForgotPasswordviewBody({super.key});
  static const String routeName = '/forgot-password';

  @override
  ForgotPasswordviewBodyState createState() => ForgotPasswordviewBodyState();
}

class ForgotPasswordviewBodyState extends State<ForgotPasswordviewBody> {
  final TextEditingController emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future<void> _resetPassword() async {
    if (_formKey.currentState!.validate()) {
      try {
        print('Sending reset link to ${emailController.text}');
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: emailController.text.trim());
        print('Reset link sent');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  'تم إرسال رابط إعادة تعيين كلمة المرور إلى بريدك الإلكتروني')),
        );
        Navigator.pop(context); // يرجع لشاشة تسجيل الدخول
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? 'حدث خطأ ما')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('إعادة تعيين كلمة المرور')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                width: 341,
                child: Text(
                  'لا تقلق ، ما عليك سوى كتابة رقم هاتفك وسنرسل رمز التحقق.',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: const Color(0xFF616A6B) /* Grayscale-600 */,
                    fontSize: 16,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w600,
                    height: 1.40,
                  ),
                ),
              ),
              SizedBox(height: 30),
              CustomTextFormField(
                hintText: ' رقم الهاتف',
                textInputType: TextInputType.phone,
                controller: emailController,
              ),
              SizedBox(height: 40),
              CustomButton(onPressed: _resetPassword, text: 'إرسال رابط')
            ],
          ),
        ),
      ),
    );
  }
}
