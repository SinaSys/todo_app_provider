import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/todo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ChangeNotifierProvider(
          create:(context) => Todo() ,
          child: MyHomePage(),
        ));}
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
                child: Consumer<Todo>(
                  builder: (context, todo, child){
                    return ListView.builder(
                        itemCount: todo.taskList.length,
                        itemBuilder: (context, index){
                          return Container(
                            child: ListTile(
                              contentPadding: EdgeInsets.only(left: 32, right: 32, top: 8, bottom: 8),
                              title: Text(todo.taskList[index].title, style : TextStyle(color: Colors.black87,
                                  fontWeight: FontWeight.bold),),
                              subtitle: Text(todo.taskList[index].detail, style: TextStyle(color: Colors.black45,
                                  fontWeight: FontWeight.bold),),

                              trailing: Icon(Icons.check_circle, color: Colors.greenAccent,),
                            ),
                            margin: EdgeInsets.only(bottom: 8, left: 16, right: 16),
                          );
                        }
                    );
                  },
                )
            ),
          )
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Provider.of<Todo>(context,listen: false).addTaskInList();
        },
      ),
    );
  }
}