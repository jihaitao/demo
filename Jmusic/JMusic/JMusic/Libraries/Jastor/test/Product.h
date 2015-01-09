//
//  Product.h
//  JMusic
//
//  Created by 陆 海涛 on 15/1/9.
//  Copyright (c) 2015年 jihaitao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Jastor.h"
#import "ProductCategory.h"

@interface Product : Jastor
@property (nonatomic, copy) NSString *name;
@property (nonatomic,retain) NSArray *categories;
@end
