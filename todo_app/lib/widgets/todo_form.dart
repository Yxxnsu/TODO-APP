import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller/todo_controller.dart';
import 'package:todo_app/model/todo.dart';

class TodoForm extends StatefulWidget {
  final String type;
  final Todo? todo;

  const TodoForm({
    Key? key,
    required this.type,
    this.todo,
  }) : super(key: key);

  @override
  _TodoFormState createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final _formKey = GlobalKey<FormState>();

  //TODO: 내일 정리하기
  final TodoController todoController = Get.find();
  late String description;

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: EdgeInsets.all(12),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text(
              'Add Todo',
              style: Theme.of(context).textTheme.headline5,
            ),
            TextFormField(
              initialValue: widget.todo != null ? widget.todo!.description : '',
              onSaved: (value) => description = value!,
                decoration: InputDecoration(
              hintText: 'Add Description',
              )
            ),
            TextButton(  
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                _formKey.currentState!.save();
                if(widget.type == 'new'){
                  todoController.addTodo(Todo(description: description));
                }
                else{
                  todoController.updateTodo(widget.todo,description);
                }                
                //Get.back();
                Navigator.of(context).pop();
              }, 
              child: Text(
                widget.todo != null ? 'Update' : 'Add',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}