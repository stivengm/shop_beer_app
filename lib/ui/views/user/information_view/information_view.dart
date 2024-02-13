import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_beer_app/core/blocs/home/home_bloc.dart';
import 'package:shop_beer_app/data/models/stores_model.dart';
import 'package:shop_beer_app/ui/views/user/information_view/widgets/header_information.dart';

class InformationView extends StatelessWidget {
  const InformationView({super.key});
  
  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
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
                        DropdownMenu<StoresModel>(
                          initialSelection: state.stores.first,
                          width: (media.width * 1) - 40,
                          onSelected: (StoresModel? list) {
                            // setState
                            print(list);
                          },
                          dropdownMenuEntries: state.stores
                              .map<DropdownMenuEntry<StoresModel>>((StoresModel list) {
                            return DropdownMenuEntry<StoresModel>(
                                value: list, label: list.name);
                          }).toList(),
                        ),
                        const HeaderInformation(
                            title: "Más información sobre la entrega"),
                        TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
