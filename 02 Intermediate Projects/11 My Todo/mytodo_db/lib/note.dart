class Note {
  int _id;
  String _title;
  String _description;
  String _date;
  int _priority;

  // Constrcutors to initialize the values
  Note(this._title, this._date, this._priority, [this._description]);
  Note.withid(this._id, this._title, this._date, this._priority,
      [this._description]);

  // All the getters
  int get id => this._id;
  String get title => this._title;
  String get description => this._description;
  String get date => this._date;
  int get priority => this._priority;

  // All the setters
  set title(String newTitle) {
    if (newTitle.length <= 255) {
      this._title = newTitle;
    }
  }

  set description(String newDescription) {
    if (newDescription.length <= 255) {
      this._description = newDescription;
    }
  }

  set date(String newDate) {
    this._date = newDate;
  }

  set priority(int newPriority) {
    if (newPriority >= 1 && newPriority <= 2) {
      this._priority = newPriority;
    }
  }

  // To save and retrieve data into and from database

  // To convert Note object to Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (this._id != null) {
      map['id'] = this._id;
    }
    map['title'] = this._title;
    map['description'] = this._description;
    map['date'] = this._date;
    map['priority'] = this._priority;

    return map;
  }

  Note.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._description = map['description'];
    this._date = map['date'];
    this._priority = map['priority'];
  }
}
