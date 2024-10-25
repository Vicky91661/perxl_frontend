import 'package:flutter/material.dart';
import 'package:pexllite/constants.dart';

class ChatScreen extends StatelessWidget {
  final String groupName;

  const ChatScreen({super.key, required this.groupName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(groupName),
      ),
      body: Column(
        children: [
          // Chat history
          Expanded(
            child: ListView.builder(
              reverse: true, // This will display the latest message at the bottom
              itemCount: 10, // Replace with the actual number of messages
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Align(
                    alignment: index % 2 == 0
                        ? Alignment.centerLeft
                        : Alignment.centerRight, // Alternate between sender and receiver
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: index % 2 == 0 ? Colors.grey[300] : kPrimaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        'Message $index',
                        style: TextStyle(
                          color: index % 2 == 0 ? Colors.black : Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Text input area
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            color: Colors.grey[200],
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type a message",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send, color: kPrimaryColor),
                  onPressed: () {
                    // Send button action
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
