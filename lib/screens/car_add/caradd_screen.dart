import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task2/bloc/cars_bloc.dart';
import 'package:task2/models/car_model.dart';
import 'package:task2/screens/cars/widgets/app_button.dart';
import 'package:task2/screens/cars/widgets/cars_textfield.dart';

class CarAdding extends StatefulWidget {
  const CarAdding({Key? key}) : super(key: key);

  @override
  State<CarAdding> createState() => _CarAddingState();
}

class _CarAddingState extends State<CarAdding> {
  final nameContreller = TextEditingController();
  final modelContreller = TextEditingController();
  final yearContreller = TextEditingController();
  final volumeContreller = TextEditingController();
  final priceContreller = TextEditingController();
  final linkContreller = TextEditingController();
  final isFullFilled = ValueNotifier<bool>(false);
  final isLink = ValueNotifier<bool>(false);
  final isCamera = ValueNotifier<bool>(true);
  String get symbols => r'[a-Za-ZA-яЯ-я]';
  String get numbers => r'[0-9]';
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarsTextField(
                  OnChanged: (v) {
                    checkValidation();
                  },
                  controller: nameContreller,
                  keyboard: TextInputType.text,
                  maxLength: 100,
                  label: 'Марка',
                ),
                const SizedBox(
                  height: 20,
                ),
                CarsTextField(
                  OnChanged: (v) {
                    checkValidation();
                  },
                  controller: modelContreller,
                  maxLength: 100,
                  keyboard: TextInputType.text,
                  label: 'Модель',
                ),
                const SizedBox(
                  height: 20,
                ),
                CarsTextField(
                  OnChanged: (v) {
                    checkValidation();
                  },
                  controller: yearContreller,
                  maxLength: 4,
                  keyboard: TextInputType.number,
                  label: 'Год',
                ),
                const SizedBox(
                  height: 20,
                ),
                CarsTextField(
                  OnChanged: (v) {
                    checkValidation();
                  },
                  controller: volumeContreller,
                  maxLength: 3,
                  keyboard: TextInputType.datetime,
                  label: 'Объем',
                ),
                const SizedBox(
                  height: 20,
                ),
                CarsTextField(
                  OnChanged: (v) {
                    checkValidation();
                  },
                  controller: priceContreller,
                  keyboard: TextInputType.datetime,
                  label: 'Цена',
                  maxLength: 10,
                ),
                const SizedBox(
                  height: 16,
                ),
                ValueListenableBuilder(
                  valueListenable: isCamera,
                  child: const SizedBox(
                    height: 15,
                  ),
                  builder: (context, value, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: isCamera.value,
                          replacement: CarsTextField(
                            OnChanged: (e) {
                              checkValidation();
                            },
                            controller: linkContreller,
                            keyboard: TextInputType.text,
                            maxLength: 100000000,
                            label: 'Ссылка на фото',
                          ),
                          child: SizedBox(
                            height: 55,
                            child: Row(
                              children: [
                                AppButton(
                                    onPressed: () {
                                      showBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return Container(
                                            width: double.infinity,
                                            padding: const EdgeInsets.all(16.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Text(
                                                    'Выберите способ добавление фото:'),
                                                ElevatedButton(
                                                  onPressed: () async {
                                                    _image =
                                                        await _picker.pickImage(
                                                            source: ImageSource
                                                                .camera);
                                                    imageFile =
                                                        File(_image!.path);
                                                    // ignore: use_build_context_synchronously
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text('Камера'),
                                                ),
                                                const Text('Или'),
                                                ElevatedButton(
                                                  onPressed: () async {
                                                    _image =
                                                        await _picker.pickImage(
                                                            source: ImageSource
                                                                .gallery);
                                                    imageFile =
                                                        File(_image!.path);
                                                    // ignore: use_build_context_synchronously
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text('Галерея'),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    isFullFilled: true,
                                    isLoading: false),
                                const SizedBox(
                                  width: 24,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    borderRadius: BorderRadius.circular(12),
                                    image: imageFile != null
                                        ? DecorationImage(
                                            fit: BoxFit.cover,
                                            image: FileImage(imageFile!),
                                          )
                                        : const DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://img.lovepik.com/free-png/20210926/lovepik-car-icon-png-image_401452256_wh1200.png")),
                                  ),
                                  width: 55,
                                ),
                              ],
                            ),
                          ),
                        ),
                        child!,
                        Row(
                          children: [
                            Switch.adaptive(
                              value: isCamera.value,
                              onChanged: (value) {
                                isCamera.value = !isCamera.value;
                              },
                            ),
                            const Text('Добавление фото с телефона'),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: 500,
                    height: 50,
                    child: BlocBuilder<CarsBloc, CarsState>(
                      builder: (context, state) {
                        return ValueListenableBuilder(
                          valueListenable: isFullFilled,
                          builder: (context, _, __) {
                            return AppButton(
                              isFullFilled: isFullFilled.value,
                              isLoading: state is CarsLoadState,
                              onPressed: () {
                                final cars = CarModel(
                                  localImage: imageFile,
                                  name: nameContreller.text,
                                  model: modelContreller.text,
                                  years: int.parse(yearContreller.text),
                                  url: linkContreller.text,
                                  volume: double.parse(volumeContreller.text),
                                  price: double.parse(priceContreller.text),
                                );
                                BlocProvider.of<CarsBloc>(context).add(
                                  AddCars(cars),
                                );
                              },
                            );
                          },
                        );
                      },
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void checkValidation() {
    if ([
      nameContreller,
      modelContreller,
      yearContreller,
      volumeContreller,
      priceContreller,
    ].every((e) => e.text.length >= 3)) {
      if (linkContreller.text.contains('http') || imageFile != null) {
        isFullFilled.value = true;
      } else {
        isFullFilled.value = false;
      }
    } else {
      isFullFilled.value = false;
    }
  }

  @override
  void dispose() {
    nameContreller.dispose();
    modelContreller.dispose();
    yearContreller.dispose();
    volumeContreller.dispose();
    priceContreller.dispose();
    linkContreller.dispose();
    isFullFilled.dispose();
    super.dispose();
  }
}
