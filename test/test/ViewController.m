//
//  ViewController.m
//  test
//
//  Created by Judith on 2020/4/9.
//  Copyright © 2020 Trantest. All rights reserved.
//

#import "ViewController.h"

#define kColumnNoIdTitle                @"No"
#define kColumnTestNameId               @"titleID"
#define kColumnTestNameTitle            @"Title"

@interface ViewController ()<NSTableViewDelegate,NSTableViewDataSource>
@property (weak) IBOutlet NSTableView *allInfoTableView;
@property (weak) IBOutlet NSTableView *failInfoTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self.allInfoTableView.tableColumns copy] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.allInfoTableView removeTableColumn:obj];
    }];

    CGFloat tableWidth = self.view.frame.size.width;
    CGFloat aWidth = 0;
    NSFont *itemFont = [NSFont fontWithName:@"Menlo-Regular" size:11];
    
    for (int index = 0; index < 2; index++){
        NSTableColumn* allTableColumn           = [[NSTableColumn alloc] init];
        NSTableColumn* failTableColumn          = [[NSTableColumn alloc] init];
        NSString *colIdentifierNo;
        NSString *colTitle;
        switch (index) {
            case 0:
                colIdentifierNo   = kColumnNoIdTitle;
                colTitle          = kColumnNoIdTitle;
                aWidth = 100;
                allTableColumn.width      = aWidth;
                failTableColumn.width      = aWidth;
                [allTableColumn setMaxWidth:aWidth];
                [failTableColumn setMaxWidth:aWidth];
                break;
            case 1:
                colIdentifierNo   = kColumnTestNameId;
                colTitle          = kColumnTestNameTitle;
                aWidth = 100;
                allTableColumn.width      = aWidth;
                failTableColumn.width      = aWidth;
                break;
        }
        
        [[allTableColumn headerCell ] setStringValue: colTitle];
        [[allTableColumn headerCell ] setAlignment:NSTextAlignmentCenter];
        allTableColumn.identifier = colIdentifierNo;
        tableWidth      = tableWidth - aWidth;
        [allTableColumn setMinWidth:aWidth];
        ((NSTextFieldCell*)allTableColumn.dataCell).font = itemFont;
        
        [allTableColumn setEditable:YES];
        
        [[failTableColumn headerCell ] setStringValue: colTitle];
        [[failTableColumn headerCell ] setAlignment:NSTextAlignmentCenter];
        failTableColumn.identifier = colIdentifierNo;
        [failTableColumn setMinWidth:aWidth];
        ((NSTextFieldCell*)failTableColumn.dataCell).font = itemFont;
        
        [failTableColumn setEditable:YES];
        
        [self.allInfoTableView addTableColumn:allTableColumn];
    }
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return 28;
}
- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSLog(@"ok!");
    return @"ddddd";
}

@end
