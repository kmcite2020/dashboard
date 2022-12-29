// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../../core/themes.dart';
import '../../core/widgets.dart';

class Settings extends ReactiveStatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // automaticallyImplyLeading: false,
        title: const Text(
          'Settings',
        ),
      ),
      body: Stack(
        children: [
          BackgroundWidget(size),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Card(
              child: ListView(
                children: [
                  SizedBox(height: padding),
                  ListTile(
                    title: Text('Account Settings'),
                    subtitle: Column(
                      children: [
                        // for (final data in authState!.providerData)
                        //   Column(
                        //     children: [
                        //       Padding(
                        //         padding: EdgeInsets.all(padding),
                        //         child: SizedBox(
                        //           width: 200,
                        //           height: 200,
                        //           child: Image.network(
                        //             data.photoURL ?? '',
                        //           ),
                        //         ),
                        //       ),
                        //       IconButton(
                        //         onPressed: () {
                        //           // authState?.updatePhotoURL('photoURL');
                        //         },
                        //         icon: Icon(
                        //           Icons.update,
                        //         ),
                        //       ),
                        //       Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           Text("NAME: ${data.displayName}"),
                        //           IconButton(
                        //               onPressed: () {
                        //                 // authState!.updateDisplayName('Adnan Farooq');
                        //               },
                        //               icon: Icon(Icons.account_circle_outlined))
                        //         ],
                        //       ),
                        //       Text("EMAIL: ${data.email}", softWrap: true),
                        //       Text(
                        //         "PHONE: ${data.phoneNumber}",
                        //         softWrap: true,
                        //       ),
                        //     ],
                        //   ),
                        Padding(
                          padding: EdgeInsets.all(padding),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'SIGN OUT',
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(padding),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).errorColor),
                            onPressed: () async {
                              // try {
                              //   // await authState!.delete();
                              //   // await authState!.reauthenticateWithCredential(
                              //   //   AuthCredential(
                              //   //     providerId: authState!.providerData.first.providerId,
                              //   //     signInMethod: 'password',
                              //   //   ),
                              //   // );
                              // } on FirebaseAuthException catch (e) {
                              //   print(e.message);
                              //   print(e.code);
                              // }
                            },
                            child: Text(
                              'DELETE ACCOUNT permanently',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Text('User Experience'),
                    subtitle: Column(
                      children: [
                        ColorChanger(size),
                        const ThemeModeChanger(),
                        const FontChanger(),
                        const PaddingChanger(),
                        const BorderRadiusChanger()
                      ],
                    ),
                  ),
                  ListTile(
                    title: Text('Backup & Restore Settings #2'),
                    subtitle: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(padding),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Backup to FileSystem #3',
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(padding),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Backup to Cloud Services #4',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(padding),
                    child: Text('About'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(padding),
                    child: Text('Support'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(padding),
                    child: Text('Licenses'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(padding),
                    child: Text('Feedback'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// BACKUP/RESTORE
// BACKUP
// 	BACKUP TO FILESYSTEM
// 	BACKUP TO CLOUD SERVICES- 
// 		GOOGLE DRIVE
// 		ONEDRIVE
// 		ETC.
// RESTORE
// 	RESTORE FROM FILES
// 	RESTORE FROM CLOUD

// UPDATE APP
// 	UPDATE FROM STORE 
// 	UPDATE FROM WITHIN THE APP
// 		CHECK FOR UPDATE BUTTON
// 		STATUS
// 		DOWNLOAD UI
// 			PROGRESS BAR 
// 			SIZE INDICATOR
// 		UPDATE UI
// 			PROGRESS BAR %
// 	UPDATE FROM BROWSER/INSTALLATION FILE

// ABOUT THE DEVELOPER

// SUPPORT
// 	WEBSITE & PHONE NO.

// LICENSES
// MICRSOFT GOOGLE ETC.