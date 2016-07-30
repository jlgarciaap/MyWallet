//
//  ControllerTest.m
//  MyWallet
//
//  Created by Juan Luis Garcia on 28/7/16.
//  Copyright © 2016 styleapps. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SimpleViewController.h"
#import "WalletTableViewController.h"
#import "Wallet.h"

@interface ControllerTest : XCTestCase
@property (nonatomic,strong) SimpleViewController *simpleVC;
@property (nonatomic,strong) UIButton *button;
@property (nonatomic,strong) UILabel *label;

//tema de TableView
@property (nonatomic,strong) WalletTableViewController *walletTvC;
@property (nonatomic,strong) Wallet *wallet;
@property (nonatomic,strong) Broker *broker;

@end

@implementation ControllerTest

- (void)setUp {
    [super setUp];
    
    //creamos el entorno
    self.simpleVC = [[SimpleViewController alloc] initWithNibName:nil bundle:nil];
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setTitle:@"Hola" forState:UIControlStateNormal];
    
    self.label = [[UILabel alloc]initWithFrame:CGRectZero];
    
    //El displayLabel lo creamos nosotros en el controller
    self.simpleVC.displayLabel = self.label;
    
    //Para la tabla
    
    self.wallet = [[Wallet alloc] initWithAmount:1 currency:@"USD" broker: self.broker];
    [self.wallet plus:[Money euroWithAmount:1]];
     self.walletTvC = [[WalletTableViewController alloc] initWithModel: self.wallet];
    
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    //Lo borramos
    
    self.simpleVC = nil;
    self.button = nil;
    self.label= nil;
    
}

-(void)testThatTextoOnLabelIsEqualThatTestOnButton{
    
    //Mandamos el mensaje
    //el displayText lo creamos nosotros en el controller
    [self.simpleVC displayText:self.button];
    
    
    //Comprobamos que el texto y el label tienen el mismo contenido
    
    XCTAssertEqualObjects(self.button.titleLabel.text, self.label.text, @"Button and label should have the same text");
    
}

/* Tests de Practica */

-(void) testThatTablehasOneSectionPlusTotal{
    
    //ponemos nil ya que solo nos interesa saber si tiene una seccion  no en temas de tabla
    NSInteger sections = [self.walletTvC numberOfSectionsInTableView:nil];
    
    XCTAssertEqual(sections, [self.wallet currenciesCount]+1, @"There can only be one!");
    
}

-(void) testThatNumberOfCellsIsNumberOfMoneysForSectionPlusOne{
    
    
    XCTAssertEqual(self.wallet.count + 1, [self.walletTvC tableView:nil numberOfRowsInSection:0],@"Number of cells is the number of moneys plus 1(total)");
    
   
}









































@end
