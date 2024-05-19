import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naroutoshop/features/admin/add_categories/presentation/bolc/delete_category/delete_category_bloc.dart';

class DeleteCategoryWidget extends StatelessWidget {
  const DeleteCategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //context.read<DeleteCategoryBloc>().add(
//DeleteCategoryEvent.deleteCategoryEvent(
              
             // ),
           // );
      },
      child: const Icon(
           Icons.delete,
           color: Colors.red,
           size: 25,
         ),
    );
  }
}
