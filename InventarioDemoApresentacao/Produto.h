//
//  Produto.h
//  InventarioDemoApresentacao
//
//  Created by André Midea Jasiskis on 10/02/13.
//  Copyright (c) 2013 André Midea Jasiskis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Produto : NSObject{
    NSNumber *quantidade;
    NSString *nome;
}

-(id)initWithNome:(NSString *)_nome eQuantidade:(NSNumber *) _quantidade;

@property (nonatomic, retain) NSString *nome;
@property (nonatomic, retain) NSNumber *quantidade;

@end
