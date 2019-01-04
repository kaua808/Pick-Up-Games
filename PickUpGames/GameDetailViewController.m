//
//  GameDetailViewController.m
//  PickUpGames
//
//  Created by Kaleo Kim on 7/7/15.
//  Copyright (c) 2015 Kaleo Kim. All rights reserved.
//

#import "GameDetailViewController.h"
#import "GameConfirmationController.h"



@interface GameDetailViewController () <UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UILabel *gameTitle;
@property (weak, nonatomic) IBOutlet UILabel *whereLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateAndTimeLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIButton *imInButton;


@end

@implementation GameDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
    self.imInButton.backgroundColor = [UIColor blueColor];
    
    // Doing this cause in IB I am hiding the navbar on the previous view and so in this view I want to show it again
    [self.navigationController.navigationBar setHidden:NO];

    // Do any additional setup after loading the view.
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    self.gameTitle.text = self.game.sportName;
    self.whereLabel.text = self.game.where;
    [formatter setDateFormat:@"MMMM dd, hh:mm a"];
    self.dateAndTimeLabel.text = [NSString stringWithFormat:@"%@",[formatter stringFromDate:self.game.dateAndTime]];
    
    // Reloading the collection view of people going
    if (self.game) {
        [[GameConfirmationController sharedInstance] usersGoingToGame:self.game withCompletion:^(BOOL success) {
            if (success) {
                [self.collectionView reloadData];
            }
        }];
    }
}

- (IBAction)joinGameButtonTapped:(id)sender {
    
    // Creates a pointer for user and a game to one another so I can see what users are going to what game and I can see all the users going to a singular game as well (for both detail game view and user profile page)
    [[GameConfirmationController sharedInstance] createConfirmationToGame:self.game user:[PFUser currentUser] withCompletion:^(BOOL success) {
        if (success) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.collectionView reloadData];
            });
        }
    }];

}

#pragma mark- Collection View Delegate Methods

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat size = collectionView.frame.size.width / 3;
    return CGSizeMake( size, size);
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(15, 0, 15, 0);
}

@end
