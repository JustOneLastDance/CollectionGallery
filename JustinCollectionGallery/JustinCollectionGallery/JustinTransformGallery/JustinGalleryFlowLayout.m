//
//  JustinGalleryFlowLayout.m
//  JustinCollectionGallery
//
//  Created by JustinChou on 16/8/17.
//  Copyright © 2016年 JustinChou. All rights reserved.
//

#import "JustinGalleryFlowLayout.h"

#define PXY_Margin 5
#define PXY_size 140
#define PXY_ScreenW [UIScreen mainScreen].bounds.size.width

@implementation JustinGalleryFlowLayout

- (void)prepareLayout {
    
    [super prepareLayout];
    self.itemSize = CGSizeMake(PXY_size, PXY_size);
    self.minimumInteritemSpacing = PXY_Margin;
    CGFloat extraMargin = (PXY_ScreenW - PXY_size) * 0.5;
    self.sectionInset = UIEdgeInsetsMake(0, extraMargin, 0, extraMargin);
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSArray *attrs = [super layoutAttributesForElementsInRect:self.collectionView.bounds];
    CGFloat width = self.collectionView.bounds.size.width;
    CGFloat offsetX = self.collectionView.contentOffset.x;
    
    for (UICollectionViewLayoutAttributes *attr in attrs) {
        CGFloat delta = fabs(attr.center.x - (width * 0.5 + offsetX));
        CGFloat scale = 1 - delta / (width * 0.5) * 0.25;
        attr.transform = CGAffineTransformMakeScale(scale, scale);
    }
    
    return attrs;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return true;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    
    CGRect rect = CGRectZero;
    rect.origin.x = proposedContentOffset.x;
    rect.origin.y = 0;
    rect.size = self.collectionView.frame.size;
    
    NSArray *attrs = [super layoutAttributesForElementsInRect:rect];
    
    CGFloat centerX = proposedContentOffset.x + self.collectionView.frame.size.width * 0.5;
    
    CGFloat minSpace = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attr in attrs) {
        if (ABS(minSpace) > ABS(attr.center.x - centerX)) {
            minSpace = attr.center.x - centerX;
        }
    }
    
    proposedContentOffset.x += minSpace;
    return proposedContentOffset;
}

@end
