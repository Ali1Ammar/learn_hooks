import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

useSearch() {
  final controller = useTextEditingController();
  final focusNode = useFocusNode();
  final searchEnable = useState(false);
  return SearchController(
      controller: controller, focusNode: focusNode, searchEnable: searchEnable);
}

class SearchController {
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueNotifier<bool> searchEnable;
  SearchController(
      {required this.controller,
      required this.focusNode,
      required this.searchEnable});
}
