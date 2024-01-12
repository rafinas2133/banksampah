import 'package:flutter/material.dart';

class ProfileField extends StatefulWidget {
  final IconData icon;
  final String label;
  final String initialValue;
  final void Function(String)? onChanged;

  const ProfileField({
    Key? key,
    required this.icon,
    required this.label,
    required this.initialValue,
    this.onChanged,
  }) : super(key: key);

  @override
  State<ProfileField> createState() => _ProfileFieldState();
}

class _ProfileFieldState extends State<ProfileField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        readOnly: true,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          labelText: widget.label,
        ),
        initialValue: widget.initialValue,
        onChanged: widget.onChanged,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
