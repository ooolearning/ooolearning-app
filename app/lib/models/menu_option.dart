class MenuOption {
  const MenuOption({
    required this.isEnabled,
    required this.label,
    required this.route,
  });

  final bool isEnabled;
  final String label;
  final String route;
}
