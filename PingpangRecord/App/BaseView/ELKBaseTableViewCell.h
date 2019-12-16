//
//  ELKBaseTableViewCell.h
//  EBoSports
//
//  Created by Awin on 2019/10/6.
//  Copyright © 2019年 zidingyi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ELKBaseTableViewCell : UITableViewCell
@property(nonatomic,strong)NSIndexPath *indexp;
- (void)loadViews;
- (void)layoutViews;
- (void)loadDataWithModel:(id)model withIndexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
