import 'package:chairy_app/core/helper/extantions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/Responsive/Models/device_info.dart';
import '../../../../../../core/routing/routs.dart';
import '../../../../../cart/presentation/cart_screen/logic/cart_cubit.dart';
import '../../logic/products_cubit.dart';

Widget buildProductsGridViewCard(
    {required DeviceInfo deviceInfo,required BuildContext context,required String Link,required int index}) {
  return InkWell(
    onTap: (){
      context.pushNamed(Routes.ProductDetailsScreen, arguments: context.read<ProductsCubit>().Products[index]);
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: deviceInfo.screenHeight * 0.15,

          decoration: BoxDecoration(
            color: Theme.of(context).dividerColor,

          ),

          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Positioned(
                top: -deviceInfo.screenHeight*0.085,
                child: Image.network(
                  Link,
                  fit: BoxFit.contain,

                  width: deviceInfo.screenWidth * 0.3,
                  height: deviceInfo.screenHeight * 0.3,

                ),)
            ],
          ),
        ),

        Padding(padding: EdgeInsetsDirectional.only(start: deviceInfo.screenWidth * 0.02),
          child: Text(context.read<ProductsCubit>().Products[index].categories[0].title,style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Color(0xfff8D8D8D)),textAlign: TextAlign.start,),
        ),
        Padding(padding: EdgeInsetsDirectional.only(start: deviceInfo.screenWidth * 0.02),
          child:  Text(context.read<ProductsCubit>().Products[index].title,style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),),
        ),

        Flexible(
            child:Row(
                children: [
                  Padding(padding: EdgeInsetsDirectional.only(start: deviceInfo.screenWidth * 0.02),
                    child: Text(context.read<ProductsCubit>().Products[index].price.toString(),style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),),
                  ),
                  Spacer(),
                  SizedBox(
                    width: deviceInfo.screenWidth * 0.08,
                    height: deviceInfo.screenHeight * 0.04,
                    child: ElevatedButton(
                        onPressed: (){
                          context.read<CartCubit>().addToCart(product: context.read<ProductsCubit>().Products[index]);

                        }, child: Icon(Icons.add),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(deviceInfo.screenWidth * 0.1), // Rounded corners
                            side: BorderSide.none,
                          ),)
                    ),
                  )
                ]
            )
        ),
      ],
    ),
  );
}