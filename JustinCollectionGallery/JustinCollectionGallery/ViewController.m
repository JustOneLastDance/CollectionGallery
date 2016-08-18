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
    
    JustinGalleryView *gallery = [[JustinGalleryView alloc] initWithFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 150)];
    [self.view addSubview:gallery];
}


@end
