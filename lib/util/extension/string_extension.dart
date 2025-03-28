extension CapitalizeString on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String get emptyText => '';
}
