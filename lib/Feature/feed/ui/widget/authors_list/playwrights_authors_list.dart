import 'package:bazaar/core/helper/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/routing/routes.dart';
import '../../../data/model/literary_figure.dart';
import 'author_item.dart';
import 'author_list_view.dart';

class PlaywrightsAuthorsList extends StatelessWidget {
  const PlaywrightsAuthorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return    AuthorListView(
        isLengthList: false, literaryFigures: playwrights);
  }
}
