#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *languages;
@property (nonatomic, strong) NSArray *colors;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.languages = @[@"Objective-C", @"Swift", @"Python", @"C++", @"C", @"Alpha", @"Beta", @"Gamma", @"Delta", @"Epsilon", @"Zeta", @"Eta", @"Theta", @"Iota", @"Kappa", @"Lambda", @"Mu", @"Nu", @"Xi", @"Omicron", @"Pi", @"Rho", @"Sigma", @"Tau", @"Upsilon", @"Phi", @"Chi", @"Psi", @"Omega"];
    self.languagesComboBox.maxRows = 10; //self.languages.count;

    self.colors = @[@"Red", @"Orange", @"Green", @"Blue", @"Yellow", @"Black", @"White", @"Gray"];
    self.colorsComboBox.maxRows = self.colors.count;
    
    self.languagesComboBox.layer.cornerRadius = 5.0f;
    self.languagesComboBox.layer.borderWidth = 0.5f;
    self.languagesComboBox.layer.borderColor = [UIColor colorWithWhite:0.5f alpha:0.6f].CGColor;
    self.languagesComboBox.cellLineColor = [UIColor colorWithWhite:0.5f alpha:0.1f];
    self.languagesComboBox.cellTextFont = [UIFont systemFontOfSize:13.0f];
    self.languagesComboBox.clipsToBounds = YES;
    
    self.colorsComboBox.layer.cornerRadius = 15.f;
    self.colorsComboBox.layer.borderWidth = 1.f;
    self.colorsComboBox.layer.borderColor = [UIColor blackColor].CGColor;
    self.colorsComboBox.clipsToBounds = YES;
}

#pragma mark FYComboBoxDelegate

- (NSInteger)comboBoxNumberOfRows:(FYComboBox *)comboBox
{
    if (comboBox == self.languagesComboBox) {
        return self.languages.count;
    } else if (comboBox == self.colorsComboBox) {
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

- (CGFloat)comboBox:(FYComboBox *)comboBox heightForRow:(NSInteger)row
{
    if (comboBox == self.languagesComboBox) {
        return 40.f;
    } else if (comboBox == self.colorsComboBox) {
        return 45.f;
    }
    
    return 50.f;
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
