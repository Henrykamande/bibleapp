import 'dart:convert';

import 'package:bibleapp/constants/constants.dart';
import 'package:bibleapp/models/bible.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';


class BibleProvider with ChangeNotifier{

late BibleResponse _bible;

BibleResponse get bibleData => _bible;
  Future<BibleResponse> getBibles() async{

    
var url = Uri.http(
      baseUrl,
      '/api/bible',
    );
    try {
     var  response = await http.get(
        url,
        headers: headers,
      );
     // print(response.body);

      if(response.statusCode==200)

      {
       // print(response.statusCode);
          var jsonData = await jsonDecode(response.body);
         // print(jsonData);
          BibleResponse bibleData =  BibleResponse.fromJson(jsonData);
          print(bibleData);
        
     ///SSS print(property);
      _bible= bibleData;

      notifyListeners();
     return bibleData;

      } else {
        throw(response.body);
      }
     // properties = Property.fromJson(data['ResponseData']);

   
      
    } catch (e) {
      print(e);
      throw Exception(e);
       
    }



    
  }

}