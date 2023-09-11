import 'package:flutter/material.dart';
import 'package:portfolio_flutter/utils/text-style.dart';



class NavButtons extends StatefulWidget {
  final isActive;
  final String text;
  final Function()? onTap;
  NavButtons({
    super.key, required this.text, required this.onTap, this.isActive, 
  });

  @override
  State<NavButtons> createState() => _NavButtonsState();
}

class _NavButtonsState extends State<NavButtons> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: widget.onTap, 
          child: Container(
            child: Text(
              widget.text,
              style: _isHovered ? AppTextStyles.content_purple_bold:AppTextStyles.content_white_bold,
            ),
          ),
        ),
      ),
    );
  }
}