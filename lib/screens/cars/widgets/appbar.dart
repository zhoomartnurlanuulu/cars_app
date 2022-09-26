part of '../cars_screen.dart';

class _AppBar extends StatefulWidget with PreferredSizeWidget {
  _AppBar({Key? key}) : super(key: key);

  @override
  State<_AppBar> createState() => __AppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(55);
}

class __AppBarState extends State<_AppBar> {
  List<String> filters = ['По году', 'По цене', 'По названию'];
  String? filtersVal;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.cyan,
      title: SizedBox(
          height: 45,
          child: TextField(
            onChanged: (text) {
              BlocProvider.of<CarsBloc>(context).add(SearchCars(text));
            },
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                fillColor: Colors.white,
                filled: true),
          )),
      actions: [
        const SizedBox(
          width: 15,
        ),
        DropdownButton<String>(
            value: filtersVal,
            items: filters
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ),
                )
                .toList(),
            onChanged: (value) {
              switch (value) {
                case 'По году':
                  BlocProvider.of<CarsBloc>(context)
                      .add(CarsSort(Filters.byYear));
                  break;
                case 'По цене':
                  BlocProvider.of<CarsBloc>(context)
                      .add(CarsSort(Filters.byPrice));
                  break;
                case 'По названию':
                  BlocProvider.of<CarsBloc>(context)
                      .add(CarsSort(Filters.byName));
                  break;
              }
              filtersVal = value;
            }),
      ],
    );
  }
}
