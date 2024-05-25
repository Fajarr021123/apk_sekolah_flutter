import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../components/custom_surfix_icon.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../helper/keyboard.dart';
import '../../forgot_password/forgot_password_screen.dart';
import '../../login_success/login_success_screen.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? nip;
  String? password;
  bool? remember = false;
  bool _isPasswordVisible = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  Future<void> _login(String nip, String password) async {
    String apiUrl = 'http://127.0.0.1:8000/api/login';
    Map<String, String> headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {'NIP': nip, 'password': password};

    try {
      var response = await http.post(Uri.parse(apiUrl),
          headers: headers, body: jsonEncode(body));

      if (response.statusCode == 200) {
        // Login berhasil
        // Navigasi ke layar keberhasilan
        Navigator.pushNamed(context, LoginSuccessScreen.routeName);
      } else {
        // Login gagal
        // Tampilkan pesan kesalahan, misalnya, menggunakan SnackBar
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                Text('Login gagal. Periksa kembali NIPs dan password Anda.')));
      }
    } catch (e) {
      // Tangani kesalahan saat melakukan panggilan API
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Terjadi kesalahan. Silakan coba lagi nanti.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.number,
            onSaved: (newValue) => nip = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kNipNullError);
              }
              if (RegExp(r'^\d+$').hasMatch(value)) {
                removeError(error: kInvalidNipError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kNipNullError);
                return "";
              } else if (!RegExp(r'^\d+$').hasMatch(value)) {
                addError(error: kInvalidNipError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "NIP/NIS",
              hintText: "Masukan NIP/NIS",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            obscureText: !_isPasswordVisible,
            onSaved: (newValue) => password = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kPassNullError);
              }
              if (value.length >= 8) {
                removeError(error: kShortPassError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kPassNullError);
                return "";
              } else if (value.length < 8) {
                addError(error: kShortPassError);
                return "";
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "Masukan password",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              const Text("Simpan Login"),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: const Text(
                  "Lupa Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                _login(nip!, password!);
              }
            },
            child: const Text("Selanjutnya"),
          ),
        ],
      ),
    );
  }
}

// Constants file
const String kNipNullError = "NIP/NIS tidak boleh kosong";
const String kInvalidNipError = "NIP/NIS harus berupa angka";
const String kPassNullError = "Password tidak boleh kosong";
const String kShortPassError = "Password terlalu pendek";
