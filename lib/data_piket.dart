import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 
import 'package:intl/date_symbol_data_local.dart';
import 'package:ucp1_flutter/detail_piket.dart';


class DataPiket extends StatefulWidget {
  const DataPiket({super.key});

  @override
  State<DataPiket> createState() => _DataPiketState();
}

class _DataPiketState extends State<DataPiket> {
  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _tugasController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  List<Map<String, dynamic>> _daftarPiket = [];

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('id_ID', null);
  }

  @override
  void dispose() {
    _tanggalController.dispose();
    _tugasController.dispose();
    _namaController.dispose();
    super.dispose();
  }

  void _tambahTugas() {
    if (_tugasController.text.isNotEmpty &&
        _namaController.text.isNotEmpty &&
        _tanggalController.text.isNotEmpty) {
      setState(() {
        _daftarPiket.add({
          'nama': _namaController.text,
          'tanggal': _tanggalController.text,
          'tugas': _tugasController.text,
        });
        _tugasController.clear();
        _namaController.clear();
        _tanggalController.clear();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Lengkapi semuannya!'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  void _showDatePicker() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('EEEE, d MMMM yyyy', 'id_ID').format(pickedDate);
      setState(() {
        _tanggalController.text = formattedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);  
          },
        ),
        centerTitle: true,
        title: Text(
          'Piket Gudang',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor:Color(0xFF003A60),
        toolbarHeight: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nama Anggota',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _namaController,
                  decoration: InputDecoration(
                    hintText: 'Nama Anggota',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Pilih Tanggal',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _tanggalController,
                  readOnly: true,
                  onTap: _showDatePicker,
                  decoration: InputDecoration(
                    hintText: 'Pilih Tanggal',
                    prefixIcon: Icon(Icons.calendar_today_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tanggal tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Text('Tugas Piket',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                            ),
                            TextFormField(
                              controller: _tugasController,
                              decoration: InputDecoration(
                                hintText: 'Tugas Piket',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Tugas tidak boleh kosong';
                                }
                                return null;
                              },
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
                              padding: const EdgeInsets.only(top: 25),
                              child: SizedBox(
                                height: 50,
                                width: 200,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _tambahTugas();
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('Berhasil Ditambahkan!')),
                                      );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF003A60),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                  child: Text('Tambah', style: TextStyle(color: Colors.white, fontSize: 15)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Center(
                  child: Text('Daftar Tugas Piket',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ),
                _daftarPiket.isEmpty
                      ? Padding(
                        padding: const EdgeInsets.only(top: 150),
                        child: Center(
                            child: Text(
                              'Belum ada Data',
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ),
                      )
                      : ListView.builder(
                          itemCount: _daftarPiket.length,
                          itemBuilder: (context, index) {
                            return Card(
                              color: Color(0xFF003A60),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ListTile(
                                title: Text(
                                  _daftarPiket[index]['tugas'],
                                  style: const TextStyle(color: Colors.white),
                                ),
                                trailing: const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.white,
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailPiket(
                                        nama: _daftarPiket[index]['nama'],
                                        tanggal: _daftarPiket[index]['tanggal'],
                                        tugas: _daftarPiket[index]['tugas'],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
