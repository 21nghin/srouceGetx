class AssetsImage {
  AssetsImage(this._path);

  final dynamic _path;

  String getImageUrl(String name){
    return '$_path$name';
  }

  static AssetsImage _instance;

  static AssetsImage instance({dynamic path = 'assets/images/'}){
   return _instance ??= _instance = AssetsImage(path);
  }
}