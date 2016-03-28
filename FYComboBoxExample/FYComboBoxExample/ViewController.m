#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *languages;
@property (nonatomic, strong) NSArray *colors;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.languages = @[@"Objective-C", @"Swift", @"Python", @"C++", @"C"];
    self.colors = @[@"Red", @"Orange", @"Green", @"Blue", @"Yellow", @"Black", @"White", @"Gray"];
    
    self.languagesComboBox.layer.borderWidth = 1.f;
    self.languagesComboBox.layer.cornerRadius = 15.f;

    self.colorsComboBox.layer.borderWidth = 1.f;
    self.colorsComboBox.layer.borderColor = [UIColor blackColor].CGColor;
    self.colorsComboBox.layer.cornerRadius = 15.f;
    self.colorsComboBox.clipsToBounds = YES;
}

#pragma mark FYComboBoxDelegate

- (NSInteger)comboBoxNumberOfRows:(FYComboBox *)comboBox
{
    if (comboBox == self.languagesComboBox) {
        self.languagesComboBox.cellHeight = 40.0;
        self.languagesComboBox.maxRows = self.languages.count;
        return self.languages.count;
    } else if (comboBox == self.colorsComboBox) {
        self.colorsComboBox.maxRows = self.colors.count;
        return self.colors.count;
    }
    
    return 0;
}

- (NSString *)comboBox:(FYComboBox *)comboBox titleForRow:(NSInteger)row
{
    if (comboBox == self.languagesComboBox) {
        return self.languages[row];
    } else if (comboBox == self.colorsComboBox) {
        return self.colors[row];
    }
    
    return 0;
}

- (void)comboBox:(FYComboBox *)comboBox didSelectRow:(NSInteger)row
{
    if (comboBox == self.languagesComboBox) {
        NSLog(@"Selected %@", self.languages[row]);
        self.languageLabel.text = self.languages[row];
    } else if (comboBox == self.colorsComboBox) {
        NSLog(@"Selected %@", self.colors[row]);
        self.colorLabel.text = self.colors[row];
    }
    
    [comboBox closeAnimated:YES];
}

@end
