import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/profile_viewmodel.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<ProfileViewModel>(context, listen: false).getProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ProfileViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        centerTitle: true,
      ),
      body: vm.isLoading
          ? const Center(child: CircularProgressIndicator())
          : vm.profile == null
              ? const Center(child: Text("Data tidak ditemukan"))
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 30),

                      // 🔵 AVATAR BESAR
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage(
                          "assets/${vm.profile!.profilePicture}",
                        ),
                      ),

                      const SizedBox(height: 20),

                      // 👤 USER ID BESAR
                      Text(
                        vm.profile!.userId,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        vm.profile!.location,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 30),

                      // 📦 CARD INFO
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            _buildCard(
                              icon: Icons.phone,
                              title: "Phone",
                              value: vm.profile!.phone,
                            ),
                            _buildCard(
                              icon: Icons.email,
                              title: "Email",
                              value: vm.profile!.email,
                            ),
                            _buildCard(
                              icon: Icons.location_on,
                              title: "Location",
                              value: vm.profile!.location,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }

  // 🔥 WIDGET CARD BESAR
  Widget _buildCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Icon(icon, size: 30),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}