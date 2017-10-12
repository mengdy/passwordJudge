//
//  ViewController.m
//  PassWordDemo
//
//  Created by mengdy on 17/10/11.
//  Copyright © 2017年 mengdy. All rights reserved.
//

#import "ViewController.h"
#import "DYHelper.h"
#import "UIView+Toast.h"

/** 屏幕高度 */
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
/** 屏幕宽度 */
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
/** 高度比例 */
#define kScreen_H_Scale (kScreenHeight*1.0/667)
/** 宽度比例 */
#define kScreen_W_Scale (kScreenWidth/375)
/**  rgb颜色*/
#define UIColorFromRGBA(rgbValue,al) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:al]


@interface ViewController ()<UITextFieldDelegate>

@property (nonatomic,strong)UITextField *password;
@property (nonatomic,strong)UIButton    *finishBtn;
@property (nonatomic,strong)UILabel     *nameLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.password];
    [self.view addSubview:self.finishBtn];
 

}

-(UILabel *)nameLabel{

    if (!_nameLabel) {
        
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60*kScreen_W_Scale, 49*kScreen_H_Scale)];
        _nameLabel.text = @"  密码";
        _nameLabel.textColor = UIColorFromRGBA(0x1e82d2,1);
        _nameLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:15.0];
        CALayer *nameBorder = [CALayer layer];
        nameBorder.frame = CGRectMake(60*kScreen_W_Scale*7/8, 49*kScreen_H_Scale/4, 1, 49*kScreen_H_Scale/2);
        nameBorder.backgroundColor = UIColorFromRGBA(0xd1d2d3,1).CGColor;
        [_nameLabel.layer addSublayer:nameBorder];
    }
    return _nameLabel;
}



-(UITextField *)password{

    if (!_password) {
        
        _password = [[UITextField alloc]initWithFrame:CGRectMake(10*kScreen_W_Scale, 100*kScreen_H_Scale, kScreenWidth-20*kScreen_W_Scale, 49*kScreen_H_Scale)];
        _password.layer.borderColor = UIColorFromRGBA(0xd1d2d3,1).CGColor;
        _password.layer.borderWidth = 1;
        _password.delegate = self;
        
        _password.leftViewMode = UITextFieldViewModeAlways;
        _password.leftView = self.nameLabel;
        _password.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        _password.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        _password.placeholder = @"密码长度6~20位，支持数字,字母,特殊字符";
        [_password setValue:UIColorFromRGBA(0xd1d2d3,1) forKeyPath:@"_placeholderLabel.textColor"];
        [_password setValue:[UIFont systemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];

    }


    return _password;
}

-(UIButton *)finishBtn{

    if (!_finishBtn) {
        
        _finishBtn = [[UIButton alloc]initWithFrame:CGRectMake(15*kScreen_W_Scale, 180*kScreen_H_Scale, kScreenWidth-30*kScreen_W_Scale, 40*kScreen_H_Scale)];
        [_finishBtn setTitle:@"完成" forState:UIControlStateNormal];
        [_finishBtn setBackgroundColor:UIColorFromRGBA(0xd1d2d3,1)];
        [_finishBtn setEnabled:NO];
        [_finishBtn addTarget:self action:@selector(passwordFinishClick) forControlEvents:UIControlEventTouchUpInside];
        
    }

    return _finishBtn;
}

-(void)passwordFinishClick{

    [self.password resignFirstResponder];
   
    if ([DYHelper isHaveAllChar:self.password.text]) {
        
        [self.view makeToast:@"密码不能全为字母" duration:1.0 position:CSToastPositionCenter];
        return;
    }
    if ([DYHelper isHaveAllNumber:self.password.text]) {
        
        [self.view makeToast:@"密码不能全为数字" duration:1.0 position:CSToastPositionCenter];
        return;
    }
    
    if ([DYHelper isHaveIllegalChar:self.password.text]) {
        
        [self.view makeToast:@"密码不能全为特殊字符" duration:1.0 position:CSToastPositionCenter];
        return;
    }
    NSLog(@"完成");
}



-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{

    if (textField.text.length>19 && range.location>19) {
        
        return NO;
    }
    
    if (textField.text.length>=5 && range.location>=5 && textField.text.length == range.location) {
        
       self.finishBtn.backgroundColor = UIColorFromRGBA(0xec403c,1);
        [self.finishBtn setEnabled:YES];
    }else{
    
        self.finishBtn.backgroundColor = UIColorFromRGBA(0xd1d2d3,1);
        [self.finishBtn setEnabled:NO];
    }
    
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{

    return [textField resignFirstResponder];
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
