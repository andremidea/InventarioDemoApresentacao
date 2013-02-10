//
//  Lote.m
//  InventarioDemoApresentacao
//
//  Created by André Midea Jasiskis on 10/02/13.
//  Copyright (c) 2013 André Midea Jasiskis. All rights reserved.
//

#import "Lote.h"
#import "Produto.h"

@implementation Lote
@synthesize produtos,numero;

-(void)addProduto:(Produto *) produto{
    if(!produtos){
        produtos = [[NSMutableArray alloc]init];
    }
    
    [produtos addObject:produto];
}

-(id)initWithNumero:(NSString *)_numero{
    if((self = [super init])){
        self.numero = _numero;
    }
    return self;
}


@end
