import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/day_18/database/db_helper.dart';
import 'package:flutter_masibelajar/day_18/models/user_model.dart';
import 'package:flutter_masibelajar/day_18/views/detail_profile.dart';
import 'package:flutter_masibelajar/extension/navigator.dart';

class ProfileDay18 extends StatefulWidget {
  const ProfileDay18({super.key});

  @override
  State<ProfileDay18> createState() => _ProfileDay18State();
}

class _ProfileDay18State extends State<ProfileDay18> {
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

          print(snapshot.data!);

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
                  daftarPengguna[index].email,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  daftarPengguna[index].password,
                  style: TextStyle(fontSize: 12),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.push(
                          DetailProfileDay18(user: daftarPengguna[index]),
                        );
                      },
                      icon: Icon(Icons.remove_red_eye, color: Colors.blue),
                    ),
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
                      onPressed: () async {
                        bool isDeleted = await DBHelper().deleteUser(
                          daftarPengguna[index].id!,
                        );
                        if (isDeleted) _refreshList();
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
    final emailController = TextEditingController(text: user.email);
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
            children: [
              const Text(
                'Kelola Pengguna',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ), // Text
              const SizedBox(height: 16),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ), // InputDecoration
              ), // TextField
              const SizedBox(height: 10),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ), // InputDecoration
              ), // TextField
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    icon: const Icon(Icons.edit, color: Colors.white),
                    label: const Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ), // Text
                    onPressed: () async {
                      if (user.id != null) {
                        final updatedUser = UserModelSQL(
                          id: user.id,
                          email: emailController.text.trim(),
                          password: passwordController.text,
                          nama: "null",
                          username: "null",
                          asalKota: "null",
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
                  ), // ElevatedButton.icon
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    icon: const Icon(Icons.delete, color: Colors.white),
                    label: const Text(
                      'Delete',
                      style: TextStyle(color: Colors.white),
                    ), // Text
                    onPressed: () async {
                      if (user.id != null) {
                        await DBHelper().deleteUser(user.id!);
                        if (context.mounted) {
                          Navigator.pop(context);
                          _refreshList();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Data berhasil dihapus'),
                            ), // SnackBar
                          );
                        }
                      }
                    },
                  ), // ElevatedButton.icon
                ],
              ), // Row
              const SizedBox(height: 20),
            ],
          ), // Column
        ); // Padding
      },
    );
  }
}
