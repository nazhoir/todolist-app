import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_app/constant.dart';
import 'package:todolist_app/models/todo_model.dart';
import 'package:todolist_app/providers/todo_provider.dart';
import 'package:uuid/uuid.dart';

class FormCustom extends StatelessWidget {
  const FormCustom({
    Key? key,
    required this.formTitle,
    this.todo,
  }) : super(key: key);

  final String formTitle;
  final TodoModel? todo;

  @override
  Widget build(BuildContext context) {
    TextEditingController _todoTitle = TextEditingController();
    TextEditingController _todoContent = TextEditingController();
    if (todo != null) {
      _todoTitle.text = todo!.todoTitle;
    }
    if (todo != null) {
      _todoContent.text = todo!.todoContent;
    }

    return AlertDialog(
      title: Text(formTitle),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _todoTitle,
              decoration: const InputDecoration(
                border: InputBorder.none,
                labelText: "Title",
                hintText: "Tuliskan judul todo",
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextField(
                controller: _todoContent,
                maxLines: 10,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: "Deskripsi",
                  hintText: "Tuliskan deskripsi todo",
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Batal")),
        TextButton(
            onPressed: () {
              if (_todoTitle.text.isEmpty) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const AlertDialog(
                      title: Text("Error"),
                      content: Text(
                          "Todo tidak boleh boleh kosong. Paling sedikit harus mengisikan judul todo"),
                    );
                  },
                );
              } else {
                if (todo != null) {
                  Provider.of<TodoPrivder>(context, listen: false).updateTodo(
                    TodoModel(
                      id: todo!.id,
                      todoTitle: todo!.todoTitle,
                      todoContent: todo!.todoContent,
                    ),
                  );
                } else {
                  const uuid = Uuid();

                  Provider.of<TodoPrivder>(context, listen: false).addTodo(
                    TodoModel(
                      id: uuid.v4(),
                      todoTitle: _todoTitle.text,
                      todoContent: _todoContent.text,
                    ),
                  );
                }
                Navigator.pop(context);
              }
            },
            child: const Text("Simpan")),
      ],
    );
  }
}
