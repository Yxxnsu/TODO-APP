import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller/todo_controller.dart';
import 'package:todo_app/widgets/todo_form.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TodoController todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Todo APP'),
          centerTitle: true,
        ),
        body: GetBuilder<TodoController>(
            builder: (_) {
          return ListView.builder(
              itemCount: todoController.todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                     showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return TodoForm(type:'NotNew',todo: todoController.todos[index]);
                      });                     
                  },
                  leading: Checkbox(
                    value: todoController.todos[index].isCompleted,
                    onChanged: (value) {
                      todoController.changeStatus(todoController.todos[index]);
                    },
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      todoController.deleteTodo(todoController.todos[index].id);
                    },
                  ),
                  title: Text(
                    todoController.todos[index].description,
                  ),
                );
              });
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {           
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return TodoForm(type:"new");
                });
          },
          child: Icon(Icons.add),
        ));
  }
}
