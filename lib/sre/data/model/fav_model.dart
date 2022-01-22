
import 'dart:convert';

import 'package:discy_application/sre/domain/entities/favorite.dart';

ChangeFavoriteModel changeFavoriteModel(String str)=>ChangeFavoriteModel.fromJson(json.decode(str));

class ChangeFavoriteModel extends ChangeFavorite{
  ChangeFavoriteModel({required bool status,required bool favorite}) : super(status: status,favorite:  favorite);
factory ChangeFavoriteModel.fromJson(Map<String, dynamic> json) =>ChangeFavoriteModel(

  status:json['status'],
   favorite:json['favorite'],
 );


}