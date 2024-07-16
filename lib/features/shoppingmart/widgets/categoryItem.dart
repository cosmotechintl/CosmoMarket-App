import 'package:flutter/material.dart';
import '../../../common/styles/theme.dart';
import '../model/categorymodel.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryItem({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        margin: const EdgeInsets.all(5.0),
        width: 150,
        child: Card(
          elevation: 4.0,
          color:AppTheme.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:
            [
                Container(
                  height: 130.0,
                  width: 150.0,
                  child: ClipRRect(
                    borderRadius:const BorderRadius.all(Radius.circular(10.0)),
                    child: Image.network(
                      categoryModel.img,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              const SizedBox(
                height:10.0
              ),
              Center(
                child: Text(
                  categoryModel.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
