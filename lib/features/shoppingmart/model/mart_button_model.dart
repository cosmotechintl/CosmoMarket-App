class MartButtonModel{
  final String _image;
  final String _name;
  final int _martId;

  MartButtonModel(
      {required String imageLink,
        required String name,
        required int martId}
      ):
      _image=imageLink,
      _name=name,
      _martId=martId;

  int get martId => _martId;

  String get name => _name;

  String get image => _image;
}