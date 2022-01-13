import 'package:discy_application/sre/config/font_stayle/text_style.dart';
import 'package:discy_application/sre/config/routes/route.dart';
import 'package:discy_application/sre/data/model/article/caregory_model.dart';
import 'package:discy_application/sre/presentation/bloc/categories_bloc/category_cubit.dart';
import 'package:discy_application/sre/presentation/screens/single_category_screen.dart';
import 'package:discy_application/sre/presentation/widgets/default_circle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../di.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: BlocProvider(
        create: (context) => di<CategoryCubit>()..getCategories(),
        child: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state is CategorySuccessState &&
                state.categoriesModel != null) {
              return GridView.count(
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 2,
                  childAspectRatio: 1.0 / 0.5,
                  crossAxisSpacing: 1.9 / 0.1,
                  mainAxisSpacing: 1.8 / 0.2,
                  children: List.generate(
                    state.categoriesModel.categories!.length,
                    (index) => _buildListCategories(
                        categoryModel: state.categoriesModel.categories![index],
                        context: context),
                  ));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  _buildListCategories(
          {required CategoryModel categoryModel, required context}) =>
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: Colors.grey,
            )),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
        child: GestureDetector(onTap: ()=>navigatorTo(
            context: context,
            widget: SingleCategoryScreen(
              name:categoryModel.name! ,
              id: categoryModel.id!,
            ),
        ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                    text: '${categoryModel.name}',
                    style: textThemeData.textTheme.bodyText1),
              ),
              SizedBox(
                height: 10,
              ),
              _buildFollowers(categoryModel),
            ],
          ),
        ),
      );

  _buildFollowers(CategoryModel categoryModel) => Row(
        children: [
          _buildCircleImage(categoryModel),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${categoryModel.categoryFollowers}',
                  style: textTheme.caption,
                ),
                Text('Followers', style: textTheme.caption),
              ],
            ),
          )
        ],
      );
  _buildCircleImage(CategoryModel categoryModel) => Expanded(
        child: Stack(
          children: [
            _followerImg(categoryModel.followers![0].toString()),
            Positioned(
              left: 20,
              child: _followerImg(categoryModel.followers![1].toString())
            ),
            Positioned(
              left: 40,
              child: _followerImg(categoryModel.followers![1].toString())
            )
          ],
        ),
      );

 _followerImg(String img)=>DefaultCircleWidget(
  isIcon: false,
  image: img.toString(),

  width: 30.0,
  r2: 20.0,
  r: 0.0,
  height: 30.0,

  );
}
