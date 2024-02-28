import 'package:e_commerce/core/utils/shared/components/screens/no_search_scree.dart';
import 'package:e_commerce/core/utils/shared/models/product_model.dart';
import 'package:e_commerce/features/search/view/widgets/search_appbar.dart';
import 'package:e_commerce/features/search/view/widgets/search_product_item.dart';
import 'package:e_commerce/features/search/view_model/search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SearchViewModel>(context);
    List<ProductModel> rightList =
        _splitSearchIntoTwoLists(provider.searchProducts, true);
    List<ProductModel> leftList =
        _splitSearchIntoTwoLists(provider.searchProducts, false);
    if (provider.searchStates == SearchStates.noItemFound) {
      return const NoSearchScreen();
    }
    return SafeArea(
      child:
          //  provider.searchStates == SearchStates.success &&
          //         provider.searchProducts.isEmpty
          //     ? const Column(
          //         children: [

          //           NoSearchScreen(),
          //         ],
          //       )
          //     :
          SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchFieldAndBackBotton(),
            const SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsetsDirectional.only(
                          bottom: 0.0,
                        ),
                        child:
                            SearchProductItem(productModel: rightList[index]),
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 20.0),
                      itemCount: rightList.length,
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.only(top: 20.0),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsetsDirectional.only(
                          top: 0.0,
                        ),
                        child: SearchProductItem(
                          productModel: leftList[index],
                        ),
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 20.0),
                      itemCount: leftList.length,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<ProductModel> _splitSearchIntoTwoLists(
      List<ProductModel> listOfAll, bool isRight) {
    List<ProductModel> result = [];

    if (isRight) {
      result = listOfAll.where((element) {
        return listOfAll.indexOf(element) % 2 == 0;
      }).toList();
    } else {
      result = listOfAll.where((element) {
        return listOfAll.indexOf(element) % 2 != 0;
      }).toList();
    }
    return result;
  }
}
