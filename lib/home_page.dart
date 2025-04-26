import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        iconTheme: IconThemeData(
        color: Colors.white, 
      ),
        toolbarHeight: 100, 
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.jpg'),
              radius: 35,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Selamat Datang',
                    style: TextStyle(
                    fontSize: 15,
                      color: Colors.white)),
                  Text('Admin', 
                  style: TextStyle(
                    fontSize: 19, 
                    fontWeight: FontWeight.bold,  
                    color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.login_rounded),
          )
        ],
      ),
    );
  }
}