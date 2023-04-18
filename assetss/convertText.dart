import 'dart:io';

Future<void> main() async{
  final file = File('/Users/soft_code/Documents/dLearner/assetss/text.txt');
  final contents = await file.readAsString();
  print('comment============ $contents');
}

//If the file is large, you can read it as a stream.
// This allows you to start processing the data more quickly,
// since you don’t have to wait to finish reading the entire file