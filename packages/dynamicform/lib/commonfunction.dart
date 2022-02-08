part of dynamicform;

class CommonFunction {
  static List<Map<String, dynamic>> _values = [];
  DataHolders _dataHolders = Get.put(DataHolders());
  static List dataset = [];
  void _onUpdate(key, val, isrequired, label) {
    for (int i = 0; i < _dataHolders.dataHolder.length; i++) {
      if (_dataHolders.dataHolder[i]['id'] == key) {
        _dataHolders.dataHolder.removeAt(i);
        break;
      }
    }

    Map<String, dynamic> json = {
      'id': key,
      'value': val,
      'isrequired': isrequired,
      'label': label
    };

    _dataHolders.dataHolder.add(json);
  }

  getformdata() {
    List<Map<String, dynamic>> data1 = [];
    List<Map<String, dynamic>> errors = [];

    for (var i = 0; i < _dataHolders.dataHolder.length; i++) {
      if (_dataHolders.dataHolder[i]['isrequired'] == 1) {
        if (_dataHolders.dataHolder[i]['value'] == null ||
            _dataHolders.dataHolder[i]['value'] == '' ||
            _dataHolders.dataHolder[i]['value'].isEmpty) {
          errors.add({'error': _dataHolders.dataHolder[i]['label']});
        } else {
          data1.add({
            "quizId": _dataHolders.dataHolder[i]['id'],
            "answer": _dataHolders.dataHolder[i]['value']
          });
        }
      } else {
        data1.add({
          "quizId": _dataHolders.dataHolder[i]['id'],
          "answer": _dataHolders.dataHolder[i]['value']
        });
      }
    }

    return {'data': data1, 'errors': errors};
  }
}
