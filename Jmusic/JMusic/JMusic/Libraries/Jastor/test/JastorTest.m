//
//  JastorTest.m
//  JMusic
//
//  Created by 陆 海涛 on 15/1/9.
//  Copyright (c) 2015年 jihaitao. All rights reserved.
//

#import "JastorTest.h"
#import "JSONKit.h"
#import "Product.h"
@implementation JastorTest

+(void)parseProductUsingJastor{
    
    NSString *json = @"{\"name\": \"Foo\",\"categories\": [{ \"name\": \"Bar Category 1\" },{ \"name\": \"Bar Category 2\" },{ \"name\": \"Bar Category 3\" }]}";
    NSDictionary* dic = [json objectFromJSONString];
    Product *product = [[Product alloc] initWithDictionary:dic];
    NSLog(@"%@",product.name);
    NSLog(@"%d",[product.categories count]);
}

@end
