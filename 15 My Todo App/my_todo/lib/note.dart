class Note {
  int? _id;
  late String _title;
  late String? _description;
  late String _date;
  late int _priority;

  // Constrcutors to initialize the values
  Note(this._title, this._date, this._priority, [this._description]);
  Note.withid(this._id, this._title, this._date, this._priority,
      [this._description]);

  // All the getters
  int? get id => _id;
  String get title => _title;
  String get description => _description ?? "";
  String get date => _date;
  int get priority => _priority;

  // All the setters
  set title(String newTitle) {
    if (newTitle.length <= 255) {
      _title = newTitle;
    }
  }

  set description(String newDescription) {
    if (newDescription.length <= 255) {
      _description = newDescription;
    }
  }

  set date(String newDate) {
    _date = newDate;
  }

  set priority(int newPriority) {
    if (newPriority >= 1 && newPriority <= 2) {
      _priority = newPriority;
    }
  }

  // To save and retrieve data into and from database

  // To convert Note object to Map object
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    if (_id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['description'] = _description;
    map['date'] = _date;
    map['priority'] = _priority;

    return map;
  }

  Note.fromMapObject(Map<String, dynamic> map) {
    _id = map['id'];
    _title = map['title'];
    _description = map['description'];
    _date = map['date'];
    _priority = map['priority'];
  }
}
