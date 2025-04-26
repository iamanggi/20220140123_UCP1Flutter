import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>(); 
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form( 
        key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Daftar akun baru'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ), 
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nama Lengkap', style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold
                    ),),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: 'Nama Lengkap',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        )
                      ),
                      validator: (value) {
                          if(value == null || value.isEmpty){
                            return 'Nama Lengkap tidak boleh kosong';
                          }
                          return null;
                        },
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          )
                        ),
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return 'Email tidak boleh kosong';
                          }
                          return null;
                        },
                      )),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone),
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
                      )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Password', style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold
                    ),),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Password',
                              prefixIcon: Icon(Icons.lock),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10))
                              )
                            ),
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return 'Password tidak boleh kosong';
                              }
                              return null;
                            },
                          )),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                hintText: 'Konfirmasi Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                                )
                              ),
                              validator: (value) {
                                if(value == null || value.isEmpty){
                                  return 'Konfirmasi Password tidak boleh kosong';
                                }
                                return null;
                              },
                            ),
                          )
                      ],
                    ),
                  ],
                ),
              ),
              ]
              
            ),
          )
        )
      
    );
}
}
