import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService{

  Future getAlbum()async{

   var response = await http.get(Uri.https('jsonplaceholder.typicode.com', 'photos'));
    print(response.statusCode);
    if(response.statusCode ==200){
      return jsonDecode(response.body);
    }else{
      throw Exception('Faild to load Data');
    }

  }

  Future sendAlbum(String title)async{

    var response = await http.post(Uri.https('jsonplaceholder.typicode.com', 'photos'),
    body: jsonEncode(<String,String>{
      'title':title
    }),
      headers: <String,String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }

    );

    print("Post-Code ${response.statusCode}");
    if(response.statusCode ==201){
      return jsonDecode(response.body);
    }else{
      throw Exception('Failed to load Data');
    }

  }
  Future updateAlbum(String title,id)async{

    var response = await http.put(Uri.https('jsonplaceholder.typicode.com', 'photos/$id'),
        body: jsonEncode(<String,String>{
          'title':title
        }),
        headers: <String,String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }

    );

    print("Update-Code ${response.statusCode}");
    if(response.statusCode ==200){
      return jsonDecode(response.body);
    }else{
      throw Exception('Failed to load Data');
    }

  }
  Future deleteAlbum(id)async{

    var response = await http.delete(Uri.https('jsonplaceholder.typicode.com', 'photos/$id'),
        headers: <String,String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }

    );
    print("Delete-Code ${response.statusCode}");
    if(response.statusCode ==200){
      return true;
    }else{
     return false;
    }

  }
}