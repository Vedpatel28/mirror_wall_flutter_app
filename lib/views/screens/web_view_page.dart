// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall_flutter_app/modals/list_search_engine.dart';
import 'package:mirror_wall_flutter_app/utils/routes_utils.dart';

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

  var urlController = TextEditingController();

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
        leading: const Icon(
          Icons.menu_outlined,
          size: 25,
        ),
        title: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          height: s.height * 0.06,
          width: s.width*16,
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
              prefixIcon: Icon(Icons.search_outlined,size: 20,color: Colors.black),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: InAppWebView(
              onLoadStop: (controller, url) {
                refreshController!.endRefreshing();
              },
              onLoadStart: (controller, url) {
                var v = url.toString();
                setState(() {
                  urlController.text = v;
                });
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
                Navigator.of(context).pushNamed(AllRoutes.HomePage);
              },
              icon: const Icon(Icons.home_rounded),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
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
