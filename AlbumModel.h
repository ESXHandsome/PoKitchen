//
//  AlbumModel.h
//  PoKitchen
//
//  Created by Ying on 2016/11/28.
//  Copyright © 2016年 夏婷. All rights reserved.
//

#import "JSONModel.h"

@interface AlbumModel : JSONModel
@property (nonatomic ,copy) NSString * album;
@property (nonatomic , copy) NSString * albunLogo ;
@property (nonatomic ,copy) NSString * chargeCount ;
@property (nonatomic , copy) NSString * seriesId ;
@end
