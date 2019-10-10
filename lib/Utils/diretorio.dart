import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Diretorio {
  static Future<String>localPath() async {
      final directory = await getApplicationDocumentsDirectory();
      return directory.path;
  }

  static Future<String>getDirectoryTemp() async {
    final path = await localPath();
    var dir = await new Directory('${path}/temp').create(recursive: true);
    return dir.path;
  }

    static Future<String>getDirectoryTemp1(String path) async {
    var dir = await new Directory('${path}/temp').create(recursive: true);
    return dir.path;
  }


 static Future<bool>DeleteDir(String dirPath) async{
  if (Directory(dirPath).existsSync()) {
    var dir = new Directory(dirPath);
    dir.deleteSync(recursive: true);
    if (Directory(dirPath).existsSync()) {
      print('Diretório ja existe!');
    } else {
      print('Diretório inexistente!');
    }
  }
 }
}
  

