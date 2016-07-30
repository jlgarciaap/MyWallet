//
//  WalletTableViewController.h
//  MyWallet
//
//  Created by Juan Luis Garcia on 28/7/16.
//  Copyright © 2016 styleapps. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Wallet;


@interface WalletTableViewController : UITableViewController
-(id) initWithModel: (Wallet *) model;

@end
