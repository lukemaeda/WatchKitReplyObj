//
//  InterfaceController.m
//  WatchKitReplyObj WatchKit Extension
//
//  Created by MAEDAHAJIME on 2015/04/26.
//  Copyright (c) 2015年 MAEDAHAJIME. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *replayLabel;

@end

@implementation InterfaceController

// 最初に呼び出されるメソッド
- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    [self.replayLabel setHidden:YES];
    // Configure interface objects here.
}

// ユーザーにUIが表示されたタイミングで呼び出されるメソッド
- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

// UIが非表示になったタイミングで呼び出されるメソッド
- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

// 返信ボタンアクション
- (IBAction)replay
{
    NSMutableDictionary *infoDic = [[NSMutableDictionary alloc] init];
    [infoDic setValue:@"おかけさまで元気です！" forKey:@"content"];
    [WKInterfaceController openParentApplication:infoDic reply:^(NSDictionary *replyInfo, NSError *error) {
        
        // replay：返信
        NSLog(@"----->%@",replyInfo);
        
        if ([[replyInfo objectForKey:@"response"] isEqualToString:@"success"])
        {
            // replay：返信ラベル表示
            [self.replayLabel setHidden:NO];
            [self.replayLabel setText:[infoDic objectForKey:@"content"]];
        }
    }];
    
}

@end



