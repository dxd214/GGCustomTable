//
//  GGTableView.h
//  GGTableView
//
//  Created by __无邪_ on 15/10/11.
//  Copyright © 2015年 __无邪_. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TableViewCellConfigurate)(id cell, id entity, NSIndexPath *indexPath);
@protocol GGTableViewDelegate;


@interface GGTableView : UIView

- (instancetype)initWithFrame:(CGRect)frame cell:(Class)cellClass identifier:(NSString *)identifier configureBlock:(TableViewCellConfigurate)cellConfigureBlock;


/** 数据源 */
@property (nonatomic, strong) NSArray *dataSource;
/** 代理 */
@property (nonatomic, assign) id<GGTableViewDelegate>delegate;
/** 正在刷新的回调 */
@property (copy, nonatomic) void (^headerRefreshingBlock)(GGTableView *tableView);
@property (copy, nonatomic) void (^footerRefreshingBlock)(GGTableView *tableView);


- (void)reloadData;

- (void)addHeaderRefresh;
- (void)addFooterRefresh;
- (void)removeHeaderRefresh;
- (void)removeFooterRefresh;
- (void)endHeaderRefreshing;
- (void)endFooterRefreshing;


@end


@protocol GGTableViewDelegate <NSObject>
@optional
- (void)tableView:(GGTableView *)tableView didSelectedRowAtIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)tableView:(GGTableView *)tableView cellHeightAtIndexPath:(NSIndexPath *)indexPath;
- (void)tableView:(GGTableView *)tableView deleteRowAtIndexPath:(NSIndexPath *)indexPath;
- (BOOL)isCellEditableTableView:(GGTableView *)tableView;
@end

