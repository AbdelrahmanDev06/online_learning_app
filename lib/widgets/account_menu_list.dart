import 'package:flutter/material.dart';
import 'account_list_item.dart';

/// قائمة خيارات صفحة الأكونت (Favourite, Edit Account, ...)
class AccountMenuList extends StatelessWidget {
  const AccountMenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AccountListItem(label: 'Favourite', onTap: () {}),
        AccountListItem(label: 'Edit Account', onTap: () {}),
        AccountListItem(label: 'Settings and Privacy', onTap: () {}),
        AccountListItem(label: 'Help', onTap: () {}),
      ],
    );
  }
}
