part of dynamicform;

class CommonFunction {
  static List<Map<String, dynamic>> _values = [];
  static List dataset = [];
  void _onUpdate(key, val, isrequired, label) {
    for (int i = 0; i < _values.length; i++) {
      if (_values[i]['id'] == key) {
        _values.removeAt(i);
        break;
      }
    }

    Map<String, dynamic> json = {
      'id': key,
      'value': val,
      'isrequired': isrequired,
      'label': label
    };

    _values.add(json);
  }

  getformdata() {
    List<Map<String, dynamic>> data1 = [];
    List<Map<String, dynamic>> errors = [];

    for (var i = 0; i < _values.length; i++) {
      if (_values[i]['isrequired'] == 1) {
        if (_values[i]['value'] == null ||
            _values[i]['value'] == '' ||
            _values[i]['value'].isEmpty) {
          errors.add({'error': _values[i]['label']});
        } else {
          data1
              .add({"quizId": _values[i]['id'], "answer": _values[i]['value']});
        }
      } else {
        data1.add({"quizId": _values[i]['id'], "answer": _values[i]['value']});
      }
    }
    return {'data': data1, 'errors': errors};
  }
}
