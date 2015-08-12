//
//  MBXSegmentControllerExampleViewController.m
//  MBXSegmentPageViewController
//
//  Created by Nico Arqueros on 12/21/14.
//  Copyright (c) 2014 Moblox. All rights reserved.
//

#import "MBXSegmentControllerExampleViewController.h"
#import "MBXPageViewController.h"
#import "MBXTableViewController.h"
#import "MBXCollectionViewController.h"

@interface MBXSegmentControllerExampleViewController () <MBXPageControllerDataSource, MBXPageControllerDataDelegate>
@property (strong, nonatomic) UISegmentedControl *segmentController;
@property (strong, nonatomic) UIView *containerView;
@property (strong, nonatomic) MBXPageViewController* MBXPageController;

@end

@implementation MBXSegmentControllerExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Initiate MBXPageController
    self.MBXPageController = [[MBXPageViewController alloc] init];
    self.MBXPageController.MBXDataSource = self;
    self.MBXPageController.MBXDataDelegate = self;
    self.MBXPageController.pageMode = MBX_SegmentController;
    [self.MBXPageController reloadPages];
}


#pragma mark - MBXPageViewController Data Source

- (NSArray *)MBXPageButtons
{
    if (!_segmentController) {
        _segmentController = [[UISegmentedControl alloc]initWithItems:@[@"Table",@"Collection",@"View"]];
        _segmentController.frame = CGRectMake(10, 64+10, self.view.bounds.size.width-20, 40);
        _segmentController.tintColor = [UIColor purpleColor];
        _segmentController.selectedSegmentIndex = 0;
        [self.view addSubview:_segmentController];
    }
    return @[_segmentController];
}

- (UIView *)MBXPageContainer
{
    if (!_containerView) {
        _containerView = [[UIView alloc] init];
        _containerView.backgroundColor = [UIColor whiteColor];
        _containerView.frame = CGRectMake(0, 64+10+40+10, self.view.bounds.size.width, self.view.bounds.size.height-64+10+40+10);
        [self.view addSubview:_containerView];
    }
    return _containerView;
}


- (NSArray *)MBXPageControllers
{
    MBXTableViewController *tabViewController = [[MBXTableViewController alloc] init];
    MBXCollectionViewController *collectionViewController = [[MBXCollectionViewController alloc] init];;
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.view.backgroundColor = [UIColor orangeColor];
    return @[tabViewController,collectionViewController, viewController];
}



#pragma mark - MBXPageViewController Delegate

- (void)MBXPageChangedToIndex:(NSInteger)index
{
    NSLog(@"%@ %ld", [self class], (long)index);
}

@end
