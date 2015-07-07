//
//  WJTextField.m
//  XMPP_QQ
//
//  Created by apple on 15/7/7.
//  Copyright (c) 2015年 tqh. All rights reserved.
//

#import "WJTextField.h"

@interface WJTextField () {
    CGRect _rect;
}

@end

@implementation WJTextField

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _rect = frame;
        self.autocapitalizationType = UITextAutocapitalizationTypeNone;
        self.autocorrectionType = UITextAutocorrectionTypeDefault;
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.layer.borderWidth = 1;
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
    }
    return self;
}



@end
