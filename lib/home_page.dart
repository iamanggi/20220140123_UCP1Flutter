import 'package:flutter/material.dart';
import 'package:ucp1_flutter/data_pelanggan.dart';
import 'package:ucp1_flutter/data_piket.dart';
import 'package:ucp1_flutter/login_page.dart';
import 'package:ucp1_flutter/pendataan_barang.dart';

class HomePage extends StatefulWidget {
  final String nama;
  const HomePage({super.key,
  required this.nama
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF003A60),
        automaticallyImplyLeading: false, 
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
                      style: TextStyle(fontSize: 15, color: Colors.white)),
                  Text(widget.nama,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context)=> LoginPage()),
                    (route)=> false,
                    ); 
            },
            icon: Icon(Icons.logout_rounded),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
              child: Image.asset('assets/images/banner.png'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 160,
                  width: 180,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DataPiket()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:Color(0xFF003A60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.sync_lock_rounded, size: 50, color: Colors.white),
                        SizedBox(height: 10),
                        Text('Data Piket',
                            style: TextStyle(fontSize: 18, color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  height: 160,
                  width: 180,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CustPage()), 
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF003A60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.dashboard_customize_rounded, size: 50, color: Colors.white),
                        SizedBox(height: 10),
                        Text('Data Pelanggan',
                            style: TextStyle(fontSize: 18, color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              height: 160,
              width: 390, 
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PendataanBarang()), 
                      );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF003A60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.receipt, size: 50, color: Colors.white),
                    SizedBox(height: 10),
                    Text('Barang Masuk/Keluar',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
