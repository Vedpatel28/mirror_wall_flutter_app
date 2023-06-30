// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mirror_wall_flutter_app/modals/list_search_engine.dart';

class web_view_page extends StatefulWidget {
  const web_view_page({super.key});

  @override
  State<web_view_page> createState() => _web_view_pageState();
}

class _web_view_pageState extends State<web_view_page> {
  InAppWebViewController? webViewController;
  PullToRefreshController? refreshController;
  double progress = 0;
  late var url;
  String bookmarkadd = '';
  var urlController = TextEditingController();
  List bookmark = [];

  @override
  void initState() {
    super.initState();
    refreshController = PullToRefreshController(
      onRefresh: () {
        webViewController!.reload();
      },
      options: PullToRefreshOptions(
        color: Colors.grey,
        backgroundColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        leading: PopupMenuButton(
          initialValue: 2,
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                value: index,
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        height: s.height * 0.5,
                        color: Colors.white,
                        child: Column(children: [
                          Container(
                              child: Column(
                            children: List.generate(
                              growable: true,
                              bookmark.length,
                              (index) => Column(
                                children: [
                                  ListTile(
                                    title: Text("${bookmark[index]}"),
                                    trailing: IconButton(
                                      onPressed: () {
                                        bookmark.removeAt(index);
                                      },
                                      icon: const Icon(Icons.close),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                        ]),
                      ),
                    );
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.bookmark, size: 20, color: Colors.grey),
                      SizedBox(width: 15),
                      Text("All Bookmark"),
                    ],
                  ),
                ),
              ),
              PopupMenuItem(
                value: index,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Search Engine"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Google
                            Row(
                              children: [
                                Radio(
                                  value: 1,
                                  groupValue: index,
                                  onChanged: (value) {
                                    setState(() {
                                      index = value!;
                                      Navigator.of(context).pop();
                                    });
                                  },
                                ),
                                SizedBox(width: s.width * 0.02),
                                const Text("Google"),
                              ],
                            ),
                            // Yahoo
                            Row(
                              children: [
                                Radio(
                                  value: 2,
                                  groupValue: index,
                                  onChanged: (value) {
                                    setState(() {
                                      index = value!;
                                      Navigator.of(context).pop();
                                    });
                                  },
                                ),
                                SizedBox(width: s.width * 0.02),
                                const Text("Yahoo"),
                              ],
                            ),
                            // Bing
                            Row(
                              children: [
                                Radio(
                                  value: 3,
                                  groupValue: index,
                                  onChanged: (value) {
                                    setState(() {
                                      index = value!;
                                      Navigator.of(context).pop();
                                    });
                                  },
                                ),
                                SizedBox(width: s.width * 0.02),
                                const Text("Bing"),
                              ],
                            ),
                            // Duck Duck Go
                            Row(
                              children: [
                                Radio(
                                  value: 4,
                                  groupValue: index,
                                  onChanged: (value) {
                                    setState(() {
                                      index = value!;
                                      Navigator.of(context).pop();
                                    });
                                  },
                                ),
                                SizedBox(width: s.width * 0.02),
                                const Text("DuckDuckGO"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.screen_search_desktop_outlined,
                          size: 20, color: Colors.grey),
                      SizedBox(width: 15),
                      Text("Search Engine"),
                    ],
                  ),
                ),
              ),
            ];
          },
          offset: const Offset(0, 45),
          child: const Center(
            child: Icon(Icons.more_vert_outlined),
          ),
        ),
        title: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          height: s.height * 0.06,
          width: s.width * 16,
          // padding: const EdgeInsets.only(top: 20,bottom: 50),
          child: TextField(
            onSubmitted: (value) {
              url = Uri.parse(value);
              if (url.scheme.isEmpty) {
                url = Uri.parse("${AllWebside[index].url}search?q=$value");
              }
              webViewController!.loadUrl(urlRequest: URLRequest(url: url));
            },
            controller: urlController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Search ",
              prefixIcon:
                  Icon(Icons.search_outlined, size: 20, color: Colors.black),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: InAppWebView(
              onLoadStart: (controller, url) {
                var v = url.toString();
                bookmarkadd = v;
                setState(() {
                  urlController.text = v;
                });
              },
              onLoadStop: (controller, url) {
                // bookmark.add(v);
                refreshController!.endRefreshing();
              },
              pullToRefreshController: refreshController,
              onWebViewCreated: (controller) => webViewController = controller,
              initialUrlRequest: URLRequest(
                url: Uri.parse(AllWebside[index].url),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: s.height * 0.075,
        color: Colors.transparent,
        child: Row(
          children: [
            const Spacer(),
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.home_rounded),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                bookmark.add(bookmarkadd);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(8),
                    clipBehavior: Clip.antiAlias,
                    duration: const Duration(seconds: 3),
                    behavior: SnackBarBehavior.floating,
                    animation: const AlwaysStoppedAnimation(2),
                    content: Text(
                      "Added Successful",
                      style: GoogleFonts.dmSerifText(
                        textStyle: const TextStyle(
                          fontSize: 12,
                          color: Colors.greenAccent,
                        ),
                      ),
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.bookmark_add_outlined),
            ),
            const Spacer(),
            IconButton(
              onPressed: () async {
                if (await webViewController!.canGoBack()) {
                  webViewController!.goBack();
                }
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                webViewController!.reload();
              },
              icon: const Icon(Icons.refresh_outlined),
            ),
            const Spacer(),
            IconButton(
              onPressed: () async {
                if (await webViewController!.canGoForward()) {
                  webViewController!.goForward();
                }
              },
              icon: const Icon(Icons.arrow_forward_ios_outlined),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

// showDialog(
//   context: context,
//   builder: (context) => AlertDialog(
//     title: GestureDetector(
//       onTap: () {
//         Navigator.of(context).pop();
//       },
//       child: Row(
//         children: [
//           const Spacer(),
//           const Icon(Icons.close),
//           SizedBox(width: s.width * 0.02),
//           const Text("DISMISS"),
//           const Spacer(),
//         ],
//       ),
//     ),
//     content: const Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Text("No Any BookMarks Yet..."),
//       ],
//     ),
//   ),
// );
