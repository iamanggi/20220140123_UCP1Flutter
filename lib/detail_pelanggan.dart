import 'package:flutter/material.dart';

class DetailPelanggan extends StatelessWidget {
  final String nama;
  final String email;
  final String noHp;
  final String alamat;
  final String provinsi;
  final String kodePos;

  const DetailPelanggan({
    Key? key,
    required this.nama,
    required this.email,
    required this.noHp,
    required this.alamat,
    required this.provinsi,
    required this.kodePos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xFF003A60),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          'Detail $nama', 
          style: const TextStyle(color: Colors.white, 
          fontWeight: FontWeight.bold),
        ),
        toolbarHeight: 100,
      ),
      body: SingleChildScrollView( 
        child: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
            const SizedBox(height: 20),
            Text(nama, style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold
            )),
            Text(email),
            Text(noHp),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Alamat', style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),),
                  const SizedBox(height: 10),
                  TextFormField(
                    initialValue: alamat,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                    ),
                    readOnly: true,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Text('Provinsi', style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.bold
                                      ))),
                                    TextFormField(
                                      initialValue: provinsi,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(15))
                                        )
                                      ),
                                      readOnly: true,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: Text('Kode Pos', style: TextStyle(
                                        fontSize: 14, fontWeight: FontWeight.bold
                                        ))),
                                      TextFormField(
                                        initialValue: kodePos,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(15))
                                          )
                                        ),
                                        readOnly: true,
                                      ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: SizedBox(
                      width: 500,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(context, '/homepage', (route) => false);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF003A60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15), 
                          ),
                        ),
                        child: Text(
                          'Selesai',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      )
    );
  }
}
