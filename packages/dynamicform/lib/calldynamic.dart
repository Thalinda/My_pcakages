// ignore_for_file: must_be_immutable

part of dynamicform;

class GenerateDyamicForm extends StatefulWidget {
  GenerateDyamicForm({Key? key, required this.dataset}) : super(key: key);
  List<dynamic> dataset;
  CommonFunction comm = CommonFunction();

  @override
  _GenerateDyamicFormState createState() => _GenerateDyamicFormState();
}

class _GenerateDyamicFormState extends State<GenerateDyamicForm> {
  @override
  void initState() {
    super.initState();
    CommonFunction.dataset = widget.dataset;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.dataset.length,
      itemBuilder: (context, index) {
        return widget.dataset[index]['filed_type'] == "TEXT"
            ? TextFieldFrom(
                label: widget.dataset[index]['label'],
                keyvalue: widget.dataset[index]['key'])
            : widget.dataset[index]['filed_type'] == "TOGGLE"
                ? RatingButton(
                    keyvalue: widget.dataset[index]['key'],
                    limit: widget.dataset[index]['limit'],
                    label: widget.dataset[index]['label'])
                : widget.dataset[index]['filed_type'] == "SELECT"
                    ? SelectFiledSearchable(
                        items: widget.dataset[index]['items'],
                        label: widget.dataset[index]['label'],
                        keyvale: widget.dataset[index]['key'])
                    : widget.dataset[index]['filed_type'] == "CHECKBOX"
                        ? CheckBoxField(
                            label: widget.dataset[index]['label'],
                            keyvalue: widget.dataset[index]['key'],
                          )
                        : Container();
      },
    );
  }
}
