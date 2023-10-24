//
//  ViewController.m
//  API
//
//  Created by Shweta on 11/07/22.
//

#import "ViewController.h"
#import "Data.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSString *number;
    NSString *countryCode;
    NSString *theOperator;
    
    NSMutableArray<Data *> *datas;
}


//@property (nonatomic,retain) NSMutableArray *items;
//@property (nonatomic,retain) NSMutableDictionary *tableObjects;

@end

@implementation ViewController
@synthesize tableView;
@synthesize number=_number;
@synthesize countryCode=_countryCode;
@synthesize theOperator=_theOpeartor;
- (void)viewDidLoad {
    [super viewDidLoad];
   
    // Do any additional setup after loading the view.
//    self.items=[[NSMutableArray alloc]init];
//    self.tableObjects=[[NSMutableDictionary alloc]init];
//    [self getJSONData];
    [self getData];
    [self.tableView reloadData];
    
}

//JSON Parsing to Tableview
//-(void) getJSONData{
//
//    NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:@"https://nownowpay.ng/LookupNumber/NG/checkstatus/2347011122185/234"]];
//        NSError *error;
//        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
//        NSArray *arr = jsonDict[@"Result"];
//        arrNumber = [[NSMutableArray alloc]init];
//        arrCountryCode = [[NSMutableArray alloc]init];
//        arrTheOperator = [[NSMutableArray alloc]init];
//        for(int i=0;i<[arr count];i++)
//        {
//            NSString *strNumber = [arr[i]objectForKey:@"Number"];
//            NSString *strCountryCode = [arr[i]objectForKey:@"CountryCode"];
//            NSString *strTheOperator = [arr[i]objectForKey:@"TheOperator"];
//
//            NSLog(@"The strNumber is - %@",strNumber);
//            NSLog(@"The strCountryCode is - %@", strCountryCode);
//            NSLog(@"The strTheOperator is - %@", strTheOperator);
//
//           [arrNumber addObject:strNumber];
//           [arrCountryCode addObject:strCountryCode];
//           [arrTheOperator addObject:strTheOperator];
//
//            NSLog(@"The arrNumber is - %@",arrNumber);
//            NSLog(@"The arrCountryCode is - %@", arrCountryCode);
//            NSLog(@"The arrTheOperator is - %@", arrTheOperator);
//        }
//    }
-(void) getData{
    
    NSURL *url = [NSURL URLWithString:@"https://nownowpay.ng/LookupNumber/NG/checkstatus/2347011122185/234"];
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
        {
            NSError *err;
            NSDictionary *jsondata  = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            NSArray *json =jsondata[@"Result"];
            if(err)
            {
                NSLog(@"Failed to load json:%@",err);
                return;
            }
       
        NSMutableArray<Data *> *datas=NSMutableArray.new;
         for(int i=0;i<[json count];i++)
         {
         
             NSString *number = [json[i] objectForKey:@"Number"];
             NSString *countryCode = [json[i] objectForKey:@"CountryCode"];
             NSString *theOperator = [json[i] objectForKey:@"TheOperator"];
 
             NSLog(@"Number is - %@",number);
             NSLog(@"CountryCode is - %@", countryCode);
             NSLog(@"TheOperator is - %@", theOperator);
             Data *data=Data.new;
             data.num=number;
             data.code=countryCode;
             [datas addObject:data];
    }
        self->datas=datas;
        
        dispatch_async(dispatch_get_main_queue(),^{
            [self.tableView reloadData];
        });
        
    }]resume ];
         
    
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
//    NSString *num=number;
//    NSString *code=countryCode;
    Data *data=self->datas[indexPath.row];;
    cell.textLabel.text=data.num;
    cell.detailTextLabel.text=data.code;

    return cell;
}

@end



















//    NSString *targetUrl = [NSString stringWithFormat:@"https://nownowpay.ng/LookupNumber/NG/checkstatus/2347011122185/234"];
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
//    [request setHTTPMethod:@"GET"];
//    [request setURL:[NSURL URLWithString:targetUrl]];
//
//    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:
//      ^(NSData * _Nullable data,
//        NSURLResponse * _Nullable response,
//        NSError * _Nullable error) {
//
//          NSString *myString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//          NSLog(@"Data received: %@", myString);
//    }] resume];
    
    //Api call shows in console
//    NSError *error;
//    NSString *url_string = [NSString stringWithFormat: @"https://nownowpay.ng/LookupNumber/NG/checkstatus/2347011122185/234"];
//    NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string]];
//    NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
//    NSLog(@"json: %@", json);
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return [self.items count];
//}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
//    if(cell==nil)
//    {
//        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell]"];
//    }
//    self.tableObjects=self.items[indexPath.row];
//    NSString *strNo=[self.tableObjects objectForKey:@"number"];
//    NSString *strCountry=[self.tableObjects objectForKey:""];
//    NSString *number=[_items objectAtIndex:[indexPath indexAtPosition:1]];
//    [[cell textLabel]setText:number];
//    return cell;
//}
//
//-(void) getData{
//    NSData *data=[NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://nownowpay.ng/LookupNumber/NG/checkstatus/2347011122185/234"]];
//    NSError *error=nil;
//    id response=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
//    if(error)
//    {
//        NSLog(@"%@",error,[error localizedDescription]);
//
//    }else{
//        self.items=response;
//        NSLog(@"%@",self.items);
//
//    }
//    [self.tableView reloadData];
//@end
     


    
