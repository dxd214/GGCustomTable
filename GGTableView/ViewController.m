//
//  ViewController.m
//  GGTableView
//
//  Created by __无邪_ on 15/10/11.
//  Copyright © 2015年 __无邪_. All rights reserved.
//

#import "ViewController.h"
#import "GGTableView.h"
#import "GGTableViewCell.h"

@interface ViewController ()<GGTableViewDelegate>
@property (nonatomic, strong)GGTableView *tableView;
@end

@implementation ViewController

#pragma mark - life circle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.tableView = [[GGTableView alloc] initWithFrame:self.view.bounds cell:[GGTableViewCell class] identifier:@"cellIdentifier" configureBlock:^(GGTableViewCell *cell, id entity, NSIndexPath *indexPath) {
        
        [cell configureCellWithName:entity];
        
        if (indexPath.row > 10) {
            [cell setBackgroundColor:[UIColor greenColor]];
        }else{
            [cell setBackgroundColor:[UIColor redColor]];
        }
        
        
    }];
    [self.tableView setDelegate:self];
    
    self.tableView.dataSource = @[@"adf",@"fdsafasd"];
    [self.tableView addHeaderRefresh];
    [self.tableView addFooterRefresh];
    
    [self.view addSubview:self.tableView];
    
    
    __weak __typeof(&*self)fuckSelf = self;
    [self.tableView setHeaderRefreshingBlock:^(GGTableView *tableView) {
        NSLog(@"---");
        [fuckSelf performSelector:@selector(endHeaderRefreshing) withObject:fuckSelf afterDelay:2];
    }];
    [self.tableView setFooterRefreshingBlock:^(GGTableView *tableView) {
        NSLog(@"===");
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - delegate

- (void)tableView:(GGTableView *)tableView didSelectedRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"selected row : %ld",indexPath.row);
}

//- (CGFloat)tableView:(GGTableView *)tableView cellHeightAtIndexPath:(NSIndexPath *)indexPath{
//    return 44.0;
//}
//
//- (BOOL)isCellEditableTableView:(GGTableView *)tableView{
//    return NO;
//}
//
//- (void)tableView:(GGTableView *)tableView deleteRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"sss");
//    
//    NSMutableArray *datas = [[NSMutableArray alloc] initWithArray:self.tableView.dataSource];
//    [datas removeObjectAtIndex:indexPath.row];
//    self.tableView.dataSource = datas;
//    
//}

#pragma mark - action

- (void)endHeaderRefreshing{
    [self.tableView endHeaderRefreshing];
}

- (IBAction)changeAction:(id)sender {
    
    
    NSMutableArray *datas = [[NSMutableArray alloc] init];
    for (int i = 0; i < 100; i++) {
        [datas addObject:[NSString stringWithFormat:@"%d",i]];
    }
    self.tableView.dataSource = datas;
}

@end
