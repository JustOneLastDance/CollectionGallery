//
//  JustinGalleryView.m
//  JustinCollectionGallery
//
//  Created by JustinChou on 16/8/18.
//  Copyright © 2016年 JustinChou. All rights reserved.
//

#import "JustinGalleryView.h"
#import "JustinGalleryFlowLayout.h"
#import "JustinCollectionViewCell.h"

#define kCollectionViewCellId @"kCollectionViewCellId"

@interface JustinGalleryView ()<UICollectionViewDelegate, UICollectionViewDataSource, JustinCollectionViewCellDelegate>

@end

@implementation JustinGalleryView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    CGRect cvFrame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    
    JustinGalleryFlowLayout *layout = [[JustinGalleryFlowLayout alloc] init];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:cvFrame collectionViewLayout:layout];
    collectionView.showsHorizontalScrollIndicator = false;
    collectionView.backgroundColor = [UIColor lightGrayColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView registerNib:[UINib nibWithNibName:@"JustinCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:kCollectionViewCellId];
    
    [self addSubview:collectionView];
    
    return self;
}

- (void)setArray:(NSArray *)array {
    _array = array;
}

#pragma mark - other delegate 
- (void)didClickShowImageButtonWithImageName:(NSString *)imageName {
    NSLog(@"当前控制器：%@  传过来的值：%@", self, imageName);
}

#pragma - collectionView delegate & datasource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 100;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    JustinCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCollectionViewCellId forIndexPath:indexPath];
    cell.imageName = _array[indexPath.row];
    cell.delegate = self;
    
    return cell;
}

@end
