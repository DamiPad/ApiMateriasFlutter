import 'main.dart';
import 'rest_api.dart';
import 'package:flutter/material.dart';
 
class AddNewMaterias extends StatefulWidget{
  AddNewMaterias ({Key key}): super(key: key);
  AddNewMateriasPageState createState() => AddNewMateriasPageState();
}
 
class AddNewMateriasPageState extends State<AddNewMaterias>{
  final _nombreController =  TextEditingController();
  final _profesorController = TextEditingController();
  final _cuatrimestreController= TextEditingController();
  final _horarioController =  TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nueva Materia'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _nombreController,
                decoration: InputDecoration(hintText: 'Nombre de la Materia'),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: _profesorController,
                decoration: InputDecoration(hintText: 'Profesor de la Materia'),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: _cuatrimestreController,
                decoration: InputDecoration(hintText: 'Cuatrimestre de la Materia'),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: _horarioController,
                decoration: InputDecoration(hintText: 'Horario de la Materia'),
                keyboardType: TextInputType.text,
              ),

              RaisedButton(
                child: Text(
                  'SAVE',
                  style: TextStyle(
                    color:Colors.white, 
                  ),
                ),
                color: Colors.purple,
                onPressed: (){
                  final body = {
                    "Nombre": _nombreController.text,
                    "Profesor": _profesorController.text,
                    "Cuatrimestre": _cuatrimestreController.text,
                    "Horario":_horarioController.text,
                  };
                  ApiService.addMaterias(body).then((success){
                    if(success){
                      showDialog(
                        builder:(context) => AlertDialog(
                          title: Text('La materia ha sido agregada!!'),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: (){
                                
                                _nombreController.text = '';
                                _profesorController.text = '';
                                _cuatrimestreController.text = '';
                                _horarioController.text = '';
                                Navigator.pop(context);
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(
                                    builder:(context)=> MyApp(),
                                  ),
                                );

                              },
                              child: Text('OK'),
                            )
                          ],
                        ),
                        context: context,
                      );
                      return;
                    } else{
                      showDialog(
                        builder:(context) => AlertDialog(
                          title: Text('Error al agregar una Materia'),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            )
                          ],
                        ),
                        context: context,
                      );
                      return;
                    }
                  });
                },
              
              )
            ],
          ),
        ),
      ),
    );
  }
}