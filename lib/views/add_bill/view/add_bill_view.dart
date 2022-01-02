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
        onPageBuilder: (BuildContext context, AddBillViewModel value) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.purple,
              actions: [IconButton(onPressed: () => value.addBillToList(), icon: Icon(Icons.done))],
            ),
            body: SingleChildScrollView(
              child: Observer(builder: (_) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Observer(builder: (_) {
                      return Container(
                          width: context.dynamicWidth(0.5),
                          height: context.dynamicHeight(0.25),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image:
                                      value.imageFile == null ? Image.asset("assets/images/avatar.png").image : Image.file(value.imageFile!).image)));
                    }),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        //buildTextInputField("Kategori", "Yiyecek", null),
                        const SizedBox(
                          width: 125,
                        ),
                        IconButton(onPressed: () => value.getAndScanImage(ImageSource.gallery), icon: const Icon(Icons.photo_library_outlined)),
                        IconButton(onPressed: () => value.getAndScanImage(ImageSource.camera), icon: const Icon(Icons.camera_alt_outlined)),
                        IconButton(
                            onPressed: () {
                              value.imageFile = null;
                            },
                            icon: const Icon(Icons.delete)),
                      ],
                    ),
                    Row(
                      children: [
                        buildTextInputField("Tutar", "", value.amountController),
                        buildTextInputField("KDV", "", value.taxController),
                      ],
                    ),
                    buildTextInputWithouExpanded("Para Birimi", "", value.cashTypeController),
                    buildTextInputWithouExpanded("Kurum", "", value.corporationController),
                    buildTextInputWithouExpanded("Rapor", ""),
                    buildTextInputWithouExpanded("Tarih", "", value.dateController),
                    buildTextInputWithouExpanded("Fiş No", "", value.billNoController),
                    Text("*Fişden okunamayan veya yanlış olan kısımları elle yazınız.")
                  ],
                );
              }),
            )));
  }

  Container buildTextInputWithouExpanded(String title, String hint, [TextEditingController? controller]) {
    return Container(
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
    );
  }

  Expanded buildTextInputField(String title, String hint, [TextEditingController? controller]) {
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
