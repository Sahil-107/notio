class subjectObject {
  String _subjectName;
  int _subjectId;
  
  subjectObject(this._subjectName, this._subjectId);
  
  // Getters
  String get subjectName => _subjectName;
  int get subjectId => _subjectId;
  
  // Setters
  set subjectName(String name) {
    _subjectName = name;
  }
  
  set subjectId(int id) {
    _subjectId = id;
  }
}
