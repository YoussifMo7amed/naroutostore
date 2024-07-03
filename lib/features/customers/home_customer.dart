import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/service/push_notifications/firebase_cloud_messaging.dart';

class HomeCustomer extends StatelessWidget {
  const HomeCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Customer Home'),
        ),
        body: ValueListenableBuilder(
            valueListenable: FirebaseCloudMessaging().isSubscribed,
            builder: (_, value, __) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          value ? 'Subscribed' : 'UnSubscribed',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: value ? Colors.green : Colors.red,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Transform.scale(
                          scale: 1.5,
                          child: Switch.adaptive(
                            value: value,
                            inactiveTrackColor: Color(0XFF262626),
                            activeColor: Colors.green,
                            onChanged: (value) async {
                              await FirebaseCloudMessaging()
                                  .controllerForUserSubscription();
                            },
                          ),
                        )
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        // FirebaseCloudMessaging().sendTopicNotification();
                      },
                      child: Text(
                        'Send Notification',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: value ? Colors.green : Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
