//
//  BaseModel.m
//  EMS
//
//  Created by 上海梓钦 on 2017/7/25.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"msg":@"msg",
             @"code":@"code"
             
    };
}

- (void)nslogPropertyWithDic:(id)obj {
    
#if DEBUG
    
    NSDictionary *dic = [NSDictionary new];
    
    if ([obj isKindOfClass:[NSDictionary class]]) {
        NSDictionary *tempDic = [(NSDictionary *)obj mutableCopy];
        dic = tempDic;
    } else if ([obj isKindOfClass:[NSArray class]]) {
        NSArray *tempArr = [(NSArray *)obj mutableCopy];
        if (tempArr.count > 0) {
            dic = tempArr[0];
        } else {
            NSLog(@"无法解析为model属性，因为数组为空");
            return;
        }
    } else {
        NSLog(@"无法解析为model属性，因为并非数组或字典");
        return;
    }
    
    if (dic.count == 0) {
        NSLog(@"无法解析为model属性，因为该字典为空");
        return;
    }
    
    
    NSMutableString *strM = [NSMutableString string];
    [dic enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        
        NSString *className = NSStringFromClass([obj class]) ;
        NSLog(@"className:%@/n", className);
        if ([className isEqualToString:@"__NSCFString"] | [className isEqualToString:@"__NSCFConstantString"] | [className isEqualToString:@"NSTaggedPointerString"]) {
            [strM appendFormat:@"@property (nonatomic, copy) NSString *%@;\n",key];
        }else if ([className isEqualToString:@"__NSCFArray"] |
                  [className isEqualToString:@"__NSArray0"] |
                  [className isEqualToString:@"__NSArrayI"]){
            [strM appendFormat:@"@property (nonatomic, strong) NSArray *%@;\n",key];
        }else if ([className isEqualToString:@"__NSCFDictionary"]){
            [strM appendFormat:@"@property (nonatomic, strong) NSDictionary *%@;\n",key];
        }else if ([className isEqualToString:@"__NSCFNumber"]){
            [strM appendFormat:@"@property (nonatomic, copy) NSNumber *%@;\n",key];
        }else if ([className isEqualToString:@"__NSCFBoolean"]){
            [strM appendFormat:@"@property (nonatomic, assign) BOOL   %@;\n",key];
        }else if ([className isEqualToString:@"NSDecimalNumber"]){
            [strM appendFormat:@"@property (nonatomic, copy) NSString *%@;\n",[NSString stringWithFormat:@"%@",key]];
        }
        else if ([className isEqualToString:@"NSNull"]){
            [strM appendFormat:@"@property (nonatomic, copy) NSString *%@;\n",[NSString stringWithFormat:@"%@",key]];
        }else if ([className isEqualToString:@"__NSArrayM"]){
            [strM appendFormat:@"@property (nonatomic, strong) NSMutableArray *%@;\n",[NSString stringWithFormat:@"%@",key]];
        }
        
    }];
    NSLog(@"\n%@\n",strM);
    
#endif
    
}




@end
