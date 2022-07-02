import 'dart:convert';
import 'package:resep_makanan/model/resep.api.dart';
import 'package:http/http.dart' as http;
import 'package:resep_makanan/model/resep.dart';

class ResepApi{

// const req = unirest("GET", "https://yummly2.p.rapidapi.com/feeds/list");

// req.query({
	// "limit": "24",
	// "start": "0"
// });

// req.headers({
	// "X-RapidAPI-Key": "31ec4bb481mshfe0d25a1716d94fp109908jsnb24b15919ba9",
	// "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
	// "useQueryString": true
// });


  static Future<List<Resep>> getResep() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
    {"start": "0","limit": "24",});


    final response = await http.get(uri, headers: {

      "X-RapidAPI-Key": "31ec4bb481mshfe0d25a1716d94fp109908jsnb24b15919ba9",
      "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);

    List _temp = [];

    for(var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return Resep.resepFromSnapshot(_temp);
  }
}