import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kartal/src/context_extension.dart';
import 'package:provider/provider.dart';

import '../../../core/base/view/base_view.dart';
import '../viewmodel/add_bill_view_model.dart';

class AddBillView extends StatefulWidget {
  @override
  State<AddBillView> createState() => _AddBillPageState();
}

class _AddBillPageState extends State<AddBillView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<AddBillViewModel>(
        viewModel: Provider.of<AddBillViewModel>(context, listen: false),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, AddBillViewModel value) => Hero(
              tag: "/addBill",
              child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.purple,
                    actions: [
                      IconButton(
                          onPressed: () => value.addBillToList(),
                          icon: Icon(Icons.done))
                    ],
                  ),
                  body: SingleChildScrollView(
                    child: Observer(builder: (_) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: context.dynamicHeight(0.01),
                          ),
                          Observer(builder: (_) {
                            return Container(
                                width: context.dynamicWidth(0.5),
                                height: context.dynamicHeight(0.25),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: value.imageFile == null
                                            ? Image.asset(
                                                    "assets/images/avatar.png")
                                                .image
                                            : Image.file(value.imageFile!)
                                                .image)));
                          }),
                          SizedBox(
                            height: context.dynamicHeight(0.005),
                          ),
                          Row(
                            children: [
                              //buildTextInputField("Kategori", "Yiyecek", null),
                              SizedBox(
                                width: context.dynamicWidth(0.32),
                              ),
                              IconButton(
                                  onPressed: () => value
                                      .getAndScanImage(ImageSource.gallery),
                                  icon:
                                      const Icon(Icons.photo_library_outlined)),
                              IconButton(
                                  onPressed: () =>
                                      value.getAndScanImage(ImageSource.camera),
                                  icon: const Icon(Icons.camera_alt_outlined)),
                              IconButton(
                                  onPressed: () {
                                    value.imageFile = null;
                                  },
                                  icon: const Icon(Icons.delete)),
                            ],
                          ),
                          Row(
                            children: [
                              buildTextInputField(
                                  "Tutar", "", value.amountController),
                              buildTextInputField(
                                  "KDV", "", value.taxController),
                            ],
                          ),
                          buildTextInputWithouExpanded("Para Birimi", "",
                              value.cashTypeController, TextInputType.text),
                          buildTextInputWithouExpanded("Kurum", "",
                              value.corporationController, TextInputType.text),
                          buildTextInputWithouExpanded(
                              "Rapor", "", null, TextInputType.text),
                          buildTextInputWithouExpanded("Tarih", "",
                              value.dateController, TextInputType.datetime),
                          buildTextInputWithouExpanded("Fiş No", "",
                              value.billNoController, TextInputType.number),
                          const Text(
                              "*Fişden okunamayan veya yanlış olan kısımları elle yazınız.")
                        ],
                      );
                    }),
                  )),
            ));
  }

  Container buildTextInputWithouExpanded(String title, String hint,
      [TextEditingController? controller,
      TextInputType type = TextInputType.text]) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: TextFormField(
        keyboardType: type,
        controller: controller,
        decoration: InputDecoration(
          fillColor: Colors.purple.shade100,
          border: OutlineInputBorder(),
          labelText: title,
          hintText: hint,
        ),
      ),
    );
  }

  Expanded buildTextInputField(String title, String hint,
      [TextEditingController? controller]) {
    return Expanded(
        child: Container(
      margin: const EdgeInsets.all(5),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: Colors.purple.shade100,
          border: const OutlineInputBorder(),
          labelText: title,
          hintText: hint,
        ),
      ),
    ));
  }
}
