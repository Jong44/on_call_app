import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_call_app/app/widgets/button.dart';
import 'package:one_call_app/app/widgets/square_tile.dart';
import 'package:one_call_app/app/widgets/textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6f6f6),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 82),

              // logo
              Image(
                image: AssetImage('assets/images/logo.png'),
              ),

              const SizedBox(height: 38),
              // button login register

              const SizedBox(height: 35),
              // username textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Alamat Email",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 6),
                    MyTextField(
                      controller: null,
                      hintText: 'Masukkan Email',
                      obscureText: false,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              // password textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Password",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 6),
                    MyTextField(
                      controller: null,
                      hintText: 'Masukkan Password',
                      obscureText: true,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),
              // forgot password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Lupa Password?',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 41),
              // sign in button
              MyButton(
                onTap: () {
                  Get.offNamed('/');
                },
              ),

              const SizedBox(height: 72),
              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Atau Masuk Dengan',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),
              // google + apple sign in button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //fb button
                  SquareTile(imagePath: 'assets/images/fb.png'),

                  const SizedBox(width: 11),
                  //google button
                  SquareTile(imagePath: 'assets/images/google.png'),

                  const SizedBox(width: 11),
                  //apple button
                  SquareTile(imagePath: 'assets/images/apple.png')
                ],
              )
              // not a member? register now
            ],
          ),
        ),
      ),
    );
  }
}
