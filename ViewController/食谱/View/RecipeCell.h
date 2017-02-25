//
//  RecipeCell.h
//  PoKitchen
//
//  Created by 李英 on 16/11/24.
//  Copyright © 2016年 李英 All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *dishImage;

@property (weak, nonatomic) IBOutlet UILabel *titleL;
@property (weak, nonatomic) IBOutlet UILabel *descriptionL;

@end
