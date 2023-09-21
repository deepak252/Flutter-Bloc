import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;


class ApiRequest{
  static const _horoscopeApi = "https://api.prod.astrotalk.in/AstroTalk/horoscope3/get?type=DAILY&zodiac=&languageId=1&time=1695113063283&timezone=Asia/Kolkata";
  static Future horoscope()async{
    try{
      log('fetching horoscope');
      var response = await http.get(
        Uri.parse(_horoscopeApi)
      );
      // log('body : ${response.body}');
      if(response.statusCode==200){
        var data = json.decode(response.body)['data'];
        log('${data[0]['personal']}');
      }else{
        throw "Something went wrong";
      }
    }catch(e){
      log("Error", error: e);
    }

  }
}