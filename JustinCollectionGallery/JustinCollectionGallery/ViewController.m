//
//  ViewController.m
//  JustinCollectionGallery
//
//  Created by JustinChou on 16/8/17.
//  Copyright © 2016年 JustinChou. All rights reserved.
//

#import "ViewController.h"
#import "JustinTransformGallery/JustinGalleryView.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *imageNameArray;

@end

@implementation ViewController

#pragma mark - lazy loading
- (NSArray *)imageNameArray {
    if (_imageNameArray == nil) {
        _imageNameArray = [NSArray array];
    }
    return _imageNameArray.mutableCopy;
}

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _imageNameArray = @[@"1001", @"1002", @"1003", @"1004"];
    [self pxy_setCollectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - inner method
- (void)pxy_setCollectionView {
    
    JustinGalleryView *gallery = [[JustinGalleryView alloc] initWithFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 150)];
    gallery.array = _imageNameArray;
    [self.view addSubview:gallery];
}


@end
