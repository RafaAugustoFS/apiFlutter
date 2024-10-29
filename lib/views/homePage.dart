import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}
          String? image;
class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if(image != null) Image.network(image!),
          ElevatedButton(onPressed: () async {
            
            //chamar Api e mostrar os dados no console
            var url = 'https://fakestoreapi.com/products/1';
            // uri.parse trasforma uma string url em uma url
            var response = await http.get(Uri.parse(url));

            var jsonResponse = convert.jsonDecode(response.body);
            setState(() {
              image =jsonResponse['image'];
            });
            print(jsonResponse);
            print(jsonResponse['title']);
            print(jsonResponse['image']);
            print(jsonResponse['description']);
            print(jsonResponse['category']);
            print(jsonResponse['rating'] ['rate']);
            print(jsonResponse['rating'] ['count']);
          },
           child: Text('Testando')
          )
        ],
      )
    );
  }
}