import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String nama;
  final String email;
  final String alamat;
  final String jenis_kelamin;
  final String no_hp;
  final String photoURL;
  final String status;
  final Timestamp created_at;
  final Timestamp updated_at;
  final List<String> rekam_medis;

  UserModel({
    required this.uid,
    required this.nama,
    required this.email,
    required this.alamat,
    required this.jenis_kelamin,
    required this.no_hp,
    required this.photoURL,
    this.status = 'tidak',
    required this.created_at,
    required this.updated_at,
    this.rekam_medis = const [],
  });

  factory UserModel.fromMap(Map<String, dynamic> data) {
    final String uid = data['uid'];
    final String nama = data['nama'];
    final String email = data['email'];
    final String alamat = data['alamat'];
    final String jenis_kelamin = data['jenis_kelamin'];
    final String no_hp = data['no_hp'];
    final String photoURL = data['photoURL'];
    final String status = data['status'];
    final Timestamp created_at = data['created_at'];
    final Timestamp updated_at = data['updated_at'];
    final List<String> rekam_medis = List<String>.from(data['rekam_medis']);

    return UserModel(
      uid: uid,
      nama: nama,
      email: email,
      alamat: alamat,
      jenis_kelamin: jenis_kelamin,
      no_hp: no_hp,
      photoURL: photoURL,
      status: status,
      created_at: created_at,
      updated_at: updated_at,
      rekam_medis: rekam_medis,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'nama': nama,
      'email': email,
      'alamat': alamat,
      'jenis_kelamin': jenis_kelamin,
      'no_hp': no_hp,
      'photoURL': photoURL,
      'status': status,
      'created_at': created_at,
      'updated_at': updated_at,
      'rekam_medis': rekam_medis,
    };
  }
}
