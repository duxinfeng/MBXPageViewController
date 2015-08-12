//
//  MBXTableViewController.m
//  MBXPageController
//
//  Created by Nico Arqueros on 1/15/15.
//  Copyright (c) 2015 Moblox. All rights reserved.
//

#import "MBXTableViewController.h"

@interface MBXTableViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic)  UITableView *tableView;
@end

@implementation MBXTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, self.view.bounds.size.width, self.view.bounds.size.height ) style:UITableViewStylePlain];
    self.tableView.backgroundColor = self.view.backgroundColor;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}


#pragma mark - UITableView Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%zd XXXXXXXXX",indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    return 98;
}


@end
