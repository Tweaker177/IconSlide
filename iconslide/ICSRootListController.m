#include "ICSRootListController.h"
/**
#import <notify.h>
#import <Social/Social.h>
**/
@interface PSControlTableCell : PSTableCell
- (UIControl *)control;
@end

@interface PSSwitchTableCell : PSControlTableCell
- (id)initWithStyle:(int)style reuseIdentifier:(id)identifier specifier:(id)specifier;
@end

@interface SRSwitchTableCell : PSSwitchTableCell
@end

@implementation SRSwitchTableCell

-(id)initWithStyle:(int)style reuseIdentifier:(id)identifier specifier:(id)specifier { 
//init method

	self = [super initWithStyle:style reuseIdentifier:identifier specifier:specifier]; 
//call the super init method
	
if (self) {
		[((UISwitch *)[self control]) setOnTintColor:[UIColor blueColor]]; 


	}
	return self;
}

@end


 @interface HBTintedTableCell : PSTableCell
@end


@implementation ICSRootListController

- (instancetype)init {
    self = [super init];
if (self) {
        HBAppearanceSettings *appearanceSettings = [[HBAppearanceSettings alloc] init];
        appearanceSettings.tintColor =  [UIColor colorWithRed: 1.0 green: 0.5 blue: 0.01 alpha: 1.0];

appearanceSettings.statusBarTintColor = [UIColor yellowColor];
        
appearanceSettings.navigationBarTintColor = [UIColor colorWithRed: 1.0 green: 0.5 blue: 0.01 alpha: 1.0];

appearanceSettings.tableViewCellSeparatorColor = [UIColor colorWithWhite:0 alpha:0.8];
/**
appearanceSettings.navigationBarTitleColor = [UIColor colorWithRed: .80 green: .80 blue: 1.0 alpha: 1];
**/
appearanceSettings.tableViewCellBackgroundColor = [UIColor colorWithRed: .12 green: .12 blue: .3 alpha:1];

appearanceSettings.tableViewCellTextColor = [UIColor colorWithRed: .80 green: .80 blue: 1.0 alpha: 1];


appearanceSettings.tableViewCellSelectionColor = [UIColor redColor];

appearanceSettings.tableViewBackgroundColor =
[UIColor colorWithRed: 0.f green: 0.f blue: 0.2f alpha:0.2];

appearanceSettings.navigationBarBackgroundColor = [UIColor colorWithRed: .12 green: .12 blue: .3 alpha:0.85];

        self.hb_appearanceSettings = appearanceSettings;
    }
return self;
}


- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

-(void)viewWillAppear:(BOOL)animated {
[super viewWillAppear:animated];
CGRect frame = self.table.bounds;
    frame.origin.y = -frame.size.height;

    [self.navigationController.navigationController.navigationBar setShadowImage: [UIImage new]];
    self.navigationController.navigationController.navigationBar.translucent = YES;
}

+(NSString *)hb_shareText {
NSString *shareText = @"I’m using #IconSlide by i0s_tweak3r... @BrianVS Hosted by @YouRepo ";
return shareText;
}

+(NSURL *)hb_shareURL {
return [NSURL URLWithString:@"http://i0s-tweak3r-betas.yourepo.com/pack/iconslide"];
}
/*
-(void)save {
[self.view endEditing:YES];
}
*/
- (void)respring:(id)sender {
	pid_t pid;
    const char* args[] = {"killall", "backboardd", NULL};
    posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
}


@end
