import 'package:flutter/material.dart';

import '../../../data/model/literary_figure.dart';
import 'author_list_view.dart';

class NovelistsAuthorsList extends StatelessWidget {
  const NovelistsAuthorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return  AuthorListView(
        isLengthList: false, literaryFigures: novelists);  }
}
