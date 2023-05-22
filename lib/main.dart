import 'package:flutter/material.dart';
import 'package:todo/widgets/custom_container.dart';
import 'package:todo/widgets/todo_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'TODO APP'),
    );
  }
}

class Item  {
  const Item({
    required this.title,
    required this.isChecked,
    required this.id,
  });

  
  final String title;
  final bool isChecked;
  final int id;

  Item addTodo(bool isChecked) {
    return Item(
      title: this.title,
      isChecked: isChecked ?? this.isChecked,
      id: this.id,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = TextEditingController();
  int _nextId = 1;
  var _items = [
    Item(
      title: 'Meet Client',
      isChecked: true,
      id: 0
    ),
    Item(
      title: 'Review contract',
      isChecked: false,
      id: 1
    )
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          CustomContainer(
            child: Text(
              'To-do list',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            child: TextField(
              controller: _controller,
              onEditingComplete: () {
                String _text = _controller.text;
                print('Enter $_text, $_nextId');
                setState(() {
                  _nextId++;
                  _items = [
                      ..._items,
                      Item(
                        title:  _text, 
                        isChecked: false,
                        id: _nextId,
                    )
                  ];
                  _controller.clear();
                });
              },
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Add a TO-DO',
              ),
            ), 
          ),
          SizedBox(
            height: 10,
          ),
          ..._items.map((item) {
            return TodoItem(
              item: item,
              onChecked: (item) {
                setState(() {
                  _items = _items.map((existingItem) {
                    if (existingItem.id == item.id) {
                      return existingItem.addTodo(!existingItem.isChecked);
                    } else {
                      return existingItem;
                    }
                  }).toList();
                });
              },
              onRemove: (item) {
                setState(() {
                  _items = _items.where(
                      (existingItem) => existingItem.id != item.id
                    ).toList(); 
                });
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}
