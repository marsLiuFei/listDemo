//
//  MyAdapter.m
//  errand
//
//  Created by gravel on 15/12/9.
//  Copyright © 2015年 weishi. All rights reserved.
//

#import "MyAdapter.h"

@implementation MyAdapter
+(float)aDapter:(float)old{
    return SCREEN_WIDTH>375?old*1.2:old;
}

+(float)laDapter:(float)old{
     return SCREEN_WIDTH<375?old/1.2:old;
}

+(float)laDapter360:(float)old{
    return [self laDapter:old*1.15];
}

+(UIFont*)fontADapter:(float)old{
    return [UIFont  systemFontOfSize:SCREEN_WIDTH>375?old*1.2:old];
}
+(float)fontDapter:(float)old{
     return SCREEN_WIDTH>375?old*1.2:old;
}

+(UIFont*)lfontADapter:(float)old{
     return [UIFont  systemFontOfSize:SCREEN_WIDTH<375?old/1.2:old];
}

+(UIFont*)lfontADapter360:(float)old{
    return [self lfontADapter:old*1.15];
}
@end
