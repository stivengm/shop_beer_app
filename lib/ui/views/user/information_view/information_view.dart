import 'package:flutter/material.dart';
import 'package:shop_beer_app/ui/views/user/information_view/widgets/header_information.dart';

class InformationView extends StatelessWidget {
  const InformationView({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> list = <String>['Portal de Molinos 3', 'Two', 'Three', 'Four'];
    Size media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: double.infinity,
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Información"),
                  const HeaderInformation(title: "Lugar de entrega"),
                  DropdownMenu<String>(
                    initialSelection: list.first,
                    width: (media.width * 1) - 40,
                    onSelected: (String? value) {
                      // setState
                      print(value);
                    },
                    dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(value: value, label: value);
                    }).toList(),
                  ),
                  
                  const HeaderInformation(title: "Más información sobre la entrega"),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder()
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}