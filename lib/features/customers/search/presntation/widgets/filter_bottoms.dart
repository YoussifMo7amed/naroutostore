import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/animations/animate_do.dart';
import 'package:naroutoshop/core/common/widgets/custom_text_field.dart';
import 'package:naroutoshop/core/enums/filter_buttoms_enum.dart';
import 'package:naroutoshop/features/customers/search/data/models/search_request_body.dart';
import 'package:naroutoshop/features/customers/search/presntation/bloc/search_Product/search_product_bloc.dart';
import 'package:naroutoshop/features/customers/search/presntation/widgets/save_filter_bottom.dart';
import 'package:naroutoshop/features/customers/search/presntation/widgets/search_for_data.dart';
import 'package:naroutoshop/features/customers/search/presntation/widgets/search_name_price_bottom.dart';

class FilterBottoms extends StatefulWidget {
  const FilterBottoms({super.key});

  @override
  State<FilterBottoms> createState() => _FilterBottomsState();
}

class _FilterBottomsState extends State<FilterBottoms> {
  final searchNameController = TextEditingController();
  final searchMinPriceController = TextEditingController();
  final searchMaxPriceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  FilterButtomsEnum searchEnum = FilterButtomsEnum.non;
   @override
  void dispose() {
    searchNameController.dispose();
    searchMinPriceController.dispose();
    searchMaxPriceController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // search name
              CustomFadeInRight(
                duration: 200,
                child: SearchNamePriceBottom(
                  onTap: _searchNameEnum,
                  isSelected: searchEnum == FilterButtomsEnum.name,
                  title: 'Search Name',
                ),
              ),
              // search price
              CustomFadeInRight(
                duration: 200,
                child: SearchNamePriceBottom(
                  onTap: _searchPriceEnum,
                  isSelected: searchEnum == FilterButtomsEnum.price,
                  title: 'Search Price',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          //textfield
          if (searchEnum == FilterButtomsEnum.name) ...[
            CustomFadeInRight(
              duration: 200,
              child: CustomTextField(
                controller: searchNameController,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Search cannot be empty';
                  }
                  return null;
                },
                hintText: 'Search For Product Name',
              ),
            ),
            SaveFilterBottom(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  context.read<SearchProductBloc>().add(
                        SearchProductEvent.searchProduct(
                          body: SearchRequestBody(
                            searchName: searchNameController.text.trim(),
                            price_min: null,
                            price_max: null,
                          ),
                        ),
                      );
                  setState(() {
                    searchEnum = FilterButtomsEnum.saved;
                  });
                }
              },
            ),
          ] else if (searchEnum == FilterButtomsEnum.price) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomFadeInRight(
                  duration: 200,
                  child: SizedBox(
                    width: 160.w,
                    child: CustomTextField(
                      controller: searchMinPriceController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Price cannot be empty';
                        }
                        return null;
                      },
                      hintText: 'Price Min',
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                CustomFadeInRight(
                  duration: 200,
                  child: SizedBox(
                    width: 160.w,
                    child: CustomTextField(
                      controller: searchMaxPriceController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Price cannot be empty';
                        }
                        return null;
                      },
                      hintText: 'Price Max',
                    ),
                  ),
                ),
              ],
            ),
            SaveFilterBottom(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  context.read<SearchProductBloc>().add(
                        SearchProductEvent.searchProduct(
                          body: SearchRequestBody(
                            searchName: null,
                            price_min: int.parse(searchMinPriceController.text),
                            price_max: int.parse(searchMaxPriceController.text),
                          ),
                        ),
                      );
                  setState(() {
                    searchEnum = FilterButtomsEnum.saved;
                  });
                }
              },
            ),
          ],
          if (searchEnum == FilterButtomsEnum.non) ...[
            SizedBox(
              height: 100.h,
            ),
            const SearchForData(
              text: 'Search For Data',
            ),
          ]
        ],
      ),
    );
  }

  void _searchNameEnum() {
    if (searchEnum == FilterButtomsEnum.name) {
      setState(() {
        searchEnum = FilterButtomsEnum.saved;
      });
    } else {
      setState(() {
        searchEnum = FilterButtomsEnum.name;
      });
    }
    searchNameController.clear();
  }

  void _searchPriceEnum() {
    if (searchEnum == FilterButtomsEnum.price) {
      setState(() {
        searchEnum = FilterButtomsEnum.saved;
      });
    } else {
      setState(() {
        searchEnum = FilterButtomsEnum.price;
      });
    }
    searchMinPriceController.clear();
    searchMaxPriceController.clear();
  }
}
