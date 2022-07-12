import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rest_flutter/api_class.dart';
import 'package:rest_flutter/api_class.dart';
import 'package:rest_flutter/update_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var textEditing =TextEditingController();
  ApiService apiService = ApiService();

  List task=[];

 @override
  void initState() {
   getData();
    super.initState();
  }

  getData()async{

   task = await apiService.getAlbum();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('HomePage'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.only(top: 50,left: 20,right: 20),
          child: Column(
            children: [
               TextField(
                 controller: textEditing,
                decoration:const InputDecoration(
                  hintText: 'text tile'
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  var title = textEditing.text;
                  apiService.sendAlbum(title);
                }, child:const Text('SAVE')),
              ),
              const SizedBox(height: 15),
             ...task.map((task) {
               return SingleChildScrollView(
                 scrollDirection: Axis.horizontal,
                 child: Card(
                     child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                         IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateScreen(
                          title: task['title'],
                          id: task['id'].toString(),
                        )));
                 }, icon:const Icon(Icons.edit,color: Colors.pink)),
                 const SizedBox(width: 30),
                 Text(task['title'],style:const TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                 const SizedBox(width: 30),
                 IconButton(onPressed: (){
                   apiService.deleteAlbum(task['id']);
                 }, icon:const Icon(Icons.delete,color: Colors.pink))
                 ],
                 ),
                 ),
               );
             }),


            ],
          ),
        ),
      ),
    );
  }
}
