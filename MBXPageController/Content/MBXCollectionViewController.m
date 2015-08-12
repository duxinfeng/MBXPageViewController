//
//  MBXCollectionViewController.m
//  MBXPageController
//
//  Created by Nico Arqueros on 1/15/15.
//  Copyright (c) 2015 Moblox. All rights reserved.
//

#import "MBXCollectionViewController.h"
static NSString *const identifier = @"collection";

static CGFloat kLeftX = 10;
static CGFloat kLeftY = 10;

static CGFloat kAvatarWH = 100;
static CGFloat kPadding = 10;
static CGFloat kNameLabelH = 30;

@interface MBXCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *collectionView;
@end

@implementation MBXCollectionViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        kAvatarWH = (self.view.bounds.size.width-kPadding*2-2*kLeftX)/3;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UICollectionViewFlowLayout *flowLayout= [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(kAvatarWH, kAvatarWH);
    flowLayout.sectionInset = UIEdgeInsetsMake(kLeftY, kLeftX, kPadding, kPadding);
    flowLayout.minimumLineSpacing = 0;//最小行间距
    flowLayout.minimumInteritemSpacing = 0;//最小列间距
    
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.bounds.size.height) collectionViewLayout:flowLayout];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:identifier];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 14;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];

    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(0, 0, kAvatarWH, kAvatarWH);

    imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"photo_%li", indexPath.row+1]];
    [cell addSubview:imageView];

    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(kAvatarWH, kAvatarWH);
}

@end
