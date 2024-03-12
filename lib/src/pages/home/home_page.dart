// import 'package:cmflutter0/src/services/webapi_report.dart';
import 'package:cmflutter0/src/services/webapi_report.dart';
import 'package:flutter/material.dart';

// import '../../services/webapi_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ReportService().getreport();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: Text("HomePage"),
        ),
        body: Container(
            child: FutureBuilder(
          future: ReportService().getreport(),
          builder: (context, snapshot) {
            if (snapshot.hasData == false) {
              return Text("Loading....");
            }

            final summary = snapshot.data;

            // return Column(
            //   children: [...youtubes!.map((e) => Text(e.title))],
            // );

            return ListView.builder(
              itemCount: summary!.length,
              itemBuilder: ((context, index) {
                return TextButton(
                  onPressed: () => print(summary![index].brnName),
                  child: Card(
                    margin: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(summary![index].brnName),
                        // Text(youtubes![index].subtitle),
                        Text(summary![index].totalAmount)
                      ],
                    ),
                  ),
                );
              }),
            );
          },
        )));
  }
}
