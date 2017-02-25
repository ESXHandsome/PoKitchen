//
//  CycleImageCell.h
//  PocketKitchen
//
//  Created by 李英 on 15/10/15.
//  Copyright (c) 2015年 李英 All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CycleImageCell : UICollectionViewCell

@property (nonatomic, copy) NSString *placeHolderImageName;

@property (nonatomic, strong) NSURL *imageURL;
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, strong) UIImageView *imageView;



@end
