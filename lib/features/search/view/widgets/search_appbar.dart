import 'package:e_commerce/core/utils/shared/screen_sizes/screen_sizes.dart';
import 'package:e_commerce/features/search/view_model/search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchFieldAndBackBotton extends StatelessWidget {
  const SearchFieldAndBackBotton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SearchViewModel>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 18.0, left: 5.0, right: 5.0),
      child: Row(
        children: [
          BackButton(
            onPressed: () {
              Navigator.pop(context);
              provider.setSearchState(SearchStates.notRequested);
              provider.resetSearchProducts();
            },
          ),
          const Spacer(),
          SizedBox(
            width: ScreenSizes.getWidth(context) -
                (ScreenSizes.getWidth(context) / 5.5),
            child: TextFormField(
              onFieldSubmitted: (value) {
                if (value.isNotEmpty) {
                  provider.getSearchs(keyword: value);
                }
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 20.0),
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10.0),
        ],
      ),
    );
  }
}
