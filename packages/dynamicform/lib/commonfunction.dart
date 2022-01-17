part of dynamicform;

class CommonFunction {
  static List<Map<String, dynamic>> _values = [];
  static List dataset = [];
  void _onUpdate(key, val) {
    for (int i = 0; i < _values.length; i++) {
      if (_values[i]['id'] == key) {
        _values.removeAt(i);
        break;
      }
    }

    Map<String, dynamic> json = {'id': key, 'value': val};
    _values.add(json);
  }

  getformdata() {
    Map<String, dynamic> data1 = {};
    print(CommonFunction.dataset);
    for (var i = 0; i < _values.length; i++) {
      data1[_values[i]['id']] = _values[i]['value'];
    }
    return data1;
  }
}
