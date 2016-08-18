//
//  JustinCollectionViewCell.m
//  JustinCollectionGallery
//
//  Created by JustinChou on 16/8/17.
//  Copyright © 2016年 JustinChou. All rights reserved.
//

#import "JustinCollectionViewCell.h"

@interface JustinCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIButton *showImageButton;

@end

@implementation JustinCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setImageName:(NSString *)imageName {
    _imageName = imageName;
    UIImage *img = [UIImage imageNamed:imageName];
    [_showImageButton setBackgroundImage:img forState:UIControlStateNormal];
}

- (IBAction)clickShowImageButton:(id)sender {
    
    NSLog(@"did click: %@", _imageName);
}
@end
