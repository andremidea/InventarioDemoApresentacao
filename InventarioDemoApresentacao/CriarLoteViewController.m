//
//  CriarLoteViewController.m
//  InventarioDemoApresentacao
//
//  Created by André Midea Jasiskis on 10/02/13.
//  Copyright (c) 2013 André Midea Jasiskis. All rights reserved.
//

#import "CriarLoteViewController.h"
#import "Produto.h"
#import "Lote.h"
#define DOCUMENTS_PATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]


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

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return produtos.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
   static NSString *cellCache = @"CelulaDoProduto";
   UITableViewCell *celula = [self.tabelaProdutos dequeueReusableCellWithIdentifier:cellCache];
    
    if(!celula){
        celula = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellCache]autorelease];
    }
    
    celula.textLabel.text = [[produtos objectAtIndex:indexPath.row] nome];
    
    return celula;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *celula = [tableView cellForRowAtIndexPath:indexPath];
    
    if(celula.accessoryType == UITableViewCellAccessoryCheckmark){
        celula.accessoryType = UITableViewCellAccessoryNone;
    }else{
        celula.accessoryType = UITableViewCellAccessoryCheckmark;
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.nomeLote resignFirstResponder];
    
    return YES;
}

-(void)mostraMensagem:(NSString *)mensagem{
    UIAlertView *alerta = [[[UIAlertView alloc]initWithTitle:@"Cadastrado" message:mensagem delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil]autorelease];
    
    [alerta show];
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
    
    if(!lotes){
        lotes = [[NSMutableArray alloc]init];
    }
    
    Lote *lote = [[Lote alloc]initWithNumero:_nomeLote.text];
    
    for(UITableViewCell *cell in self.tabelaProdutos.visibleCells){
        if(cell.accessoryType == UITableViewCellAccessoryCheckmark){
            NSIndexPath *indexPath = [(UITableView *)cell.superview indexPathForCell: cell];
            Produto *produto = [produtos objectAtIndex:indexPath.row];
            [lote addProduto:produto];
        }
    }
    
    [lotes addObject:lote];
    NSString *mensagem = [NSString stringWithFormat:@"Lote: %@ criado com sucesso", lote.numero];
    [self mostraMensagem:mensagem];
    
    _nomeLote.text = nil;
    [self.tabelaProdutos reloadData];
    [self salvarLoteEmArquivo];
}


-(void)salvarLoteEmArquivo{
    NSMutableArray  *lotesEmDictionary = [[NSMutableArray alloc]init];
    
    for(Lote *l in lotes){
        NSMutableDictionary *lote = [[NSMutableDictionary alloc]initWithObjectsAndKeys:
                                     l.numero,@"numero", nil];
        
        NSMutableArray *produtosDic = [[NSMutableArray alloc]init];
        
        for(Produto *p in l.produtos){
            NSDictionary *produtoDic = [[NSDictionary alloc]initWithObjectsAndKeys:
                                        p.nome,@"nome", nil];
            [produtosDic addObject:produtoDic];
        }
        
        [lote setObject:produtosDic forKey:@"produtos"];
        
        [lotesEmDictionary addObject:lote];
    }
    
    
    // note that myDictionary must only contain values of string,
    // int, bool, array (once again containing only the same types),
    // and other primitive types (I believe NSDates are valid too).
    [lotesEmDictionary writeToFile:[DOCUMENTS_PATH stringByAppendingPathComponent:@"myDict.plist"] atomically:YES];
}

@end
