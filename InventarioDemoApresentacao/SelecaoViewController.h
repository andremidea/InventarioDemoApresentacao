//
//  SelecaoViewController.h
//  InventarioDemoApresentacao
//
//  Created by André Midea Jasiskis on 10/02/13.
//  Copyright (c) 2013 André Midea Jasiskis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelecaoViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (retain, nonatomic) IBOutlet UITableView *tabelaLotes;
@property (retain, nonatomic) NSMutableArray *lotes;


@end
