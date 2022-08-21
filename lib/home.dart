import 'package:flutter/material.dart';
import 'package:todolist_app/constant.dart';
import 'package:todolist_app/enum.dart';
import 'package:todolist_app/models/todo_model.dart';
import 'package:todolist_app/providers/todo_provider.dart';
import 'package:todolist_app/widget/custom_card.dart';
import 'package:provider/provider.dart';
import 'package:todolist_app/widget/custom_form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Todo? selectTodo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("TodoList App"),
        elevation: 0,
        backgroundColor: primaryColor,
      ),
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Consumer<TodoPrivder>(
          builder: (context, todoProvider, child) {
            return Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: todoProvider.todolist.isNotEmpty
                    ? todoProvider.todolist.map((todo) {
                        return Dismissible(
                          key: Key(todo.id),
                          background: Container(
                            color: Colors.red,
                            child: const Text(
                              "Hapus",
                              style: TextStyle(color: secondaryColor),
                            ),
                          ),
                          child: TodoCard(
                            title: todo.todoTitle,
                            content: todo.todoContent,
                            date: "Date",
                            drag: () {},
                            edit: () {
                              showDialog(
                                context: context,
                                builder: (context) => FormCustom(
                                  formTitle: "Edit Todo",
                                  todo: todo,
                                ),
                              );
                            },
                          ),
                          onDismissed: (direction) {
                            Provider.of<TodoPrivder>(
                              context,
                              listen: false,
                            ).removeTodo(todo);
                          },
                        );
                      }).toList()
                    : [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: const Center(
                            child: Text(
                              "Tidak Hal perlu dikerjakan",
                              style: TextStyle(color: secondaryColor),
                            ),
                          ),
                        ),
                      ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const FormCustom(
              formTitle: "Tambah Todo",
            ),
          );
        },
      ),
    );
  }
}
