//
//  ViewController.m
//  WatchKitReplyObj
//
//  Created by MAEDAHAJIME on 2015/04/26.
//  Copyright (c) 2015年 MAEDAHAJIME. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *showLable;
@property (nonatomic,retain) UILabel *myLabel;
@end

@implementation ViewController

// 最初に呼び出されるメソッド
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //【通知の受取側 - 受取の登録】
    // 通知 デフォルトの通知センターを取得する
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    // 通知センターに通知要求を登録する
    // この例だと、通知センターに"setchangeText"という名前の通知がされた時に、
    // setMyLabelText:メソッドを呼び出すという通知要求の登録を行っている。
    [nc addObserver:self selector:@selector(setMyLabelText:) name:@"changeText" object:nil];
}

// showLable.textに表示
- (void)setMyLabelText:(NSNotification *)labelStr{
    
    NSDictionary *dic = [labelStr userInfo];
    self.showLable.text = [dic objectForKey:@"content" ];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
