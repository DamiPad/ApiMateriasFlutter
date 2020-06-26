import 'dart:convert';
import 'package:http/http.dart' as http;

class URLS{
  static const String BASE_URL = 'https://materia20200625102350.azurewebsites.net/api/Materias';
}

class ApiService{
  static Future<List<dynamic>> getMaterias() async{
    final response = await http.get('${URLS.BASE_URL}');
    if(response.statusCode == 200){
      return json.decode(response.body);
    } else{
      return null;
    }
  }


  static Future<bool> addMaterias(body) async{
    final response = await http.post(
      '${URLS.BASE_URL}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );
    if(response.statusCode == 200 || response.statusCode == 201){
      return true;
    }else{
      return false;
    }
  }
}