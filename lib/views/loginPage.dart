import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:proj_api/widgets/formRegister.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              SizedBox(height: 70),
              Text(
                'Register',
                style: TextStyle(fontSize: 24),
              ),
              FormRegisters(),
              ElevatedButton(
                onPressed: () async {
                  var client = http.Client();
                  var url = 'http://10.92.198.38:4000/user/login';
                  var bodyRegistro = {
                    "email": "email2@email.com",
                    "password": "password"
                  };
                  try {
                    var response = await client.post(Uri.parse(url),
                        headers: {
                          'Content-Type': 'application/json',
                        },
                        body: json.encode(bodyRegistro));
                    print(response.body);
                  } finally {
                    client.close();
                  }
                },
                child: Text('Register'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
