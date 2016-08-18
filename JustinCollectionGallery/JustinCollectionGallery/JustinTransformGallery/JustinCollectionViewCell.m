//
//  JustinCollectionViewCell.m
//  JustinCollectionGallery
//
//  Created by JustinChou on 16/8/17.
//  Copyright © 2016年 JustinChou. All rights reserved.
//

#import "JustinCollectionViewCell.h"

@interface JustinCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation JustinCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setImageName:(NSString *)imageName {
    _imageName = imageName;
    self.imageView.image = [UIImage imageNamed:imageName];
}

@end
