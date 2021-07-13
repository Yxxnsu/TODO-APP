// import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Todo {

  String id;
  String description;
  bool isCompleted;

  Todo({required this.description}): 
    this.id = Uuid().v1(), 
    this.isCompleted = false;
 
}
 


  
