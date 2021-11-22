import 'dart:io';
import 'dart:convert';

Future<void> main() async {
  var config = File('file.txt');

  // Put the whole file in a single string.
  var stringContents = await config.readAsString();
  print('The file is ${stringContents.length} characters long.');

  // Put each line of the file into its own string.
  var lines = await config.readAsLines();
  print('The file is ${lines.length} lines long.');

  var config1 = File('file.txt');

  var contents = await config1.readAsBytes();
  print('The file is ${contents.length} bytes long.');
  var config2 = File('file.txt');
  try {
    var contents = await config2.readAsString();
    print(contents);
  } catch (e) {
    print(e);
  }
  var config3 = File('file.txt');
  Stream<List<int>> inputStream = config3.openRead();

  var lines1 = utf8.decoder.bind(inputStream).transform(const LineSplitter());
  try {
    await for (final line in lines1) {
      print('Got ${line.length} characters from stream');
    }
    print('file is now closed');
  } catch (e) {
    print(e);
  }
  var logFile = File('log.txt');
  var sink = logFile.openWrite();
  sink.write('FILE ACCESSED ${DateTime.now()}\n');
  await sink.flush();
  await sink.close();
  var sink1 = logFile.openWrite(mode: FileMode.append);

  var dir = Directory('tmp');

  try {
    var dirList = dir.list();
    await for (final FileSystemEntity f in dirList) {
      if (f is File) {
        print('Found file ${f.path}');
      } else if (f is Directory) {
        print('Found dir ${f.path}');
      }
    }
  } catch (e) {
    print(e.toString());
  }
}
