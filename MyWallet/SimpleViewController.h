//
//  SimpleViewController.h
//  MyWallet
//
//  Created by Juan Luis Garcia on 28/7/16.
//  Copyright © 2016 styleapps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;

- (IBAction)displayText:(id)sender;


@end
