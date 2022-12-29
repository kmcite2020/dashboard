import 'package:get/get.dart';

import '../veiws/prescriptions.dart';

class AppTranslations extends Translations {
  PrescriptionController prescriptionController = Get.find();
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'prescriptions_saved': "PRESCRIPTIONS SAVED: ",
          // 'form_value':
          //     "${prescriptionController.formulation.value} ${prescriptionController.medicine.value} x ${prescriptionController.dose.value} x ${prescriptionController.route.value} x ${prescriptionController.frequency.value}",
          'dashboard': 'DASHBOARD',
          'settings': 'SETTINGS',
          'prescriptions': 'PRESCRIPTIONS',
          'material': 'USE MATERIAL DESIGN 3',
          'material_info': 'USE EITHER CLASSIC MATERIAL DESIGN 2 OR MODERN MATERIAL DESIGN 3',
          'admin': 'ADMIN MODE',
          'admin_info':
              'be able to edit medicines, routes etc.\nThis feature is being implemented.\nYou will be able to fully customize the app.',
          'fonts': 'FONTS',
          'colors': 'COLORS',
          'dark': 'DARK MODE',
          'dark_info': 'CHANGE COLOR MODES. USE LIGHTER OR DARKER COLORS.'
        },
        'ur_PK': {}
      };
}
