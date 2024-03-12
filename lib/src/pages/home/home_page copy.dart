import 'package:flutter/material.dart';

import '../../services/webapi_service.dart';

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
    WebApiService().feed();
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
          future: WebApiService().feed(),
          builder: (context, snapshot) {
            if (snapshot.hasData == false) {
              return Text("Loading...");
            }

            final youtubes = snapshot.data;

            // return Column(
            //   children: [...youtubes!.map((e) => Text(e.title))],
            // );

            return ListView.builder(
              itemCount: youtubes!.length,
              itemBuilder: ((context, index) {
                return TextButton(
                  onPressed: () => print(youtubes![index].title),
                  child: Card(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(youtubes![index].title),
                        // Text(youtubes![index].subtitle),
                        Image.network(youtubes![index].youtubeImage)
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
