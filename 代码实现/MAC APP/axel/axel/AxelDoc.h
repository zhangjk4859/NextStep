//
//  AxelDoc.h
//  axel
//
//  Created by 张俊凯 on 2017/3/13.
//  Copyright © 2017年 张俊凯. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AxelData;
@interface AxelDoc : NSObject
/**<#注释#>*/
@property(nonatomic,strong)AxelData *data;
/**<#注释#>*/
@property(nonatomic,strong)NSImage *thumbImage;
/**<#注释#>*/
@property(nonatomic,strong)NSImage *fullImage;
-(instancetype)initWithTitle:(NSString *)title rating:(float)rating thumbImage:(NSImage *)thumbImage fullImage:(NSImage *)fullImage;
@end
