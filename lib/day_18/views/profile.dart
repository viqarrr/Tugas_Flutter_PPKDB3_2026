import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/day_18/database/db_helper.dart';
import 'package:flutter_masibelajar/day_18/models/user_model.dart';
import 'package:flutter_masibelajar/extension/navigator.dart';
import 'package:flutter_masibelajar/tugas/tugas_12/widgets/centered_button.dart';

class ProfileDay18 extends StatefulWidget {
  const ProfileDay18({super.key});

  @override
  State<ProfileDay18> createState() => _ProfileDay18State();
}

class _ProfileDay18State extends State<ProfileDay18> {
  void _deleteUser(int? id) async {
    bool isDeleted = await DBHelper().deleteUser(id!);
    if (isDeleted) _refreshList();
  }

  void _refreshList() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: DBHelper().getAllUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Terjadi kesalahan: ${snapshot.error}'),
            ); // Center
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Tidak ada data pengguna.'),
            ); // Center
          }
          final daftarPengguna = snapshot.data!;

          return ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(height: 12);
            },
            padding: EdgeInsets.only(top: 64, left: 16, right: 16, bottom: 96),
            itemCount: daftarPengguna.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Daftar Pengguna",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Daftar pengguna aplikasi Plenty",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                );
              }
              return ListTile(
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(13),
                ),
                leading: Icon(Icons.person, size: 32),
                title: Text(
                  daftarPengguna[index].nama,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "@${daftarPengguna[index].username} \n"
                  "Email: ${daftarPengguna[index].email} \n"
                  "Nomor HP: ${daftarPengguna[index].nomorHp} \n"
                  "Asal Kota: ${daftarPengguna[index].asalKota} \n"
                  "Password: ${daftarPengguna[index].password} \n",
                  style: TextStyle(fontSize: 12),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        _showBottomSheet(context, daftarPengguna[index]);
                        // context.push(
                        //   EditProfileDay18(user: daftarPengguna[index]),
                        // );
                      },
                      icon: Icon(Icons.edit, color: Colors.amber),
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: Colors.white,
                            content: Column(
                              spacing: 16,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Column(
                                  spacing: 6,
                                  children: [
                                    Text(
                                      "Apakah anda yakin? aksi ini tidak dapat dbatalkan.",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            actions: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      context.pop();
                                      _deleteUser(daftarPengguna[index].id!);
                                    },
                                    child: Text("Ya"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      context.pop();
                                    },
                                    child: Text("Tidak"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showBottomSheet(BuildContext context, UserModelSQL user) {
    final nameController = TextEditingController(text: user.nama);
    final usernameController = TextEditingController(text: user.username);
    final emailController = TextEditingController(text: user.email);
    final phoneController = TextEditingController(text: user.nomorHp);
    final cityController = TextEditingController(text: user.asalKota);
    final passwordController = TextEditingController(text: user.password);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ), // RoundedRectangleBorder
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 16,
          ), // EdgeInsets.only
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 16,
            children: [
              const Text(
                'Kelola Pengguna',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ), // Text
              const SizedBox(height: 16),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(),
                ), // InputDecoration
              ), // TextField
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ), // InputDecoration
              ), // TextField
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ), // InputDecoration
              ), // TextField
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Nomor HP',
                  border: OutlineInputBorder(),
                ), // InputDecoration
              ), // TextField
              TextField(
                controller: cityController,
                decoration: const InputDecoration(
                  labelText: 'Asal Kota',
                  border: OutlineInputBorder(),
                ), // InputDecoration
              ), // TextField
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ), // InputDecoration
              ), // TextField
              CenteredButton(
                onPressed: () async {
                  if (user.id != null) {
                    final updatedUser = UserModelSQL(
                      id: user.id,
                      email: emailController.text.trim(),
                      nomorHp: phoneController.text.trim(),
                      password: passwordController.text,
                      nama: nameController.text,
                      username: usernameController.text,
                      asalKota: cityController.text,
                    ); // UserModelSQL

                    bool success = await DBHelper().updateUser(updatedUser);
                    if (success && context.mounted) {
                      Navigator.pop(context);
                      _refreshList();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Data berhasil diperbarui'),
                        ), // SnackBar
                      );
                    }
                  }
                },
                padding: EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Color(0xff1C3F32),
                borderRadius: BorderRadius.circular(36),
                content: Text(
                  "Edit",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ), // Row
              const SizedBox(height: 20),
            ],
          ), // Column
        ); // Padding
      },
    );
  }
}
