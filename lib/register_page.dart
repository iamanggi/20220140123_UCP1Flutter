import 'package:flutter/material.dart';
import 'package:ucp1_flutter/login_page.dart';

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

  bool _obscurePassword = true; 
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form( 
        key: _formKey,
        child: Center(
          child: SingleChildScrollView( 
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage('assets/images/logo.png'), 
                  width: 400,
                  height: 180,),
                  const SizedBox(height: 10,),
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
                        fontSize: 14, fontWeight: FontWeight.bold
                      ),),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: 'Nama Lengkap',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15))
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child:Text('Email', style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold
                                  ))),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  prefixIcon: Icon(Icons.email),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(15))
                                  )
                                ),
                                validator: (value) {
                                  if(value == null || value.isEmpty){
                                    return 'Email tidak boleh kosong';
                                  }
                                  return null;
                                },
                              ),
                          ]
                        )),
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
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.phone),
                                    hintText: 'No Hp',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(15))
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
                      const SizedBox(height: 10),
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
                                    child: Text('Password', style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold
                                    ))),
                                    TextFormField(
                                      obscureText: _obscurePassword,
                                      decoration: InputDecoration(
                                        hintText: 'Password',
                                        prefixIcon: Icon(Icons.lock),
                                        suffixIcon: InkWell(
                                        onTap: () {
                                          setState(() {
                                            _obscurePassword = !_obscurePassword;
                                          });
                                        },
                                        child: Icon(
                                          _obscurePassword ? Icons.visibility_off : Icons.visibility,
                                        ),
                                      ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(15))
                                        )
                                      ),
                                      validator: (value) {
                                        if(value == null || value.isEmpty){
                                          return 'Password tidak boleh kosong';
                                        }
                                        return null;
                                      },
                                    ),
                                ]
                              )
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: Text('Konfirmasi Password',  style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold
                                    ))),
                                    TextFormField(
                                      obscureText: _obscureConfirmPassword,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.lock),
                                        suffixIcon: InkWell(
                                          onTap: () {
                                            setState(() {
                                              _obscureConfirmPassword = !_obscureConfirmPassword;
                                            });
                                          },
                                          child: Icon(
                                            _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                                          ),
                                        ),
                                        hintText: 'Konfirmasi Password',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(15))
                                        )
                                      ),
                                      validator: (value) {
                                        if(value == null || value.isEmpty){
                                          return 'Konfirmasi Password tidak boleh kosong';
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => const LoginPage()),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Berhasil Masuk!')),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF003A60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15), 
                            ),
                          ),
                          child: Text(
                            'Daftar',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Sudah Memiliki Akun? Silahkan'),
                        TextButton(onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const LoginPage()),
                          );
                        }
                        , child: Text('Login Disini!',
                        style: TextStyle(color: Color(0xFF003A60))))
                      ],
                    )
                  ],
              ),
            )
                ),
        ),
      )
    );
  }
}
