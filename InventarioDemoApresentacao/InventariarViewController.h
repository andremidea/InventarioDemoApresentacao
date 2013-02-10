//
//  InventariarViewController.h
//  InventarioDemoApresentacao
//
//  Created by André Midea Jasiskis on 10/02/13.
//  Copyright (c) 2013 André Midea Jasiskis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Lote.h"

@interface InventariarViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
@property (retain, nonatomic) IBOutlet UITableView *tabelaQtdeProd;
@property (retain,nonatomic) Lote *lote;
@end
