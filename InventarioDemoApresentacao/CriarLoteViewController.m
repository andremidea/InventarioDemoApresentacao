//
//  CriarLoteViewController.m
//  InventarioDemoApresentacao
//
//  Created by André Midea Jasiskis on 10/02/13.
//  Copyright (c) 2013 André Midea Jasiskis. All rights reserved.
//

#import "CriarLoteViewController.h"
#import "Produto.h"

@interface CriarLoteViewController ()

@end

@implementation CriarLoteViewController
@synthesize produtos,lotes;

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
    [self carregarProdutos];
}

-(void)carregarProdutos{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"produtos" ofType:@"plist"];
    NSDictionary *pl = [NSDictionary dictionaryWithContentsOfFile:path];
    NSArray *dados = [pl objectForKey:@"produtos"];
    
    produtos = [[NSMutableArray alloc]init];
    for(NSDictionary *item in dados){
        
        NSString *nome = [item objectForKey:@"nome"];
        
        Produto *p = [[Produto alloc]initWithNome:nome eQuantidade:0];
        [produtos addObject:p];
        
        [p release];
    };
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_tabelaProdutos release];
    [_nomeLote release];
    [super dealloc];
}
- (IBAction)criarLote:(id)sender {
}
@end
