//
//  CriarLoteViewController.h
//  InventarioDemoApresentacao
//
//  Created by André Midea Jasiskis on 10/02/13.
//  Copyright (c) 2013 André Midea Jasiskis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CriarLoteViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
- (IBAction)criarLote:(id)sender;
@property (retain, nonatomic) IBOutlet UITextField *nomeLote;
@property (retain, nonatomic) IBOutlet UITableView *tabelaProdutos;
@property (retain, nonatomic) NSMutableArray *produtos;
@property (retain, nonatomic) NSMutableArray *lotes;

@end
