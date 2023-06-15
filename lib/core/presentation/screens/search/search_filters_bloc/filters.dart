import '../../../presentation.dart';

@RoutePage()
class SearchFiltersPage extends StatelessWidget {
  const SearchFiltersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      emptyTop: true,
      body: Column(
        children: [
          FilterItem(
            id: 1,
            title: 'Философия',
            onTap: (int id) {},
            selected: true,
          ),
        ],
      ),
    );
  }
}

class FilterItem extends StatelessWidget {
  final int id;
  final String title;
  final bool selected;
  final Function(int id) onTap;

  const FilterItem({
    Key? key,
    required this.id,
    required this.title,
    required this.onTap,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppAnimatedContainer(

      fillColor: selected ? context.theme.primaryColor : AppColorsScheme.white,
      child: AppContainer(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        borderColor: AppColorsScheme.grey2,
        child: BaseText(title: 'Философия'),
      ),
    );
  }
}
