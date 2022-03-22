// ignore_for_file: must_be_immutable

part of dynamicform;

class GenerateDyamicForm extends StatefulWidget {
  GenerateDyamicForm({
    Key? key,
    required this.dataset,
  }) : super(key: key);
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
    return Form(
      child: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.75,
          child: ListView.builder(
            // shrinkWrap: true,
            cacheExtent: 100000000,
            itemCount: widget.dataset.length,
            itemBuilder: (context, index) {
              CommonFunction()._onUpdate(
                  widget.dataset[index]['surveyQuizId'].toString(),
                  "",
                  widget.dataset[index]['isRequired'],
                  widget.dataset[index]['quiz']);
              return widget.dataset[index]['quizType'] == 1
                  ? RadioButtons(
                      label: widget.dataset[index]['quiz'],
                      keyvalue:
                          widget.dataset[index]['surveyQuizId'].toString(),
                      options: widget.dataset[index]['options'],
                      isRequired: widget.dataset[index]['isRequired'],
                    )
                  : widget.dataset[index]['quizType'] == 2
                      ? RatingButton(
                          keyvalue:
                              widget.dataset[index]['surveyQuizId'].toString(),
                          limit: 10,
                          label: widget.dataset[index]['quiz'],
                          isRequired: widget.dataset[index]['isRequired'],
                        )
                      : widget.dataset[index]['quizType'] == 3
                          ? TextFieldFrom(
                              label: widget.dataset[index]['quiz'],
                              keyvalue: widget.dataset[index]['surveyQuizId']
                                  .toString(),
                              isRequired: widget.dataset[index]['isRequired'],
                            )
                          : Container();
            },
          ),
        ),
      ),
    );
  }
}

// 1 Radio
// 2 Rating
// 3 Text