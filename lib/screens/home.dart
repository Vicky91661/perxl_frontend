import 'package:flutter/material.dart';
import 'package:pexllite/constants.dart';
import 'package:pexllite/screens/chat.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Row(
          children: [
            Image(
              image: AssetImage("assets/images/perxl_logo.png"), // Your Perxl logo here
              height: 30,
            ),
            SizedBox(width: 10),
            
          ],
        ),
        
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Search group...',
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),

          // List of groups
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Replace with the actual number of groups
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/logo.png"), // Default group icon
                  ),
                  title: Text('Group $index'),
                  subtitle:const Text('Last message here...'),
                  onTap: () {
                    // Navigate to the group chat or tasks screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(groupName: 'Group $index'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_add),
            label: 'Make Group',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: 'Tasks',
          ),
        ],
        onTap: (index) {
          // Handle the bottom nav bar taps (navigate between Profile, Make Group, Tasks)
          switch (index) {
            case 0:
              // Navigate to Profile
              break;
            case 1:
              // Navigate to Create Group
              break;
            case 2:
              // Navigate to Tasks
              break;
          }
        },
      ),
    );
  }
}
