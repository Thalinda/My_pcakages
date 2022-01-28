part of dynamicform;

// ignore: must_be_immutable
class CheckBoxField extends StatefulWidget {
  CheckBoxField(
      {Key? key,
      required this.label,
      required this.keyvalue,
      required this.isRequired})
      : super(key: key);
  final String label;
  final String keyvalue;
  final int isRequired;

  CommonFunction common = CommonFunction();
  final List<Map<String, dynamic>> _radioselection = [];

  @override
  State<CheckBoxField> createState() => _CheckBoxFieldState();
}

class _CheckBoxFieldState extends State<CheckBoxField> {
  @override
  Widget build(BuildContext context) {
    bool value = getmycheckbox(widget.keyvalue);
    return Row(
      children: <Widget>[
        /** Checkbox Widget **/
        Checkbox(
            value: value,
            onChanged: (vale) {
              setState(() {
                _checkboxupdate(widget.keyvalue, vale);

                widget.common._onUpdate(
                    widget.keyvalue, vale, widget.isRequired, widget.label);
              });
            }), //Checkbox
        Text(
          widget.label,
          style: const TextStyle(fontSize: 17.0),
        ), //Text
        const SizedBox(width: 10),
      ], //<Widget>[]
    );
  }

  // releated to checkbox buttons
  void _checkboxupdate(key, bool? val) {
    for (int i = 0; i < widget._radioselection.length; i++) {
      if (widget._radioselection[i]['id'] == key) {
        widget._radioselection.removeAt(i);
        break;
      }
    }

    Map<String, dynamic> json = {'id': key, 'value': val};
    widget._radioselection.add(json);

    setState(() {});
  }

  bool getmycheckbox(key) {
    for (int i = 0; i < widget._radioselection.length; i++) {
      if (widget._radioselection[i]['id'] == key) {
        return widget._radioselection[i]['value'];
      }
    }
    return false;
  }
}
