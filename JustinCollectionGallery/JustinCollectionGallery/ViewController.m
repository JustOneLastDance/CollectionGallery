//
//  ViewController.m
//  JustinCollectionGallery
//
//  Created by JustinChou on 16/8/17.
//  Copyright © 2016年 JustinChou. All rights reserved.
//

#import "ViewController.h"
#import "JustinGalleryFlowLayout.h"
#import "JustinCollectionViewCell.h"

#define kCollectionViewCellId @"kCollectionViewCellId"

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self pxy_setCollectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pxy_setCollectionView {
    
    JustinGalleryFlowLayout *flowLayout = [[JustinGalleryFlowLayout alloc] init];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    collectionView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 150);
    collectionView.center = self.view.center;
    collectionView.showsHorizontalScrollIndicator = false;
    collectionView.backgroundColor = [UIColor lightGrayColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView registerNib:[UINib nibWithNibName:@"JustinCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:kCollectionViewCellId];
    [self.view addSubview:collectionView];
}

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
