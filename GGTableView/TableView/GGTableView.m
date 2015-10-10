//
//  GGTableView.m
//  GGTableView
//
//  Created by __无邪_ on 15/10/11.
//  Copyright © 2015年 __无邪_. All rights reserved.
//

#import "GGTableView.h"
#import "MJRefresh.h"
#import "GGBaseView.h"

@interface GGTableView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)GGBaseView *tableView;
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, copy) TableViewCellConfigurate cellConfigureBlock;
//@property (nonatomic, assign) Class cellClass;
@end

@implementation GGTableView
#pragma mark - lifeCircle
- (instancetype)initWithFrame:(CGRect)frame cell:(Class)cellClass identifier:(NSString *)identifier configureBlock:(TableViewCellConfigurate)cellConfigureBlock{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.cellIdentifier = identifier;
        self.cellConfigureBlock = [cellConfigureBlock copy];
        //self.cellClass = cellClass;
        
        self.tableView = [[GGBaseView alloc] initWithFrame:self.bounds];
        [self.tableView registerClass:cellClass forCellReuseIdentifier:identifier];
        [self addSubview:self.tableView];
        
        [self.tableView setDelegate:self];
        [self.tableView setDataSource:self];
        
        
        self.tableView.tableFooterView = [[UIView alloc] init];
        
        
    }
    return self;
}

#pragma mark - setter

-(void)setDataSource:(NSArray *)dataSource{
    _dataSource = dataSource;
    if (dataSource.count > 0) {
        [self.tableView.defaultView setHidden:YES];
    }else{
        [self.tableView.defaultView setHidden:NO];
    }
    
    [self reloadData];
    
}




#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [[self tableView:tableView cellForRowAtIndexPath:indexPath] frame].size.height;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_delegate && [_delegate respondsToSelector:@selector(tableView:didSelectedRowAtIndexPath:)]) {
        [_delegate tableView:self didSelectedRowAtIndexPath:indexPath];
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    //    if (cell == nil) {
    //        cell = [[self.cellClass alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:self.cellIdentifier];
    //    }
    id item = self.dataSource[(NSUInteger)indexPath.row];
    self.cellConfigureBlock(cell,item,indexPath);
    return cell;
}

#pragma mark - public methods

- (void)reloadData{
    [self.tableView reloadData];
}

- (void)addHeaderRefresh{
    if (!self.tableView.header) {
        [self.tableView addLegendHeader];
    }
    
    self.tableView.header.refreshingBlock = ^{
        if (self.headerRefreshingBlock) {
            self.headerRefreshingBlock();
        }
    };
}

- (void)addFooterRefresh{
    if (!self.tableView.footer) {
        [self.tableView addLegendFooter];
    }
    
    self.tableView.footer.refreshingBlock = ^{
        if (self.footerRefreshingBlock) {
            self.footerRefreshingBlock();
        }
    };
}

- (void)removeHeaderRefresh{
    if (self.tableView.header) {
        [self.tableView removeHeader];
    }
}

- (void)removeFooterRefresh{
    if (self.tableView.footer) {
        [self.tableView removeFooter];
    }
}

- (void)endHeaderRefreshing{
    if (self.tableView.header.isRefreshing) {
        [self.tableView.header endRefreshing];
    }
}

- (void)endFooterRefreshing{
    if (self.tableView.footer.isRefreshing) {
        [self.tableView.footer endRefreshing];
    }
}


@end
