import 'package:flutter/material.dart';

enum ProductTypeEnum { Female, Male }

class CustomGender extends StatefulWidget {
  const CustomGender({super.key});

  @override
  State<CustomGender> createState() => _CustomGenderState();
}

class _CustomGenderState extends State<CustomGender> {
  ProductTypeEnum? _productTypeEnum;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 20),
          child: const Text(
            'Gender :',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 4),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white30),
                  child: RadioListTile<ProductTypeEnum>(
                    contentPadding: const EdgeInsets.all(0.0),
                    title: Text(ProductTypeEnum.Female.name),
                    value: ProductTypeEnum.Female,
                    groupValue: _productTypeEnum,
                    onChanged: (value) {
                      setState(() {
                        _productTypeEnum = value;
                      });
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white30),
                  child: RadioListTile<ProductTypeEnum>(
                    contentPadding: const EdgeInsets.all(0.0),
                    title: Text(ProductTypeEnum.Male.name),
                    value: ProductTypeEnum.Male,
                    groupValue: _productTypeEnum,
                    onChanged: (value) {
                      setState(() {
                        _productTypeEnum = value;
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
