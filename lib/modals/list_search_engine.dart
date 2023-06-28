// ignore_for_file: non_constant_identifier_names

import 'package:mirror_wall_flutter_app/utils/web_utils.dart';

List<Map<String, String>> AllWebList = [
  {
    "Name": "Google",
    "Url":
        "https://www.google.com/",
    "Logo": "https://i.pinimg.com/originals/b7/41/21/b741215d216b11b8ff17f27f4bff2a9d.gif",
  },
  {
    "Name": "Yahoo",
    "Url":
        "https://www.yahoo.com/",
    "Logo":
        "https://i.pinimg.com/originals/4a/c2/fa/4ac2fae8eb1784e6c23fa846611d6fb9.gif",
  },
  {
    "Name": "Bind",
    "Url":
        "https://www.bing.com/",
    "Logo":
        "https://i.pinimg.com/originals/93/38/12/9338129addf840462fab6b2bd143eebb.gif",
  },
  {
    "Name": "DuckDuck Go",
    "Url": "https://duckduckgo.com/",
    "Logo": "https://thumbs.gfycat.com/AcrobaticVioletAfricanaugurbuzzard-size_restricted.gif",
  },
];

List<Web> AllWebside = AllWebList.map((e) => Web.fromMap(data: e)).toList();































































































































// StreamBuilder(
// stream: connectivity.onConnectivityChanged,
// builder: (context, snapshot) {
// if (snapshot.hasData) {
// ConnectivityResult result = snapshot.data!;
// switch (result) {
// case ConnectivityResult.mobile:
// return Center(
// child: Padding(
// padding: const EdgeInsets.all(12),
// child: Column(
// children: [
// InAppWebView(
// initialUrlRequest: URLRequest(
// url: Uri.parse(AllWebside[index].url)),
// onWebViewCreated: (controller) {
// webViewController = controller;
// },
// onLoadStart: (controller, url) async {
// await controller.canGoBack();
// setState(() {});
// },
// onLoadStop: (controller, url) async {
// await controller.canGoBack();
// setState(() {});
// },
// onProgressChanged: (controller, progress) {
// _progress = progress / 100;
// setState(() {
// _progress = progress as double;
// });
// if (_progress == 100) {}
// },
// ),
// ],
// ),
// ),
// );
// case ConnectivityResult.wifi:
// return Padding(
// padding: const EdgeInsets.all(12),
// child: Center(
// child: InAppWebView(
// initialUrlRequest: URLRequest(
// url: Uri.parse(AllWebside[index].url),
// ),
// ),
// ),
// );
// case ConnectivityResult.bluetooth:
// return const Center(
// child: Icon(Icons.bluetooth),
// );
// case ConnectivityResult.none:
// return const Center(
// child: Icon(Icons
//     .signal_cellular_connected_no_internet_4_bar_rounded),
// );
// default:
// return const Center(child: CircularProgressIndicator());
// }
// } else if (snapshot.hasError) {
// return const Icon(Icons.report_gmailerrorred_rounded);
// } else {
// return const Center(child: CircularProgressIndicator());
// }
// },
// ),





// Connectivity connectivity = Connectivity();
// InAppWebViewController? webViewController;
// PullToRefreshController? refreshController;
//
// double _progress = 0;
//
// List<String> initialUrl = [
//   "https://www.google.com/search?q=Flutter&rlz=1C1CHBF_enIN1050IN1050&sxsrf=APwXEdfqq0KMzPI3Ugv8Xkci_8UTvEClsQ%3A1687938382434&ei=TuWbZPmZGr_n4-EPprWA6AU&ved=0ahUKEwj5-L-9vOX_AhW_8zgGHaYaAF0Q4dUDCA8&uact=5&oq=Flutter&gs_lcp=Cgxnd3Mtd2l6LXNlcnAQAzIECCMQJzIECCMQJzIECCMQJzINCAAQigUQsQMQgwEQQzIHCAAQigUQQzIHCAAQigUQQzIHCAAQigUQQzIHCAAQigUQQzIHCAAQigUQQzINCC4QigUQxwEQ0QMQQzoHCCMQsAMQJzoKCAAQRxDWBBCwAzoPCC4QigUQyAMQsAMQQxgBOhEILhCABBCxAxCDARDHARDRAzoLCAAQgAQQsQMQgwE6CwgAEIoFELEDEIMBOggIABCABBCxAzoTCC4QigUQsQMQgwEQxwEQ0QMQQzoQCAAQgAQQFBCHAhCxAxCDAToHCC4QigUQQzoKCAAQigUQsQMQQ0oECEEYAFC_CVj-E2C-GmgDcAF4AIABkQGIAZUHkgEDMC43mAEAoAEBwAEByAEN2gEECAEYCA&sclient=gws-wiz-serp",
//   "https://in.search.yahoo.com/search;_ylt=AwrPppFk5ptk8AsMv_66HAx.;_ylc=X1MDMjExNDcyMzAwMgRfcgMyBGZyAwRmcjIDcDpzLHY6c2ZwLG06c2ItdG9wBGdwcmlkA1NGdmRmbURjUmM2bkwuNktPVVcxekEEbl9yc2x0AzAEbl9zdWdnAzEwBG9yaWdpbgNpbi5zZWFyY2gueWFob28uY29tBHBvcwMwBHBxc3RyAwRwcXN0cmwDMARxc3RybAM3BHF1ZXJ5A0ZsdXR0ZXIEdF9zdG1wAzE2ODc5Mzg2Njk-?p=Flutter&fr=sfp&fr2=p%3As%2Cv%3Asfp%2Cm%3Asb-top&iscqry=",
//   "https://www.bing.com/search?q=flutter&form=QBLH&sp=-1&ghc=1&lq=0&pq=flutter&sc=10-7&qs=n&sk=&cvid=4A320AFEEB4C467D81E7073031940649&ghsh=0&ghacc=0&ghpl=",
//   "https://duckduckgo.com/?va=v&t=ha&q=Flutter&ia=web",
// ];
//
// var urlController = TextEditingController();
//
// bool canBack = false;
// bool canForward = false;
//
// back() {
//   webViewController!.goBack();
// }
//
// forward() {
//   webViewController!.goForward();
// }
//
// check() {
//   webViewController!.canGoBack();
//   webViewController!.canGoForward();
// }