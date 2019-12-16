//
//  ELKBaseTableViewCell.m
//  EBoSports
//
//  Created by Awin on 2019/10/6.
//  Copyright © 2019年 zidingyi. All rights reserved.
//

#import "ELKBaseTableViewCell.h"

@implementation ELKBaseTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self loadViews];
        [self layoutViews];
    }
    return self;
}

- (void)updateConstraints
{
    [self layoutViews];
    [super updateConstraints];
}

- (void)loadViews
{
    
}
- (void)layoutViews{
    
    
}
- (void)loadDataWithModel:(id)model withIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
