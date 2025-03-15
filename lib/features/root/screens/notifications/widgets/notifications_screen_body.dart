import 'package:el_sheikh/core/dependancy_injection/dependancy_injection.dart';
import 'package:el_sheikh/core/styles/app_text_styles.dart';
import 'package:el_sheikh/features/root/screens/notifications/provider/notifications_provider.dart';
import 'package:el_sheikh/features/root/screens/notifications/widgets/notification_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationsScreenBody extends StatelessWidget {
  const NotificationsScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => locator<NotificationsProvider>(),
      child:
          Consumer<NotificationsProvider>(builder: (context, provider, child) {
        return provider.loadnotifications
            ? provider.notifications.isEmpty
                ? Center(
                    child: Text(
                    "لا توجد اشعارات",
                    style: AppTextStyles.title28Brown,
                  ))
                : ListView.builder(
                    itemCount: provider.notifications.length,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    itemBuilder: (context, index) {
                      return NotificationCard(
                        title: provider.notifications[index].title,
                        subTitle: provider.notifications[index].message,
                      );
                    },
                  )
            : Center(child: CircularProgressIndicator());
      }),
    );
  }
}
