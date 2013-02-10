//
//  InventariarViewController.m
//  InventarioDemoApresentacao
//
//  Created by André Midea Jasiskis on 10/02/13.
//  Copyright (c) 2013 André Midea Jasiskis. All rights reserved.
//

#import "InventariarViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface InventariarViewController ()

@end

@implementation InventariarViewController
@synthesize lote;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return lote.produtos.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CelulaProdutoCache = @"CelulaLoteIDCache";
    UITableViewCell *celula = [self.tabelaQtdeProd dequeueReusableCellWithIdentifier:CelulaProdutoCache];
    
    if(!celula){
        celula = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CelulaProdutoCache]autorelease];
    }
    celula.accessoryType = UITableViewCellAccessoryNone;
    Produto *produto = [lote.produtos objectAtIndex:indexPath.row];
    celula.textLabel.text = produto.nome;
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 5, 150, 33)];
    label.text =@"Qtde:";
    
    UITextField *text = [[UITextField alloc]initWithFrame:CGRectMake(150, 5, 150, 33)];
    [text.layer setBackgroundColor: [[UIColor whiteColor] CGColor]];
    [text.layer setBorderColor: [[UIColor grayColor] CGColor]];
    [text.layer setBorderWidth: 1.0];
    [text.layer setCornerRadius:8.0f];
    [text.layer setMasksToBounds:YES];
    text.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    text.textAlignment = NSTextAlignmentCenter;
    text.tag=indexPath.row+1;
    
    [celula.contentView addSubview:label];
    [celula.contentView addSubview:text];
    
    return celula;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_tabelaQtdeProd release];
    [super dealloc];
}
@end
