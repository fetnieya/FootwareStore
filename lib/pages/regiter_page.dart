import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:store_client/controller/login_controller.dart';
import 'package:store_client/pages/login_page.dart';
import 'package:store_client/widgets/otp_txt_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (ctrl) {
      return Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.blueGrey[50],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Create Your Account !!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.phone,
                controller: ctrl.registerNameCtrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.phone_android),
                  labelText: 'Your name',
                  hintText: 'Enter your name',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.phone,
                controller: ctrl.registerNumberCtrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.phone_android),
                  labelText: 'Mobile Number',
                  hintText: 'Enter your Mobile Number',
                ),
              ),
              const SizedBox(height: 20),
              OtpTxtField(otpController: ctrl.otpController,visible: ctrl.otpFieldShow, onComplete: (otp ) {  },),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if(ctrl.otpFieldShow){

                  }
                  ctrl.sendOtp();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepPurple,
                ),
                child: Text(ctrl.otpFieldShow? 'Register':'Send OTP'),
              ),
              TextButton(
                onPressed: () {
                  Get.to(LoginPage());
                },
                child: const Text('Login'),
              )
            ],
          ),
        ),
      );
    });
  }
}