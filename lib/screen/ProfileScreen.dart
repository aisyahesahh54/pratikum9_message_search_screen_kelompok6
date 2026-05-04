import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          // FOTO PROFIL
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              "https://i.postimg.cc/xC2gTGx8/user-2.png",
            ),
          ),

          const SizedBox(height: 12),

          // NAMA
          const Text(
            "Ralph Edwards",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          // EMAIL
          const Text(
            "ralph@example.com",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 20),

          // TOMBOL EDIT
          ElevatedButton(
            onPressed: () {},
            child: const Text("Edit Profile"),
          ),

          const SizedBox(height: 20),

          // MENU
          Expanded(
            child: ListView(
              children: const [
                ProfileMenuItem(
                  icon: Icons.person,
                  text: "My Account",
                ),
                ProfileMenuItem(
                  icon: Icons.settings,
                  text: "Settings",
                ),
                ProfileMenuItem(
                  icon: Icons.notifications,
                  text: "Notifications",
                ),
                ProfileMenuItem(
                  icon: Icons.help,
                  text: "Help Center",
                ),
                ProfileMenuItem(
                  icon: Icons.logout,
                  text: "Logout",
                  isLogout: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.text,
    this.isLogout = false,
  });

  final IconData icon;
  final String text;
  final bool isLogout;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: isLogout ? Colors.red : Colors.black,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: isLogout ? Colors.red : Colors.black,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}