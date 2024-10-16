import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_call_app/app/config/ColorConfig.dart';
import 'package:one_call_app/app/controllers/fitur/GrupController.dart';
import 'package:one_call_app/app/widgets/ItemContact.dart';
import 'package:one_call_app/app/widgets/SearchBar.dart';

class GrupDetailPage extends StatelessWidget {
  const GrupDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GrupController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Grup Detail',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {},
            child: const Row(
              children: [
                Icon(
                  Icons.add,
                  size: 20,
                  color: ColorConfig.primaryColor,
                ),
                SizedBox(width: 5),
                Text(
                  "Add Contact",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: ColorConfig.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SearchBars(
                  hintText: 'Search Contact',
                  onChanged: (value) {},
                ),
                const SizedBox(height: 30),
                Column(
                  children: List.generate(10, (index) {
                    return ItemContact(
                      onTap: () {
                        Get.toNamed('/grup/chat/$index');
                      },
                      imageUrl: "https://via.placeholder.com/150",
                      name: "John Doe",
                      message: "Hello, how are you?",
                      time: "10:00",
                      isRead: false,
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
