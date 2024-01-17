import 'package:flutter/material.dart';

class SubDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SubDetail();
}

class _SubDetail extends State<SubDetail> {
  List<String> todoList = [];

  @override
  void initState() {
    super.initState();
    todoList.add('야채 사오기');
    todoList.add('약 사오기');
    todoList.add('청소 하기');
    todoList.add('부모님께 연락드리기');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sub Detail Example'),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: InkWell(
              child: Text(
                todoList[index],
                style: TextStyle(fontSize: 30),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/third', arguments: todoList[index]);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNavigation(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _addNavigation(BuildContext context) async{
    final result=await Navigator.of(context).pushNamed('/second');
    if(result is String){
      setState((){
        todoList.add(result);
      });
    }
  }
}


