//
//  ViewController.m
//  androidvsios
//
//  Created by Carlos Diaz Moreno on 8/2/17.
//  Copyright © 2017 Carlos Diaz Moreno. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *array;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    _array = [[NSMutableArray alloc] init]; // [NSMutableArray new]
    _tableView.dataSource = self;
    _tableView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)botonPulsado:(id)sender {

    [_array addObject:_entradaTextField.text];
    
    [_entradaTextField setText:@""];
    
    [_tableView reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_array count]; //_array.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell"];
    
    if(cell == nil) // if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycell"];
    }
    
    [cell.textLabel setText:[_array objectAtIndex:indexPath.row]];
    
    return cell;

}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    UIAlertController* alert = [UIAlertController
                                alertControllerWithTitle:NSLocalizedString(@"Borrar", nil)
                                message:NSLocalizedString(@"¿Desea borrar el elemento?",nil)
                                preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* okAction = [UIAlertAction
                                    actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action) {
                                        [_array removeObjectAtIndex:indexPath.row];
                                        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
                                    }];
    UIAlertAction* cancelAction = [UIAlertAction
                                    actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action) {
                                    
                                    }];
    [alert addAction:okAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
    
    [tableView deselectRowAtIndexPath:indexPath animated:UITableViewRowAnimationFade];

}

@end
