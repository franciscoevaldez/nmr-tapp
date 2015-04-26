//
//  tchAttendanceVC.m
//  Teechers App
//
//  Created by fran on 4/24/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchAttendanceVC.h"

#import "tchAttendanceHeader.h"
#import "tchAttendanceTableDS.h"

#import "ClassDay.h"

@interface tchAttendanceVC ()

@property (strong, nonatomic) IBOutlet tchAttendanceHeader *tchAttendanceHeader;
@property (strong, nonatomic) IBOutlet tchAttendanceTableDS *tchAttendanceTableDataSource;

@end

@implementation tchAttendanceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    
    // Setup the header for this class
    [self.tchAttendanceHeader setupHeaderForClass:self.activeClass];
    
    // Pass the class to the Students data source
    [self.tchAttendanceTableDataSource setupForClass:self.activeClass];
    
}

- (IBAction)addDaysHotfix:(id)sender {
    // ONLY WHILE TESTING AND DEVELOPING: FEED A FAKE ARRAY WITH 5 DAYS ------------------------------
     
    // create first classDay object
    NSDateFormatter *aDateFormatter = [[NSDateFormatter alloc] init];
    [aDateFormatter setDateFormat:@"yyyy-MM-dd"];
     
    ClassDay *a1ClassDay = [NSEntityDescription
                            insertNewObjectForEntityForName:@"ClassDay"
                            inManagedObjectContext:self.activeClass.managedObjectContext];
    a1ClassDay.name = [NSString stringWithFormat:@"Presentacion"];
    a1ClassDay.dayID = [NSString stringWithFormat:@"DAY001"];
    NSString *tempClassDay = [NSString stringWithFormat:@"2014-04-04"];
    a1ClassDay.date = [aDateFormatter dateFromString:tempClassDay];
    a1ClassDay.forClass = self.activeClass;
     
    ClassDay *a2ClassDay = [NSEntityDescription
                            insertNewObjectForEntityForName:@"ClassDay"
                            inManagedObjectContext:self.activeClass.managedObjectContext];
    a2ClassDay.name = [NSString stringWithFormat:@"Segunda"];
    a2ClassDay.dayID = [NSString stringWithFormat:@"DAY002"];
    tempClassDay = [NSString stringWithFormat:@"2014-04-14"];
    a2ClassDay.date = [aDateFormatter dateFromString:tempClassDay];
    a2ClassDay.forClass = self.activeClass;
     
    ClassDay *a3ClassDay = [NSEntityDescription
                            insertNewObjectForEntityForName:@"ClassDay"
                            inManagedObjectContext:self.activeClass.managedObjectContext];
    a3ClassDay.name = [NSString stringWithFormat:@"Color"];
    a3ClassDay.dayID = [NSString stringWithFormat:@"DAY003"];
    tempClassDay = [NSString stringWithFormat:@"2014-04-24"];
    a3ClassDay.date = [aDateFormatter dateFromString:tempClassDay];
    a3ClassDay.forClass = self.activeClass;
     
    ClassDay *a4ClassDay = [NSEntityDescription
                            insertNewObjectForEntityForName:@"ClassDay"
                            inManagedObjectContext:self.activeClass.managedObjectContext];
    a4ClassDay.name = [NSString stringWithFormat:@"Papel"];
    a4ClassDay.dayID = [NSString stringWithFormat:@"DAY004"];
    tempClassDay = [NSString stringWithFormat:@"2014-05-04"];
    a4ClassDay.date = [aDateFormatter dateFromString:tempClassDay];
    a4ClassDay.forClass = self.activeClass;
     
    ClassDay *a5ClassDay = [NSEntityDescription
                            insertNewObjectForEntityForName:@"ClassDay"
                            inManagedObjectContext:self.activeClass.managedObjectContext];
    a5ClassDay.name = [NSString stringWithFormat:@"Ejemplo"];
    a5ClassDay.dayID = [NSString stringWithFormat:@"DAY005"];
    tempClassDay = [NSString stringWithFormat:@"2014-05-04"];
    a5ClassDay.date = [aDateFormatter dateFromString:tempClassDay];
    a5ClassDay.forClass = self.activeClass;
    
    
    
    NSError *NuError;
    if (![self.activeClass.managedObjectContext save:&NuError]) {
        NSLog(@"error en: %@", [NuError localizedDescription]);
    }
     
    
    

    // TESTING ONLY AREA ENDS HERE ------------------------------------------------------
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
