import 'package:image_picker/image_picker.dart';

Future pickImage() async {
  await ImagePicker().pickImage(source: ImageSource.camera);
}
