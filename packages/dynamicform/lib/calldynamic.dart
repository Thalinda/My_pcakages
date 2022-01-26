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
        print(widget.dataset[index]);
        return widget.dataset[index]['quizType'] == 1
            ? RatingButton(
                keyvalue: widget.dataset[index]['surveyQuizId'].toString(),
                limit: 10,
                label: widget.dataset[index]['quiz'])
            : widget.dataset[index]['quizType'] == 2
                ? RadioButtons(
                    label: widget.dataset[index]['quiz'],
                    keyvalue: widget.dataset[index]['surveyQuizId'].toString(),
                    options: widget.dataset[index]['options'],
                  )
                : widget.dataset[index]['quizType'] == 3
                    ? TextFieldFrom(
                        label: widget.dataset[index]['quiz'],
                        keyvalue:
                            widget.dataset[index]['surveyQuizId'].toString())
                    : Container();
      },
    );
  }
}
