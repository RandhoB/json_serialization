import 'package:http/http.dart' as http;

void main() async {
  await getData();
}

Future getData() async {
  Uri url = Uri.parse("https://reqres.in/api/users/23");
  var response = await http.get(url);

  print(response.statusCode);

  if (response.statusCode != 200) {
    print("user tidak ditemukan");
  } else {
    print(response.body);
  }
}
