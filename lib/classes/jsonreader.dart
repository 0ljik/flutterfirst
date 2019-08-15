import 'dart:convert';
import 'dart:io';

import 'package:first/models/users.dart';
import 'package:first/models/drivers.dart';
class DataLogic {


   dynamic/*Future<String>*/ readFile(String filename) async {
    var file = File(filename);
    String contents;
/*try {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/my_file.txt');
    contents = await file.readAsString();
  } catch (e) {
    print("Couldn't read file");
  }*/
    if (await file.exists()) {
      // Read file
      contents = await file.readAsString();
      return contents;
    }
    return 'File not found';
  }
  dynamic writeFile(String filename, var contents) async {
    // Write file
    String json = jsonEncode(contents);
    var fileCopy = await File(filename).writeAsString(json);
    if (await fileCopy.exists()){
      return 1;
    }
    return 0;
  }

  User getUser(){
    Map userMap = jsonDecode(readFile("users.json"));
    var user = User.fromJson(userMap);
    return user;
  }
  Driver getDriver(){
    Map userMap = jsonDecode(readFile("users.json"));
    var driver = Driver.fromJson(userMap);
    return driver;
  }

}