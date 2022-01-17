// ignore_for_file: must_be_immutable

part of dynamicform;

class TextFieldFrom extends StatefulWidget {
  TextFieldFrom({Key? key, required this.keyvalue, required this.label})
      : super(key: key);
  CommonFunction comm = CommonFunction();
  final String keyvalue;
  final String label;
  @override
  _TextFieldFromState createState() => _TextFieldFromState();
}

class _TextFieldFromState extends State<TextFieldFrom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        onChanged: (val) {
          widget.comm._onUpdate(widget.keyvalue, val);
        },
        decoration: InputDecoration(
          
          border: const OutlineInputBorder(),
          labelText: widget.label.toString(),
        ),
      ),
    );
  }
}
