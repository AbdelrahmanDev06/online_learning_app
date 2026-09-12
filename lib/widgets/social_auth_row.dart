import 'package:flutter/material.dart';

class SocialAuthRow extends StatelessWidget {
  final VoidCallback? onGoogleTap;
  final VoidCallback? onFacebookTap;

  const SocialAuthRow({
    super.key,
    this.onGoogleTap,
    this.onFacebookTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _SocialCircleButton(
          icon: Icons.g_mobiledata,
          iconColor: Colors.red,
          onTap: onGoogleTap,
        ),
        const SizedBox(width: 20),
        _SocialCircleButton(
          icon: Icons.facebook,
          iconColor: const Color(0xFF1877F2),
          onTap: onFacebookTap,
        ),
      ],
    );
  }
}

class _SocialCircleButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final VoidCallback? onTap;

  const _SocialCircleButton({
    required this.icon,
    required this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(28),
      child: Container(
        width: 52,
        height: 52,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: iconColor, size: 28),
      ),
    );
  }
}
