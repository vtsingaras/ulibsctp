//
//  UMSctpTask_AdminDetach.m
//  ulibsctp
//
//  Created by Andreas Fink on 02.12.14.
//  Copyright (c) 2016 Andreas Fink
//

#import "UMSctpTask_AdminDetach.h"
#import "UMLayerSctp.h"
#import "UMLayerSctpUserProtocol.h"

@implementation UMSctpTask_AdminDetach
@synthesize userId;

- (UMSctpTask_AdminDetach *)initWithReceiver:(UMLayerSctp *)rx
                                      sender:(id<UMLayerSctpUserProtocol>)tx
                                      userId:(id)uid;
{
    self = [super initWithName:[[self class]description]
                      receiver:rx
                        sender:tx
       requiresSynchronisation:NO];
    if(self)
    {
        self.name = @"UMSctpTask_AdminDetach";
        self.userId     = uid;
    }
    return self;
}

- (void)main
{
    UMLayerSctp *link = (UMLayerSctp *)self.receiver;
    [link _adminDetachTask:self];
}

@end
