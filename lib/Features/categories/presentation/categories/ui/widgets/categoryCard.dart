
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/Localization/Locales/generated/l10n.dart';
import '../../../../../../core/Responsive/Models/device_info.dart';
import '../../logic/categories_cubit.dart';

Column buildCategoyCard(
    {required DeviceInfo deviceInfo, required BuildContext context, required int index, required String BaseUrl}){
   return Column(

       spacing: deviceInfo.screenHeight * 0.02,
       children: [


         Card(
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(deviceInfo.screenWidth * 0.1)),
             clipBehavior: Clip.antiAlias,
             child: Image.network(
               BaseUrl+context.read<categoriesCubit>().Categories[index].image,
               fit: BoxFit.cover,
               width: double.infinity,
               height: deviceInfo.screenHeight * 0.37,

             )
         ),

         SizedBox(
           width: double.infinity,
           child: Text(context.read<categoriesCubit>().Categories[index].title, style: Theme.of(context).textTheme.headlineMedium!.copyWith( fontWeight: FontWeight.w600, letterSpacing: -1), textAlign: TextAlign.start,),
         ),

         Text(context.read<categoriesCubit>().Categories[index].description, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),),


         Row(
           spacing: deviceInfo.screenWidth * 0.02,
           children: [
             Text(S.current.moreInfo, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).primaryColor),),

             Icon(Icons.arrow_forward, color: Theme.of(context).primaryColor,)
           ],
         )



       ]
   );
 }