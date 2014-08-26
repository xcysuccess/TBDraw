//
//  HomeTableViewCell.h
//  TBDraw
//
//  Created by XiangChenyu on 14-8-26.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import "HRCell.h"

@class Animal;
@interface HomeTableViewCell : HRCell

@property(nonatomic,weak) NSString  * imageHeader;
@property(nonatomic,weak) NSString  * title;
@property(nonatomic,weak) NSString  * content;

- (void)bindModel:(Animal *)animal;

@end
