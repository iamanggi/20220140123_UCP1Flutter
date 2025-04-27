import 'package:flutter/material.dart';

class DetailPiket extends StatelessWidget {
  final String nama;
  final String tanggal;
  final String tugas;

  const DetailPiket({
    Key? key,
    required this.nama,
    required this.tanggal,
    required this.tugas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          'Detail $tugas', 
          style: const TextStyle(color: Colors.white),
        ),
        toolbarHeight: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tanggal,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    nama,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 30),
            Container(
              height: 60,
              width: 400,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                tugas,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
