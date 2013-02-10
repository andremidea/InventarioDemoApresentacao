//
//  Produto.m
//  InventarioDemoApresentacao
//
//  Created by André Midea Jasiskis on 10/02/13.
//  Copyright (c) 2013 André Midea Jasiskis. All rights reserved.
//

#import "Produto.h"

@implementation Produto
@synthesize quantidade, nome;

-(id)initWithNome:(NSString *)_nome eQuantidade:(NSNumber *)_quantidade{
    if((self = [super init])){
        self.quantidade = _quantidade;
        self.nome = _nome;
    }
    return self;
}

@end
