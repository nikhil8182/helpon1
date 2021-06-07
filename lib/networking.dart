import 'package:http/http.dart' as  http;


class Network {


  Future<dynamic>  getJson()  async{
    
    http.Response response = await http.get(Uri.parse("http://34.83.46.202/cyberhome/home.php?username=api&query=json"));
    var data = response.body;

    return data;
    
  }
  Future<dynamic>  getJsonKey()  async{

    http.Response response = await http.get(Uri.parse("http://o.j:8000/key"));
    var data = response.body;
    return data;

  }
  
}