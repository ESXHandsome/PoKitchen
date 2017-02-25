//
//  TagsInfoModel.h
//  PoKitchen
//
//  Created by 夏婷 on 16/11/24.
//  Copyright © 2016年 夏婷. All rights reserved.
//

#import "JSONModel.h"

@interface TagsInfoModel : JSONModel

@property (nonatomic, copy) NSString * Id;

@property (nonatomic, copy) NSString * text;

@property (nonatomic, copy) NSString * type;

@end
