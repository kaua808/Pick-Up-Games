//
//  CustomTableViewCell.h
//  PickUpGames
//
//  Created by Kaleo Kim on 7/17/15.
//  Copyright (c) 2015 Kaleo Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

// This is how all the cells in the app is styled.

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *sportName;
@property (weak, nonatomic) IBOutlet UILabel *city;
@property (weak, nonatomic) IBOutlet UILabel *dateAndTime;

//  Cell made in Storyboard

@end
