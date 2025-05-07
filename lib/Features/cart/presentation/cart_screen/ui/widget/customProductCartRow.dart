
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/Responsive/Models/device_info.dart';
import '../../../../../../core/helper/dotenv/dot_env_helper.dart';
import '../../../../domain/entity/cartItemEntity.dart';
import '../../logic/cart_cubit.dart';

Container buildProductCartRow(
    {required DeviceInfo deviceInfo, required BuildContext context, required CartItemEntity cartItem, required int index,  bool? fromCart = true}){
  return Container(
    width: deviceInfo.screenWidth,
    margin: EdgeInsetsDirectional.only(bottom: deviceInfo.screenHeight*0.02),
    child: Row(

      spacing: deviceInfo.screenWidth*0.02,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).dividerColor,
              borderRadius: BorderRadius.circular(deviceInfo.screenWidth*0.05)
          ),
          child: Image.network(
            EnvHelper.getString('BASE_URL')+cartItem.product.images[0].link,
            width: deviceInfo.screenWidth*0.24,
            height: deviceInfo.screenHeight*0.12,
          ),
        ),

        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(cartItem.product.title,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700),),
              Text(cartItem.product.categories[0].title,style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500),),

              SizedBox(height: deviceInfo.screenHeight*0.01,),
              if(fromCart == true)
              Row(
                  spacing: deviceInfo.screenWidth*0.02,
                  children: [

                    IconButton(onPressed: (){

                      context.read<CartCubit>().removeFromCart(cartItem.product);
                    }, icon: const Icon(Icons.delete_forever_outlined)),

                    InkWell(
                      onTap: (){
                        if(context.read<CartCubit>().cartItems[index]!.quantity > 0){

                          context.read<CartCubit>().updateDirectQuantity(quantity: context.read<CartCubit>().cartItems[index]!.quantity-1, cartItem: cartItem);
                        }
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(deviceInfo.screenWidth*0.05)
                          ),
                          child: Icon(Icons.remove, color: Colors.white, size: deviceInfo.screenWidth*0.045,)),
                    ),

                    Text(context.read<CartCubit>().cartItems[index]!.quantity.toString(),style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),),

                    InkWell(
                      onTap: (){
                        context.read<CartCubit>().updateDirectQuantity(quantity: context.read<CartCubit>().cartItems[index]!.quantity+1, cartItem: cartItem);

                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(deviceInfo.screenWidth*0.05)
                          ),
                          child:  Icon(Icons.add, color: Colors.white, size: deviceInfo.screenWidth*0.045)),
                    )

                  ]
              )
            ]
        ),
        Spacer(),

        Text(cartItem.product.price.toString(),style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),),
      ],
    ),
  );
}