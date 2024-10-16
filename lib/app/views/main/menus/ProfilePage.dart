import 'package:flutter/material.dart';
import 'package:one_call_app/app/widgets/CardMenu.dart';
import 'package:one_call_app/app/widgets/CardProfile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    List menuProfile = [
      {
        "listMenu": [
          {
            "nama": "Pusat Bantuan",
            "path": "pusat-bantuan",
          },
          {
            "nama": "Tentang",
          }
        ]
      },
      {
        "listMenu": [
          {
            "nama": "Notifikasi",
          },
          {
            "nama": "Bahasa",
          },
          {
            "nama": "Keamanan Akun",
          },
          {
            "nama": "Keluar",
            "path": "Keluar",
          }
        ]
      }
    ];
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              CardProfile(profile: {
                "photoURL":
                    "https://avatars.githubusercontent.com/u/77129645?v=4",
                "username": "Rizki Kurniawan",
                "email": "r@gmail.com"
              }),
              const SizedBox(
                height: 40,
              ),
              Column(
                children: List.generate(
                    menuProfile.length,
                    (indexMenu) => CardMenu(
                        menuProfile: menuProfile, indexMenu: indexMenu)),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
