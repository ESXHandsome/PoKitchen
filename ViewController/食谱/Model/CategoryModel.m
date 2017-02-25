//
//  CategoryModel.m
//  PoKitchen
//
//  Created by 夏婷 on 16/11/24.
//  Copyright © 2016年 夏婷. All rights reserved.
//

#import "CategoryModel.h"

@implementation CategoryModel

//当字典中的key名和属性名不一致时，通过实现这个方法，设置赋值对应关系
+(JSONKeyMapper *)keyMapper{
    
    //告诉JSONModel解析时，字典的id这个key所对应的值，赋值给模型的Id属性
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:@{@"Id":@"id"}];
}

@end
