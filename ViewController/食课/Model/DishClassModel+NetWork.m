//
//  DishClassModel+NetWork.m
//  PoKitchen
//
//  Created by 夏婷 on 16/11/28.
//  Copyright © 2016年 夏婷. All rights reserved.
//

#import "DishClassModel+NetWork.h"

@implementation DishClassModel (NetWork)

+(void)loadDishClassListWithPage:(NSInteger)page callBack:(void (^)(NSArray *, NSError *))callBack{
    
    //    methodName=CourseIndex&page=1&size=10&token=9B6EF4052641DB78766773995185F896&user_id=947432&version=4.4
    
    NSDictionary *para = @{@"methodName":@"CourseIndex",@"page":[NSString stringWithFormat:@"%ld",page],@"size":@"10",@"version":@"4.4"};
    
    [BaseRequest postWithURL:HOME_URL para:para callBack:^(NSData *data, NSError *error) {
        
        if(!error){
            //成功进行解析
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSArray *dishArray = dict[@"data"][@"data"];
            //将数组中的字典转化为对应的模型对象
            NSMutableArray * models = [DishClassModel arrayOfModelsFromDictionaries:dishArray error:nil];
            dispatch_async(dispatch_get_main_queue(), ^{
                callBack(models,nil);
            });
            
        }else{
            
            //失败 UI 处理
            dispatch_async(dispatch_get_main_queue(), ^{
                callBack(nil, error);
            });
            
        }

        
    }];
    
    
}
@end
