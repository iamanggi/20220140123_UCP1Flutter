import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 
import 'package:intl/date_symbol_data_local.dart';
import 'package:ucp1_flutter/pembayaran.dart';


class PendataanBarang extends StatefulWidget {
  const PendataanBarang({super.key});

  @override
  State<PendataanBarang> createState() => _PendataanBarangState();
}

class _PendataanBarangState extends State<PendataanBarang> {
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController jumlahBarangController = TextEditingController();
  final TextEditingController hargaSatuanController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? selectedJenisTransaksi;
  String? selectedJenisBarang;

  final List<String> jenisTransaksiList = ['Barang Masuk', 'Barang Keluar'];
  final List<String> jenisBarangList = ['Carrier', 'Sleeping Bag', 'Tenda', 'Sepatu'];

  final Map<String, int> hargaBarang = {
    'Carrier': 3500000,
    'Sleeping Bag': 1500000,
    'Tenda': 700000,
    'Sepatu': 2500000,
  };

  @override
void initState() {
  super.initState();
  initializeDateFormatting('id_ID', null);
}

  @override
  void dispose() {
    tanggalController.dispose();
    super.dispose();
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
        tanggalController.text = formattedDate;
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
          'Pendataan Barang',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Color(0xFF003A60),
        toolbarHeight: 100,
      ),
      body: Form( 
        key: _formKey,
        child: SingleChildScrollView( 
          child:  
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tanggal Transaksi', style: TextStyle(
                  fontWeight: FontWeight.bold
                )),
                const SizedBox(height: 10),
                TextFormField(
                    controller: tanggalController,
                    readOnly: true,
                    onTap: _showDatePicker,
                    decoration: InputDecoration(
                      hintText: 'Tanggal Transaksi',
                      prefixIcon: Icon(Icons.calendar_today_rounded),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'Tanggal tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    hintText: 'Jenis Transaksi',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'Pilih Jenis Transaksi';
                    }
                    return null;
                  },
                  value: selectedJenisTransaksi,
                  items: jenisTransaksiList.map((jenis) {
                    return DropdownMenuItem(
                      value: jenis,
                      child: Text(jenis),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedJenisTransaksi = value;
                    });
                  },
                ),
                const SizedBox(height: 30),
                  DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    hintText: 'Jenis Barang',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'Pilih Jenis Barang';
                    }
                    return null;
                  },
                  value: selectedJenisBarang,
                  items: jenisBarangList.map((jenis) {
                    return DropdownMenuItem(
                      value: jenis,
                      child: Text(jenis),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedJenisBarang = value;
                      if (value != null && hargaBarang.containsKey(value)) {
                        hargaSatuanController.text = hargaBarang[value]!.toString();
                      } else {
                        hargaSatuanController.clear();
                      }
                    });
                  },
                ),
                const SizedBox(height: 10),
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
                                    child: Text('Jumlah Barang', style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.bold
                                      ))),
                                      TextFormField(
                                        controller: jumlahBarangController,
                                          decoration: InputDecoration(
                                            hintText: 'Jumlah Barang',
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(15))
                                            )
                                          ),
                                          validator: (value) {
                                            if(value == null || value.isEmpty){
                                              return 'Jumlah Barang tidak boleh kosong';
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
                                          padding: const EdgeInsets.only(bottom: 8),
                                          child: Text('Harga Satuan', style: TextStyle(
                                            fontSize: 14, fontWeight: FontWeight.bold
                                            ))),
                                          TextFormField(
                                            controller: hargaSatuanController,
                                            decoration: InputDecoration(
                                              hintText: 'Harga Satuan',
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(15))
                                              )
                                            ),
                                            validator: (value) {
                                              if(value == null || value.isEmpty){
                                                return 'Harga Satuan tidak boleh kosong';
                                              }
                                              return null;
                                            },
                                          ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: SizedBox(
                          width: 500,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                int jumlahBarang = int.tryParse(jumlahBarangController.text) ?? 0;
                                int hargaSatuan =
                                    int.tryParse(hargaSatuanController.text) ?? 0;
                                int totalHarga = jumlahBarang * hargaSatuan;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailDataBarangPage(
                                      tanggal: tanggalController.text,
                                      jenisTransaksi: selectedJenisTransaksi!,
                                      jenisBarang: selectedJenisBarang!,
                                      jumlah: int.parse(jumlahBarangController.text),
                                      hargaSatuan: int.parse(hargaSatuanController.text),
                                      totalHarga: totalHarga,
                                    ),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:Color(0xFF003A60),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15), 
                              ),
                            ),
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ]
                )
              )
        )
     )
    );
  }
}