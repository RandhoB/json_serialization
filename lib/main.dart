import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:latihanjson/models/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Future<UserModel?> getData() async {
    Uri url = Uri.parse("https://reqres.in/api/users/6");
    var response = await http.get(url);

    print(response.statusCode);

    if (response.statusCode != 200) {
      print("user tidak ditemukan");
      return null;
    } else {
      print(response.body);
      Map<String, dynamic> data =
          (json.decode(response.body) as Map<String, dynamic>);
      return UserModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("LATIHAN JSON SERIALIZABLE"),
      ),
      body: FutureBuilder<UserModel?>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasData) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: CircleAvatar(
                        radius: 50,
                        child: Image.network("${snapshot.data!.data.avatar}"),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text("ID : ${snapshot.data!.data.id}"),
                    Text("Email : ${snapshot.data!.data.email}"),
                    Text("First Name : ${snapshot.data!.data.first_name}"),
                    Text("Last Name : ${snapshot.data!.data.last_name}"),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("URL : ${snapshot.data!.support.url}"),
                        Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Text : ${snapshot.data!.support.text}",
                              textAlign: TextAlign.center,
                            )),
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return Center(child: Text("TIDAK ADA DATA"));
            }
          }
        },
      ),
    );
  }
}
