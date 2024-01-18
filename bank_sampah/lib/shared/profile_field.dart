import 'package:flutter/material.dart';

class ProfileField extends StatefulWidget {
  final IconData icon;
  final String label;
  final String initialValue;
  final bool isUpdating;
  final void Function(String)? onChanged;

  const ProfileField({
    Key? key,
    required this.icon,
    required this.label,
    required this.initialValue,
    this.onChanged,
    required this.isUpdating
  }) : super(key: key);

  @override
  State<ProfileField> createState() => _ProfileFieldState();
}

class _ProfileFieldState extends State<ProfileField> {
  late TextEditingController _controller;
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              readOnly: !isEditing,
              autofocus: !isEditing,
              controller: _controller,
              decoration: InputDecoration(
                prefixIcon: Icon(widget.icon),
                labelText: widget.label,
              ),
              onChanged: widget.onChanged,
            ),
          ),
          if (widget.isUpdating)
            IconButton(
              icon: Icon(isEditing ? Icons.arrow_upward : Icons.arrow_forward),
              onPressed: () {
                setState(() {
                  isEditing = !isEditing;
                });
              },
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
