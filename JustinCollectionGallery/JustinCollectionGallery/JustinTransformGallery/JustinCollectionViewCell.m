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
    // 边框边距
    self.showImageButton.layer.borderWidth = 10;
    // 边框颜色
    self.showImageButton.layer.borderColor = [UIColor whiteColor].CGColor;
}

#pragma mark - getter & setter
- (void)setImageName:(NSString *)imageName {
    _imageName = imageName;
    UIImage *img = [UIImage imageNamed:imageName];
    [_showImageButton setBackgroundImage:img forState:UIControlStateNormal];
}

- (void)setDelegate:(id<JustinCollectionViewCellDelegate>)delegate {
    _delegate = delegate;
}

- (IBAction)clickShowImageButton:(id)sender {
    
    NSLog(@"did click: %@", _imageName);
    if ([_delegate respondsToSelector:@selector(didClickShowImageButtonWithImageName:)]) {
        [_delegate didClickShowImageButtonWithImageName:_imageName];
    }
    
}
@end
