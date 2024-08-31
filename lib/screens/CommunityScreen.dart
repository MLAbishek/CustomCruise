import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CommunityScreen extends StatelessWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community', style: TextStyle(color: Colors.orange)),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/user_${index  + 1}.jpg'),
                  ),
                  title: Text('Car Enthusiast ${index + 1}', style: const TextStyle(color: Colors.white)),
                  subtitle: Text('Posted ${index + 1} hour(s) ago', style: const TextStyle(color: Colors.white70)),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Check out my latest custom build! #CustomCruise #CarMod',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                Image.asset(
                  'assets/images/custom_car_${index  + 1}.jpg',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton.icon(
                      icon: const Icon(Icons.thumb_up, color: Colors.orange),
                      label: const Text('Like', style: TextStyle(color: Colors.orange)),
                      onPressed: () {},
                    ),
                    TextButton.icon(
                      icon: const Icon(Icons.comment, color: Colors.orange),
                      label: const Text('Comment', style: TextStyle(color: Colors.orange)),
                      onPressed: () {},
                    ),
                    TextButton.icon(
                      icon: const Icon(Icons.share, color: Colors.orange),
                      label: const Text('Share', style: TextStyle(color: Colors.orange)),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement create post functionality
        },
        child: const Icon(Icons.add, color: Colors.black),
        backgroundColor: Colors.orange,
      ),
    );
  }
}