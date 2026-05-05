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
      Provider.of<ProfileViewModel>(context, listen: false)
          .fetchProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ProfileViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),

      body: vm.isLoading
          ? const Center(child: CircularProgressIndicator())
          : vm.profile == null
              ? const Center(child: Text("Data tidak ditemukan"))
              : Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage(
                              "assets/${vm.profile!.profilePicture}",
                            ),
                          ),

                          const SizedBox(height: 20),

                          Text(
                            vm.profile!.userId,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Text(vm.profile!.location, textAlign: TextAlign.center),
                          Text(vm.profile!.phone, textAlign: TextAlign.center),
                          Text(vm.profile!.email, textAlign: TextAlign.center),

                          const SizedBox(height: 20),

                          Text(
                            vm.status,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
    );
  }
}