import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/constants/app_colors.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/constants/app_typography.dart';

class SettingsItemTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? value;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? iconColor;
  final Color? iconBgColor;

  const SettingsItemTile({
    super.key,
    required this.icon,
    required this.label,
    this.value,
    this.trailing,
    this.onTap,
    this.iconColor,
    this.iconBgColor,
  });

  @override
  Widget build(BuildContext context) {
    final hasValue = value != null && value!.isNotEmpty;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            // Ikon sisi kiri
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: iconBgColor ?? AppColors.pastelBlueBg,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 20,
                color: iconColor ?? AppColors.primaryNavy,
              ),
            ),
            const SizedBox(width: 14),

            // Label item
            Text(
              label,
              style: AppTypography.calloutRegular.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.inkDark,
              ),
            ),
            const SizedBox(width: 12),

            // Sisi kanan: Value dan Trailing selalu mentok di ujung kanan
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (hasValue)
                    Flexible(
                      child: Text(
                        value!,
                        style: AppTypography.calloutRegular.copyWith(
                          color: AppColors.muted,
                        ),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  if (trailing != null) ...[
                    if (hasValue) const SizedBox(width: 8),
                    trailing!,
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
