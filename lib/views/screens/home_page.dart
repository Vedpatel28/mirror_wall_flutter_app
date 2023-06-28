import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mirror_wall_flutter_app/modals/list_search_engine.dart';
import 'package:mirror_wall_flutter_app/utils/routes_utils.dart';

class home_page extends StatelessWidget {
  home_page({super.key});

  Connectivity connectivity = Connectivity();

  String initialUrlRequest =
      'https://pub.dev/packages/flutter_inappwebview/example';

  double _progress = 0;

  InAppWebViewController? inAppWebViewController;

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search Engine",
          style: GoogleFonts.dmSerifText(
            textStyle: const TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            SizedBox(
              height: s.height * 0.45,
              child: GridView.builder(
                itemCount: AllWebside.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(AllRoutes.WebPage, arguments: index);
                  },
                  child: Column(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            // color: Colors.grey,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 3,
                                spreadRadius: 2,
                                offset: Offset(0.2, 0.1),
                                blurStyle: BlurStyle.outer,
                              ),
                            ],
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            image: DecorationImage(
                              image: NetworkImage(AllWebside[index].logo),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: const BoxDecoration(),
                          alignment: const Alignment(0, 0),
                          child: Text(
                            AllWebside[index].name,
                            style: GoogleFonts.dmSerifText(
                              textStyle: const TextStyle(
                                fontSize: 15,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
