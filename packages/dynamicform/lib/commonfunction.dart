// ignore_for_file: prefer_final_fields, unused_field

part of dynamicform;

class CommonFunction {
  static List<Map<String, dynamic>> _values = [];
  DataHolders _dataHolders = Get.put(DataHolders());
  static List dataset = [];
  void _onUpdate(key, val, isrequired, label) {
    for (int i = 0; i < dataset.length; i++) {
      if (dataset[i]['id'] == key) {
        dataset.removeAt(i);
        break;
      }
    }

    Map<String, dynamic> json = {
      'id': key,
      'value': val,
      'isrequired': isrequired,
      'label': label
    };

    dataset.add(json);
  }

  clearArray() {
    dataset = [];
  }

  removeData() {
    _dataHolders.dataHolder.value = [];
  }

  getformdata() {
    List<Map<String, dynamic>> data1 = [];
    List<Map<String, dynamic>> errors = [];
    print(dataset);
    for (var i = 0; i < dataset.length; i++) {
      if (dataset[i]['isrequired'] == 1) {
        if (dataset[i]['value'] == null ||
            dataset[i]['value'] == '' ||
            dataset[i]['value'].isEmpty) {
          errors.add({'error': dataset[i]['label']});
        } else {
          data1
              .add({"quizId": dataset[i]['id'], "answer": dataset[i]['value']});
        }
      } else {
        data1.add({"quizId": dataset[i]['id'], "answer": dataset[i]['value']});
      }
    }

    return {'data': data1, 'errors': errors};
  }
}
