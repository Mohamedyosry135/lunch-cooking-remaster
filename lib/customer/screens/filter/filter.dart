part of 'filter_imports.dart';
class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyText(title: "Filter",size: 12,color: MyColors.black),
    );
  }
}
