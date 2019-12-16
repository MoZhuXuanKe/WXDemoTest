//
//  ELKBaseView.m
//  StarDreamiOS
//
//  Created by wx on 2019/8/13.
//  Copyright © 2019 elk. All rights reserved.
//

#import "ELKBaseView.h"

@implementation ELKBaseView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadViews];
        [self layoutViews];
        [self configSubview];
    }
    return self;
}

- (id)init {
    return [self initWithFrame:CGRectZero];
}

- (void)updateConstraints
{
    [self layoutViews];
    [super updateConstraints];
}

- (void)loadViews{ }

- (void)layoutViews{ }


- (void)configSubview
{
    
}


@end
