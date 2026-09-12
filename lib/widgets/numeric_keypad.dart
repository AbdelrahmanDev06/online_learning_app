import 'package:flutter/material.dart';

class NumericKeypad extends StatelessWidget {
  final ValueChanged<String> onDigitTap;
  final VoidCallback onBackspaceTap;

  const NumericKeypad({
    super.key,
    required this.onDigitTap,
    required this.onBackspaceTap,
  });

  static const List<String> _keys = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '',
    '0',
    'back',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.6,
      children: _keys.map((key) {
        if (key.isEmpty) return const SizedBox.shrink();
        if (key == 'back') {
          return _KeypadKey(
            onTap: onBackspaceTap,
            child: const Icon(Icons.backspace_outlined, color: Colors.white70),
          );
        }
        return _KeypadKey(
          onTap: () => onDigitTap(key),
          child: Text(
            key,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _KeypadKey extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;

  const _KeypadKey({required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Center(child: child),
    );
  }
}
