import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_call_app/app/controllers/auth/AuthBindings.dart';
import 'package:one_call_app/app/utils/SnackBarCustom.dart';
import 'package:one_call_app/app/widgets/button.dart';
import 'package:one_call_app/app/widgets/square_tile.dart';
import 'package:one_call_app/app/widgets/textfield.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.find();
    return Scaffold(
      backgroundColor: Color(0xfff6f6f6),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              // logo
              const Image(
                image: AssetImage('assets/images/logo_large.png'),
              ),

              const SizedBox(height: 38),
              // button login register
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() {
                      return InkWell(
                        onTap: () {
                          controller.isLogin.value = true;
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: const EdgeInsets.all(4),
                          width: Get.width / 2 - 35,
                          decoration: BoxDecoration(
                            color: controller.isLogin.value
                                ? Colors.white
                                : Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'Masuk',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      );
                    }),
                    Obx(() {
                      return InkWell(
                        onTap: () {
                          controller.isLogin.value = false;
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: const EdgeInsets.all(4),
                          width: Get.width / 2 - 35,
                          decoration: BoxDecoration(
                            color: !controller.isLogin.value
                                ? Colors.white
                                : Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'Daftar',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      );
                    })
                  ],
                ),
              ),
              const SizedBox(height: 25),
              // username textfield
              const Padding(
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
              const Padding(
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
              Obx(() {
                if (controller.isLogin.value) {
                  return const SizedBox();
                }
                return const SizedBox(height: 22);
              }),
              Obx(() {
                if (controller.isLogin.value) {
                  return const SizedBox();
                }
                return const Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Confirm Password",
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
                );
              }),

              const SizedBox(height: 15),
              // forgot password?
              Obx(() {
                if (!controller.isLogin.value) {
                  return const SizedBox();
                }
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Lupa Password?',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                );
              }),

              const SizedBox(height: 21),
              // sign in button
              Obx(() {
                return MyButton(
                  onTap: () {
                    Get.offNamed('/');
                  },
                  text: controller.isLogin.value ? 'Masuk' : 'Daftar',
                );
              }),

              const SizedBox(height: 72),
              // or continue with
              const Padding(
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

              const SizedBox(height: 10),
              // google + apple sign in button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //fb button
                  InkWell(
                    onTap: () {
                      SnackBarCustom.showSnackBarPengembangan(context);
                    },
                    child: const SquareTile(
                      imagePath: 'assets/images/fb.png',
                    ),
                  ),

                  const SizedBox(width: 20),
                  //google button
                  InkWell(
                    onTap: () {
                      SnackBarCustom.showSnackBarPengembangan(context);
                    },
                    child: const SquareTile(
                      imagePath: 'assets/images/google.png',
                    ),
                  ),

                  const SizedBox(width: 20),
                  //apple button
                  InkWell(
                    onTap: () {
                      SnackBarCustom.showSnackBarPengembangan(context);
                    },
                    child: const SquareTile(
                      imagePath: 'assets/images/apple.png',
                    ),
                  ),
                ],
              ),
              Obx(() {
                if (controller.isLogin.value) {
                  return const SizedBox();
                }
                return const SizedBox(height: 20);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
