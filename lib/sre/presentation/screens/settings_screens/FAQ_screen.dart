import 'package:discy_application/sre/config/color/def_color.dart';
import 'package:discy_application/sre/config/font_stayle/text_style.dart';
import 'package:discy_application/sre/data/model/faq/faq_model.dart';
import 'package:discy_application/sre/di.dart';
import 'package:discy_application/sre/presentation/bloc/settings_bloc/faq_bloc/faq_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomSheet: _buildBottomSheet(),
      appBar: AppBar(
        title: Text('FAQ',style: textThemeData.textTheme.headline5,
        textAlign: TextAlign.center,),
      ),
      body: BlocProvider(
        create: (context) => di<FaqCubit>()..getFAQ(),
        child:   BlocBuilder<FaqCubit, FaqState>(
          builder: (context, state) {
            if (state is FaqSuccessState && state.faqModel != null) {
              return ListView.separated(
                  shrinkWrap: true,

                  itemBuilder: (context, int index) =>
                      _buildListQuestionAndAnswer(state.faqModel.faqs[index],context),
                  separatorBuilder: (context, int index) => Divider(),
                  itemCount: state.faqModel.faqs.length);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  _buildListQuestionAndAnswer(FaqDataModel faqModel,context) => GestureDetector(
    onTap: ()=>di<FaqCubit>().buildBottomSheet(context,_buildBottomSheet(faqModel)),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 8.0),
      child: ListTile(
            title: RichText(
              text: TextSpan(
                text: faqModel.question.toString(),style: textThemeData.textTheme.bodyText1
              ),
            ),
          trailing: Icon(Icons.arrow_forward_ios_outlined,size: 15,
          color: deepGrey(),)
          // subtitle: RichText(
          //   text: TextSpan(
          //       text: faqModel.answer.toString(),style: textThemeData.textTheme.subtitle1
          //   ),
          // ),
          ),
    ),
  );

  _buildBottomSheet(FaqDataModel faqModel)=>Container(
    margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Knowledge Base',style:textThemeData.textTheme.headline5 ,),
        SizedBox(height: 15.0,),
        RichText(
            text: TextSpan(
                text: faqModel.answer.toString(),style: textThemeData.textTheme.subtitle1
            ),
          ),
      ],
    ),
  );
}
