import 'dart:io';

String fixture({required String path}) => File('test/$path').readAsStringSync();
