//
//  JJFlodCellModel.m
//  JJTableFoldCell
//
//  Created by 吉祥 on 2017/10/17.
//  Copyright © 2017年 jixiang. All rights reserved.
//

#import "JJFlodCellModel.h"

@implementation JJFlodCellModel
+ (instancetype)modelWithDic:(NSDictionary *)dic {
    JJFlodCellModel *foldCellModel = [JJFlodCellModel new];
    foldCellModel.text = dic[@"text"];
    foldCellModel.level = dic[@"level"];
    foldCellModel.belowCount = 0;
    
    foldCellModel.submodels = [NSMutableArray new];
    NSArray *submodels = dic[@"submodels"];
    for (int i = 0; i < submodels.count; i++) {
        JJFlodCellModel *submodel = [JJFlodCellModel modelWithDic:(NSDictionary *)submodels[i]];
        submodel.supermodel = foldCellModel;
        [foldCellModel.submodels addObject:submodel];
    }
    
    return foldCellModel;
}

- (NSArray *)open {
    NSArray *submodels = self.submodels;
    self.submodels = nil;
    self.belowCount = submodels.count;
    return submodels;
}

- (void)closeWithSubmodels:(NSArray *)submodels {
    self.submodels = [NSMutableArray arrayWithArray:submodels];
    self.belowCount = 0;
}

- (void)setBelowCount:(NSUInteger)belowCount {
    self.supermodel.belowCount += (belowCount - _belowCount);
    _belowCount = belowCount;
}

@end
