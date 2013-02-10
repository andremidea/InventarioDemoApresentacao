//
//  Lote.h
//  InventarioDemoApresentacao
//
//  Created by André Midea Jasiskis on 10/02/13.
//  Copyright (c) 2013 André Midea Jasiskis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Produto.h"

@interface Lote : NSObject

@property (nonatomic, retain)NSMutableArray *produtos;
@property (nonatomic,retain)NSString *numero;

-(id)initWithNumero:(NSString *)numero;
-(void)addProduto:(Produto *)produto;
@end

