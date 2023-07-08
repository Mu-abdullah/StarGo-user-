import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manger/extentions_cubit/extentions_cubit.dart';
import 'extention_list_view.dart';

class ExtentionBar extends StatelessWidget {
  const ExtentionBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExtentionsCubit(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            ExtentionListView(),
          ],
        ),
      ),
    );
  }
}
