
import 'dart:convert';

ChangeFavoriteModel changeFavoriteModel(String d)=>ChangeFavoriteModel.fromJson(json.decode(d.toString()));

class ChangeFavoriteModel{
 final bool status;
 final bool  favorite;

 ChangeFavoriteModel({required this.status,required this.favorite});
 factory ChangeFavoriteModel.fromJson(Map<String, dynamic> json) =>ChangeFavoriteModel(

   status:json['status'],
   favorite:json['favorite'],
 );


}