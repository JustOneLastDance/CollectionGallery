//
//  JustinCollectionViewCell.h
//  JustinCollectionGallery
//
//  Created by JustinChou on 16/8/17.
//  Copyright © 2016年 JustinChou. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JustinCollectionViewCellDelegate <NSObject>
/**
 *  代理传值
 *
 *  @param imageName cell内的图片信息
 */
- (void)didClickShowImageButtonWithImageName:(NSString *)imageName;

@end

@interface JustinCollectionViewCell : UICollectionViewCell

@property (nonatomic, copy) NSString *imageName;

@property (nonatomic, weak) id<JustinCollectionViewCellDelegate> delegate;

@end
