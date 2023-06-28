class Web {
  final String name;
  final String url;
  final String logo;

  Web({
    required this.name,
    required this.url,
    required this.logo,
  });

  factory Web.fromMap({required Map data}) {
    return Web(
      name: data['Name'],
      url: data['Url'],
      logo: data['Logo'],
    );
  }
}