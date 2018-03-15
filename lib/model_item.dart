class ModelItem {
  String id;
  String createdAt;
  String desc;
  List<String> images;
  String publishedAt;
  String source;
  String type;
  String url;
  String who;

  mapFromObj(obj) {
    id = obj['_id'];
    createdAt = obj['createdAt'];
    desc = obj['desc'];
    images = obj['images'];
    publishedAt = obj['publishedAt'];
    source = obj['source'];
    type = obj['type'];
    url = obj['url'];
    who = obj['who'];
  }
}
