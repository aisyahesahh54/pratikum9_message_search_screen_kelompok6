import 'package:flutter/material.dart';

class CallSearchScreen extends StatefulWidget {
  const CallSearchScreen({super.key});

  @override
  State<CallSearchScreen> createState() => _CallSearchScreenState();
}

class _CallSearchScreenState extends State<CallSearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  List<String> contacts = [
    "Ralph Edwards",
    "Cody Fisher",
    "Esther Howard",
    "Jenny Wilson",
    "Guy Hawkins",
    "Jacob Jones",
    "Wade Warren",
  ];

  List<String> filteredContacts = [];

  @override
  void initState() {
    super.initState();
    filteredContacts = contacts;
  }

  void _searchContact(String query) {
    setState(() {
      filteredContacts = contacts
          .where((contact) =>
              contact.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _startCall(String name) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Calling $name...")),
    );

    // 👉 Kalau mau pindah ke AudioCallingScreen:
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => const AudioCallingScreen(),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Contact"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              onChanged: _searchContact,
              decoration: InputDecoration(
                hintText: "Search contact...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          Expanded(
            child: filteredContacts.isEmpty
                ? const Center(child: Text("No contacts found"))
                : ListView.builder(
                    itemCount: filteredContacts.length,
                    itemBuilder: (context, index) {
                      final name = filteredContacts[index];

                      return ListTile(
                        leading: CircleAvatar(
                          child: Text(name[0]),
                        ),
                        title: Text(name),
                        trailing: IconButton(
                          icon: const Icon(Icons.call),
                          onPressed: () => _startCall(name),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}