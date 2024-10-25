import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_call_app/app/config/ColorConfig.dart';
import 'package:one_call_app/app/widgets/ItemGrup.dart';
import 'package:one_call_app/app/widgets/SearchBar.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Emergency Group',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: const Row(
              children: [
                Icon(
                  Icons.add,
                  size: 20,
                  color: ColorConfig.primaryColor,
                ),
                Text(
                  "Add Circle",
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
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              SearchBars(
                hintText: 'Search Group',
                onChanged: (value) {},
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return ItemGrup(
                      onTap: () {
                        Get.toNamed('/grup/$index');
                      },
                      image: 'assets/images/group.png',
                      title: 'Group $index',
                      subtitle: "2 Contacts",
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
