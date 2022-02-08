// ignore_for_file: must_be_immutable

part of dynamicform;

class TextFieldFrom extends StatefulWidget {
  TextFieldFrom(
      {Key? key,
      required this.keyvalue,
      required this.label,
      required this.isRequired})
      : super(key: key);
  CommonFunction comm = CommonFunction();
  final String keyvalue;
  final String label;
  final int isRequired;
  @override
  _TextFieldFromState createState() => _TextFieldFromState();
}

class _TextFieldFromState extends State<TextFieldFrom> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        controller: controller,
        onChanged: (val) {
          widget.comm._onUpdate(widget.keyvalue, controller.text,
              widget.isRequired, widget.label);
        },
        textInputAction: TextInputAction.none,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: widget.label.toString(),
        ),
      ),
    );
  }
}
