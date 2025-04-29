import 'package:flutter/material.dart';
import 'package:ucp1_flutter/detail_pelanggan.dart';

class CustPage extends StatefulWidget {
   final String namaAdmin;
  const CustPage({super.key,
  required this.namaAdmin});

  @override
  State<CustPage> createState() => _CustPageState();
  
}

final _formKey = GlobalKey<FormState>(); 

class _CustPageState extends State<CustPage> {
  final TextEditingController namaCustController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController noHpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController provinsiController = TextEditingController();
  final TextEditingController kodePosController = TextEditingController();


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
          'Data Pelanggan',
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
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nama Cust ', style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold
                    ),),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: namaCustController,
                      decoration: InputDecoration(
                        hintText: 'Nama Cust',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        )
                      ),
                      validator: (value) {
                          if(value == null || value.isEmpty){
                            return 'Nama Cust tidak boleh kosong';
                          }
                          return null;
                        },
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
                                    child: Text('Email', style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.bold
                                      ))),
                                    TextFormField(
                                      controller: emailController,
                                      decoration: InputDecoration(
                                        hintText: 'Email',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10))
                                        )
                                      ),
                                      validator: (value) {
                                        if(value == null || value.isEmpty){
                                          return 'No Hp tidak boleh kosong';
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
                                      child: Text('No Hp', style: TextStyle(
                                        fontSize: 14, fontWeight: FontWeight.bold
                                        ))),
                                      TextFormField(
                                        controller: noHpController,
                                        decoration: InputDecoration(
                                          hintText: 'No Hp',
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(10))
                                          )
                                        ),
                                        validator: (value) {
                                          if(value == null || value.isEmpty){
                                            return 'No Hp tidak boleh kosong';
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
                    const SizedBox(height: 15),
                    Text('Alamat ', style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold
                    ),),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: alamatController,
                      decoration: InputDecoration(
                        hintText: 'Alamat',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        )
                      ),
                      validator: (value) {
                          if(value == null || value.isEmpty){
                            return 'Alamat tidak boleh kosong';
                          }
                          return null;
                        },
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
                                      controller: provinsiController,
                                      decoration: InputDecoration(
                                        hintText: 'Provinsi',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10))
                                        )
                                      ),
                                      validator: (value) {
                                        if(value == null || value.isEmpty){
                                          return 'Provinsi tidak boleh kosong';
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
                                      child: Text('Kode Pos', style: TextStyle(
                                        fontSize: 14, fontWeight: FontWeight.bold
                                        ))),
                                      TextFormField(
                                        controller: kodePosController,
                                        decoration: InputDecoration(
                                          hintText: 'Kode Pos',
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(10))
                                          )
                                        ),
                                        validator: (value) {
                                          if(value == null || value.isEmpty){
                                            return 'Pos tidak boleh kosong';
                                          }
                                          return null;
                                        },
                                      ),
                                  ]
                                )
                              )
                        ]
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: SizedBox(
                        width: 500,
                        height: 50,
                        child: ElevatedButton(onPressed: (){
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPelanggan(
                                  nama: namaCustController.text,
                                  email: emailController.text,
                                  noHp: noHpController.text,
                                  alamat: alamatController.text,
                                  provinsi: provinsiController.text,
                                  kodePos: kodePosController.text,
                                  namaAdmin: widget.namaAdmin,
                                ),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF003A60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15), 
                          ),
                        ),
                        child: Text('Simpan',  style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        width: 500,
                        height: 50,
                        child: ElevatedButton(onPressed: (){
                          namaCustController.clear();
                          emailController.clear();
                          noHpController.clear();
                          alamatController.clear();
                          provinsiController.clear();
                          kodePosController.clear();
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Color(0xFF003A60)), 
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text('Reset',  style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF003A60),
                          ),)),
                      ),
                    )
                  ]
                )
              )
      )
      )
    );
  }
}
