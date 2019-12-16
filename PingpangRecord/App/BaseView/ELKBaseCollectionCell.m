//
//  ELKBaseCollectionCell.m
//  EBoSports
//
//  Created by Awin on 2019/10/7.
//  Copyright © 2019年 zidingyi. All rights reserved.
//

#import "ELKBaseCollectionCell.h"

@implementation ELKBaseCollectionCell
-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        [self loadViews];
        [self layoutViews];
        self.backgroundColor=[UIColor whiteColor];
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
