// ignore_for_file: must_be_immutable

part of dynamicform;

class RatingButton extends StatefulWidget {
  RatingButton(
      {Key? key,
      required this.keyvalue,
      required this.limit,
      required this.label,
      required this.isRequired})
      : super(key: key);
  String label;
  int limit;
  String keyvalue;
  bool numberornote = false;

  int isRequired;

  @override
  _RatingButtonState createState() => _RatingButtonState();
}

class _RatingButtonState extends State<RatingButton> {
  final List<Map<String, dynamic>> _toggleselection = [];
  CommonFunction comm = CommonFunction();
  @override
  Widget build(BuildContext context) {
    int value = getmyvalue(widget.keyvalue);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              ToggleButtons(
                  constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width * 0.070,
                      minHeight: MediaQuery.of(context).size.height * 0.05),
                  children: List.generate(widget.limit, (index) {
                    int tem = index + 1;
                    return Text('$tem');
                  }),
                  onPressed: (index) {
                    setState(() {
                      widget.numberornote = false;
                      _toggleupdate(widget.keyvalue, index.toString());
                      comm._onUpdate(widget.keyvalue, (index + 1).toString(),
                          widget.isRequired, widget.label);
                    });
                  },
                  isSelected: generateUserClicked(widget.limit, value)),
              ToggleButtons(
                  constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width * 0.070,
                      minHeight: MediaQuery.of(context).size.height * 0.05),
                  onPressed: (index) {
                    setState(() {
                      _toggleupdate(widget.keyvalue, 0.toString());
                      widget.numberornote = true;
                      comm._onUpdate(
                          widget.keyvalue, 0, widget.isRequired, widget.label);
                    });
                  },
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("NC/NS"),
                    )
                  ],
                  isSelected: getNcNs(1, value))
            ],
          ),
        ],
      ),
    );
  }

  List<bool> generateUserClicked(limit, value) {
    return List.generate(limit, (index) {
      if (index < value && widget.numberornote == false) {
        return true;
      } else {
        return false;
      }
    });
  }

  List<bool> getNcNs(limit, value) {
    return List.generate(limit, (index) {
      if (index < value && widget.numberornote == true) {
        return true;
      } else {
        return false;
      }
    });
  }

// related to toggle buttons
  int getmyvalue(key) {
    for (int i = 0; i < _toggleselection.length; i++) {
      if (_toggleselection[i]['id'] == key) {
        return int.parse(_toggleselection[i]['value']) + 1;
      }
    }
    return 0;
  }

  void _toggleupdate(key, String val) {
    for (int i = 0; i < _toggleselection.length; i++) {
      if (_toggleselection[i]['id'] == key) {
        _toggleselection.removeAt(i);
        break;
      }
    }

    Map<String, dynamic> json = {'id': key, 'value': val};
    _toggleselection.add(json);

    setState(() {});
  }
}
