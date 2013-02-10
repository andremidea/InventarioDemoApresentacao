//
//  SelecaoViewController.m
//  InventarioDemoApresentacao
//
//  Created by André Midea Jasiskis on 10/02/13.
//  Copyright (c) 2013 André Midea Jasiskis. All rights reserved.
//

#import "SelecaoViewController.h"
#import "Lote.h"
#import "InventariarViewController.h"
#define DOCUMENTS_PATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

@interface SelecaoViewController ()

@end

@implementation SelecaoViewController
@synthesize lotes,tabelaLotes;

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
    [self carregarLotes];
}

-(void)carregarLotes{
    NSString *finalPath = [DOCUMENTS_PATH stringByAppendingPathComponent:
                           [NSString stringWithFormat: @"%@.plist", @"myDict"]];
    NSArray *pl = [NSArray arrayWithContentsOfFile:finalPath];
    if(!lotes) {
        lotes = [[NSMutableArray alloc]init];
    }
    for(NSDictionary *item in pl){
        NSString *numero = [item objectForKey:@"numero"];
        NSArray *produtoA =[item objectForKey:@"produtos"];
        Lote *lote = [[Lote alloc]initWithNumero:numero];
        for (NSDictionary *p in produtoA) {
            Produto *prod = [[Produto alloc]initWithNome:[p objectForKey:@"nome"] eQuantidade:0];
            
            if(!lote.produtos){
                lote.produtos = [[NSMutableArray alloc]init];
            }
            [lote.produtos addObject:prod];
        }
        
        [self.lotes addObject:lote];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return lotes.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CelulaLoteCache = @"CelulaLoteIDCache";
    UITableViewCell *celula = [self.tabelaLotes dequeueReusableCellWithIdentifier:CelulaLoteCache];
    
    if(!celula){
        celula = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CelulaLoteCache]autorelease];
    }
    celula.accessoryType = UITableViewCellAccessoryNone;
    Lote *lote = [lotes objectAtIndex:indexPath.row];
    celula.textLabel.text = lote.numero;
    
    return celula;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Lote *lote = [lotes objectAtIndex:indexPath.row];
    
    InventariarViewController *inv = (InventariarViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"Inventariar"];
    inv.lote = lote;
    
    [self presentViewController:inv animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [tabelaLotes release];
    [super dealloc];
}
@end
