part of dynamicform;

// ignore: must_be_immutable
class RadioButtons extends StatefulWidget {
  RadioButtons(
      {Key? key,
      required this.label,
      required this.keyvalue,
      required this.options})
      : super(key: key);
  final String label;
  final String keyvalue;
  final List options;

  CommonFunction common = CommonFunction();
  final List<Map<String, dynamic>> _radiobuttons = [];

  @override
  State<RadioButtons> createState() => _RadioButtonsState();
}

class _RadioButtonsState extends State<RadioButtons> {
  @override
  Widget build(BuildContext context) {
    String value = getMyRadiobutton(widget.keyvalue);
    print(value);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label),
        Row(
          children: widget.options
              .map((e) => Row(
                    children: [
                      Radio(
                          value: e.toString(),
                          groupValue: value,
                          onChanged: (bool) {
                            _radioButtonUpdate(
                                widget.keyvalue, bool.toString());
                            widget.common._onUpdate(widget.keyvalue, bool);
                            setState(() {});
                          }),
                      Text(e),
                    ],
                  ))
              .toList(),
        )
      ],
    );
  }

  // releated to checkbox buttons
  void _radioButtonUpdate(key, val) {
    for (int i = 0; i < widget._radiobuttons.length; i++) {
      if (widget._radiobuttons[i]['id'] == key) {
        widget._radiobuttons.removeAt(i);
        break;
      }
    }

    Map<String, dynamic> json = {'id': key, 'value': val};
    widget._radiobuttons.add(json);
    print(widget._radiobuttons);
    setState(() {});
  }

  String getMyRadiobutton(key) {
    String value = '';
    for (int i = 0; i < widget._radiobuttons.length; i++) {
      if (widget._radiobuttons[i]['id'] == key) {
        value = widget._radiobuttons[i]['value'];
      }
    }
    if (value != '') {
      return value;
    } else {
      return '';
    }
  }
}
