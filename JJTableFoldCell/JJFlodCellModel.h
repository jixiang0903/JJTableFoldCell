//
//  JJFlodCellModel.h
//  JJTableFoldCell
//
//  Created by 吉祥 on 2017/10/17.
//  Copyright © 2017年 jixiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JJFlodCellModel : NSObject

@property(nonatomic,copy) NSString * _Nullable text;
@property(nonatomic,copy) NSString * _Nonnull level;
//...

@property(nonatomic,assign) NSUInteger belowCount;
@property(nullable,nonatomic) JJFlodCellModel *supermodel;
@property(nonatomic,strong) NSMutableArray<__kindof JJFlodCellModel *> * _Nullable submodels;

+ (instancetype _Nonnull )modelWithDic:(NSDictionary *_Nullable)dic;
- (NSArray *_Nonnull)open;
- (void)closeWithSubmodels:(NSArray *_Nullable)submodels;

@end
