// ignore_for_file: deprecated_member_use, must_be_immutable

part of dynamicform;

class SelectFiledSearchable extends StatefulWidget {
  SelectFiledSearchable(
      {Key? key,
      required this.items,
      required this.label,
      required this.keyvale})
      : super(key: key);
  final List<Map<String, dynamic>> items;
  final String label;
  final String keyvale;
  CommonFunction comm = CommonFunction();
  @override
  _SelectFiledSearchableState createState() => _SelectFiledSearchableState();
}

class _SelectFiledSearchableState extends State<SelectFiledSearchable> {
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
        mode: Mode.DIALOG,
        items: List<String>.generate(widget.items.length, (index) {
          return widget.items[index]['name'];
        }),
        label: widget.label,
        showSearchBox: true,
        hint: "Select One",
        popupItemDisabled: (String s) => s.startsWith('I'),
        onChanged: (index) {
          int indexof =
              widget.items.indexWhere((item) => item['name'] == index);

          setState(() {
            widget.comm._onUpdate(widget.keyvale, widget.items[indexof]['id']);
          });
        },
        selectedItem: widget.items[0]['name']);
  }
}
