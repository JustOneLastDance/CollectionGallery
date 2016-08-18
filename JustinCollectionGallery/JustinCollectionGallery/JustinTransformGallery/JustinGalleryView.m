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

@interface JustinGalleryView ()<UICollectionViewDelegate, UICollectionViewDataSource>

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

#pragma - collectionView delegate & datasource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    JustinCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCollectionViewCellId forIndexPath:indexPath];
    cell.imageName = @"1004";
    
    return cell;
}

@end
