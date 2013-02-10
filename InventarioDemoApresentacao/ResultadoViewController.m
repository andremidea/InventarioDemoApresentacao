//
//  ResultadoViewController.m
//  InventarioDemoApresentacao
//
//  Created by André Midea Jasiskis on 10/02/13.
//  Copyright (c) 2013 André Midea Jasiskis. All rights reserved.
//

#import "ResultadoViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "Produto.h"
#import "Lote.h"

@interface ResultadoViewController ()

@end

@implementation ResultadoViewController
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
    [self carregarResultado];
	// Do any additional setup after loading the view.
}

-(void)carregarResultado{
    int initialHeigth = 50;
    int width = 25;
    int largura = self.view.frame.size.width;
    int i = 1;
    for(Produto *p in lote.produtos){
        UILabel *nomeProduto = [[UILabel alloc]initWithFrame:CGRectMake( width,initialHeigth * i, largura - (width * 2), 40)];
        nomeProduto.text = [NSString stringWithFormat:@"Produto: %@ Qtde %ld",p.nome, [p.quantidade longValue]];
        nomeProduto.textColor = [UIColor blueColor];
        [self estilizaLabel:nomeProduto];
        [self.view addSubview:nomeProduto];
        
        i++;
    }
    
}

-(UILabel*)estilizaLabel:(UILabel *)label{
    UIColor *color = label.textColor;
    label.layer.shadowColor = [color CGColor];
    label.layer.shadowRadius = 4.0f;
    label.layer.shadowOpacity = .9;
    label.layer.shadowOffset = CGSizeZero;
    label.layer.masksToBounds = NO;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor whiteColor];
    [label.layer setBorderColor:[[UIColor blueColor] CGColor]];
    
    [label.layer setBorderWidth: 1.0];
    [label.layer setCornerRadius:8.0f];
    [label.layer setMasksToBounds:YES];
    
    return label;
}


- (void)dealloc {
    [super dealloc];
}
@end
