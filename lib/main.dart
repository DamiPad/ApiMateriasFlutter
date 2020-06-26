import 'package:flutter/material.dart';
import 'rest_api.dart';
import 'add_new_materias.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: MateriasPage(),
    );
  }
}

class MateriasPage extends StatefulWidget {
 MateriasPage({Key key}) : super(key: key);

  @override
   MateriasPageState createState() =>  MateriasPageState();
}

class  MateriasPageState extends State <MateriasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter REST API'),
      ),
      body: FutureBuilder(
        future: ApiService.getMaterias(),
        builder: (context, snapshot){
          final materias =  snapshot.data;
          if(snapshot.connectionState == ConnectionState.done){
            return ListView.separated(
              separatorBuilder:(context,index){
                return Divider(
                  height: 2,
                  color: Colors.black,
                );
              },
              itemBuilder: (context,index){
                return ListTile(
                  title: Text(materias[index]['Nombre']?? ''),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(materias[index]['Profesor'] ?? ''),
                      Text(materias[index]['Cuatrimestre'] ?? ''),
                      Text(materias[index]['Horario'] ?? ''),
    
                    ],
                  ),
                  
                );
              },
              itemCount: materias.length
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder:(context)=> AddNewMaterias(),
            ),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
        
      ),
    );
  }
}