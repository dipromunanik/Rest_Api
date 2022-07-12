import 'package:flutter/material.dart';
import 'package:rest_flutter/api_class.dart';

class UpdateScreen extends StatefulWidget {
 final String title;
 final String id;

 UpdateScreen({required this.title,required this.id});
  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final ApiService apiService = ApiService();
  TextEditingController textEditing = TextEditingController();

  @override
  void initState() {
   textEditing = TextEditingController(text: widget.title);
    super.initState();
  }
  clearText(){

    textEditing.clear();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('UpdateScreen'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: textEditing,
            decoration:const InputDecoration(
              labelText: 'update text'
            ),
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: (){
              apiService.updateAlbum(widget.title, widget.id);
              clearText();
            },
            child: const SizedBox(
              height: 40,
              width: double.infinity,
              child:Text('Update'),
            ),
          )
        ],
      ),
    );
  }
}
