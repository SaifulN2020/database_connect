import 'package:flutter/material.dart';

import '../helper/local_db.dart';

class DatabaseHome extends StatefulWidget {
  const DatabaseHome({Key? key}) : super(key: key);

  @override
  State<DatabaseHome> createState() => _DatabaseHomeState();
}

class _DatabaseHomeState extends State<DatabaseHome> {
  final TextEditingController _nameController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Database "),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration:  InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  )

              ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: ()async {
              await LocalDb().adddata(Name: _nameController.text);
              await LocalDb().readAllData();
              setState(() {

              });


            }, child: const Text("Save")),
            Expanded(child: ListView.separated(
                itemBuilder: (contex,index){
                  return Container(
                    height: 70,
                    width: double.infinity,
                    child: Card(child: Text(Datalist[index]["name"]),
                    ),
                  );
                },
                separatorBuilder: (contex,index){
                  return const SizedBox(height: 5);
                },
                itemCount: Datalist.length))

          ],
        ),
      ),


    );
  }
}
