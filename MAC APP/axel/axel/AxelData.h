//
//  AxelData.h
//  axel
//
//  Created by 张俊凯 on 2017/3/13.
//  Copyright © 2017年 张俊凯. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AxelData : NSObject
/**<#注释#>*/
@property(nonatomic,strong)NSString *title;
/**
 *  <#注释#>
 */
@property(nonatomic,assign)float rating;
-(instancetype)initWithTitle:(NSString *)title rating:(float)rating;
@end
