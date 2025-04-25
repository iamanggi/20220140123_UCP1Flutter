import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>(); // <-- diletakkan di luar build

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form( // <-- Bungkus dengan Form
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Daftar Akun Baru'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: 
                  Column(
                    children: [
                      Text('Nama Lengkap'),
                      TextFormField(
                        // controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(18))),
                          // labelText: 'Email',
                          hintText: 'Nama Lengkap',
                          prefixIcon: Icon(Icons.email_rounded),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nama Lengkap tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18))
                    ),
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email_rounded)
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'Email tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18))
                    ),
                    hintText: 'No HP',
                    prefixIcon: Icon(Icons.phone)
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
        ),
      ),
    );
  }
}
