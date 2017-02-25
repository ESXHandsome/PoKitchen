//
//  DishClassModel+NetWork.h
//  PoKitchen
//
//  Created by 夏婷 on 16/11/28.
//  Copyright © 2016年 夏婷. All rights reserved.
//

#import "DishClassModel.h"

@interface DishClassModel (NetWork)

+(void)loadDishClassListWithPage:(NSInteger)page callBack:(void(^)(NSArray *array,NSError *error))callBack;


@end
