//
//  RegistureViewController.m
//  PoKitchen
//
//  Created by 李英 on 16/11/28.
//  Copyright © 2016年 李英 All rights reserved.
//

#import "RegistureViewController.h"

@interface RegistureViewController ()

@end

@implementation RegistureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"loginBackgroundImage.png"]];

}

- (IBAction)backToPreView:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)nexStop:(id)sender {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
