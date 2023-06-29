import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class Helper{


Future<File> downloadFile(String url) async {
  final dio = Dio();
  try {
    final response = await dio.get(url, options: Options(responseType: ResponseType.bytes));


    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/file.mp4');
    await file.writeAsBytes(response.data, flush: true);
    return file;
  } catch (e) {
    throw Exception('Failed to download file: $e');
  }
}


}