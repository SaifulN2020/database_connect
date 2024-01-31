

import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:path/path.dart';


import '';
Database? _database;
List Datalist=[];

class LocalDb{
  Future get database async{
    if(_database !=null) return _database;
    _database=await _initilized("todo.db");
    return _database;


  }
  Future _initilized(String filepath) async {
    final dbpath= await getDatabasesPath();
    final path=join(dbpath,filepath);
    return await openDatabase(path,version:  1,onCreate: _createDB );

  }

  Future _createDB(Database db,int version)async{
    db.execute(
        '''
      CREATE TABLE tbl_data(id INTEGER AUTO INCREMENT PRIMARY KEY,Name TEXT NOT NULL
      '''


    );

  }
  Future adddata({Name}) async{
    final db=await database;
    await db.insert("tbl_data",{"Name ": Name});
    return "Data Added";
  }
  Future readAllData()async{
    final db=await database;
    final allData=await db.query("tbl_data");
    Datalist=allData;
    return "Data returned";
  }
}