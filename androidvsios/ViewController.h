//
//  ViewController.h
//  androidvsios
//
//  Created by Carlos Diaz Moreno on 8/2/17.
//  Copyright © 2017 Carlos Diaz Moreno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *miTextoLabel;
@property (weak, nonatomic) IBOutlet UITextField *entradaTextField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *miboton;

- (IBAction)botonPulsado:(id)sender;

@end

