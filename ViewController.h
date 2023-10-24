//
//  ViewController.h
//  API
//
//  Created by Shweta on 11/07/22.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic) IBOutlet UITableView *tableView;


@property (readonly,assign) NSString *number;
@property (readonly,assign) NSString *countryCode;
@property (readonly,assign) NSString *theOperator;
@end

