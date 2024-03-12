import 'dart:convert';

import 'package:cmflutter0/src/models/reportsummary_response.dart';
// import 'package:cmflutter0/src/models/youtuce_response.dart';
import 'package:dio/dio.dart';

class ReportService {
  // Future<List<Youtube>> feed() async {
  //   final dio = Dio();
  //   final result = await dio.get(
  //       "https://codemobiles.com/adhoc/youtubes/index_new.php?username=admin&password=password&type=songs");
  //   final youtubeResponse = youtubeResponseFromJson(result.data);

  //   // print(youtubeResponse.youtubes[0].title);
  //   return youtubeResponse.youtubes;
  // }

  Future<List<Rowstable1>> getreport() async {
    // try {
    //   final response =
    //       await Dio().get('http://10.10.0.62:9001/api/reportevent/2024-02-27');
    //   print(response.data);
    // } catch (error) {
    //   print('Error: $error');
    // }
    final dio = Dio();
    final result = await await Dio()
        .get('http://10.10.0.62:9001/api/reportevent/2024-02-27');
    print(result.data);
    final reportResponse = summaryResponseFromJson(jsonEncode(result.data));
    // print(reportResponse.rowstable1);
    return reportResponse.rowstable1;
  }
}
