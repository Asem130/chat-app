
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scholar_chat/widgets/constantes.dart';

class Message 
{
  Message(this.message,this.id);
  final String  message ;
  final String id ;


  factory Message.fromJson(jsonData)
  {

      return Message( jsonData[kMessage],jsonData['id']);
      
  }
}