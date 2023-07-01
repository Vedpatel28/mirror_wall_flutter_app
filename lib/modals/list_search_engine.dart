// ignore_for_file: non_constant_identifier_names
import 'package:mirror_wall_flutter_app/modals/web_utils.dart';

List<Map<String, String>> AllWebList = [
  {
    "Name": "Google",
    "Url": "https://www.google.com/",
    "Logo":
        "https://i.pinimg.com/originals/b7/41/21/b741215d216b11b8ff17f27f4bff2a9d.gif",
  },
  {
    "Name": "Yahoo",
    "Url": "https://www.yahoo.com/",
    "Logo":
        "https://i.pinimg.com/originals/4a/c2/fa/4ac2fae8eb1784e6c23fa846611d6fb9.gif",
  },
  {
    "Name": "Bind",
    "Url": "https://www.bing.com/",
    "Logo":
        "https://i.pinimg.com/originals/93/38/12/9338129addf840462fab6b2bd143eebb.gif",
  },
  {
    "Name": "DuckDuck Go",
    "Url": "https://duckduckgo.com/",
    "Logo":
        "https://thumbs.gfycat.com/AcrobaticVioletAfricanaugurbuzzard-size_restricted.gif",
  },
];

List<Web> AllWebside = AllWebList.map((e) => Web.fromMap(data: e)).toList();
