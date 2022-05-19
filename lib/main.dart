// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TodoList(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  // save data
  final List<String> _tosoList = <String>[];
  // text field
  final TextEditingController _textFieldController = TextEditingController();

  // method
  void _addTodoItem(String title) {
    setState(() {
      _tosoList.add(title);
    });
    _textFieldController.clear();
  }

  Widget _buildTodoItem(String title) {
    return ListTile(
      title: Text(title),
    );
  }

  Future<Future> _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add a task to your  list'),
            content: TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: 'Enter task here'),
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('ADD'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _addTodoItem(_textFieldController.text);
                },
              ),
              FlatButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  List<Widget> _getItems() {
    // ignore: no_leading_underscores_for_local_identifiers
    final List<Widget> _todoWidgets = <Widget>[];
    for (String title in _tosoList) {
      _todoWidgets.add(_buildTodoItem(title));
    }
    return _todoWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: ListView(children: _getItems()),
      floatingActionButton: FloatingActionButton(
        onPressed: (() => _displayDialog(context)),
        tooltip: 'Add Item',
        child: const Icon(Icons.add),
      ),
    );
  }
}
