import 'package:flutter/material.dart';
import 'package:one_call_app/app/config/ColorConfig.dart';
import 'package:one_call_app/app/widgets/ItemGrup.dart';

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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 1),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextField(
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                    hintText: 'Cari Group',
                    hintStyle: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemExtent: 80,
                  itemBuilder: (context, index) {
                    return ItemGrup(
                      image: 'assets/images/group.png',
                      title: 'Group $index',
                      subtitle: "10 Contacts",
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
