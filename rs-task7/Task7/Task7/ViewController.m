//
//  ViewController.m
//  Task7
//
//  Created by Kirill Kaveryn on 2.07.21.
//

#import "ViewController.h"
#import "RSTextField.h"
#import "RSAuthorizeButton.h"
#import "RSCircleButton.h"
#import "RSColor.h"
#import "RSLabel.h"


@interface ViewController () <UITextViewDelegate, UITextFieldDelegate>
@property (nonatomic, strong) UILabel *labelRSSchool;
@property (nonatomic, strong) RSAuthorizeButton *authorizeButton;
@property (nonatomic, strong) RSTextField *loginField;
@property (nonatomic, strong) RSTextField *passwordField;
@property (nonatomic, strong) UILabel *resultLabel;
@property (nonatomic, strong) RSCircleButton *buttonOne;
@property (nonatomic, strong) RSCircleButton *buttonTwo;
@property (nonatomic, strong) RSCircleButton *buttonThree;
@property (nonatomic, strong) NSString *correctUserString;
@property (nonatomic, strong) NSString *correctPasswordString;
@property (nonatomic, strong) UIStackView *stackCaptureButtons;
@property (nonatomic, strong) RSLabel *labelCapture;
@property (nonatomic, strong) NSMutableString *inputCaptureString;
@property (nonatomic, strong) NSMutableArray *captureInputArray;
@property (nonatomic, strong) NSArray *correctCapturePassArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // hide keyboard when tapped around
    [self hideWhenTappedAround];
    
    // alloc-init some properties (for capture)
    self.inputCaptureString = [NSMutableString new];
    self.captureInputArray = [NSMutableArray new];
    
    // MARK: set all key and passwords
    self.correctUserString = @"username";
    self.correctPasswordString = @"password";
    self.correctCapturePassArray = [NSArray arrayWithObjects:@"1", @"3", @"2", nil];
        
    // MARK: label RSSchool
    NSString *labelContent = @"RSSchool";
    self.labelRSSchool = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [self.labelRSSchool setFont: [UIFont systemFontOfSize:36 weight:UIFontWeightBold]];
    self.labelRSSchool.textColor = [UIColor blackColor];
    self.labelRSSchool.text = labelContent;
    [self.labelRSSchool setNumberOfLines:1];
    [self.labelRSSchool sizeToFit];
    [self.labelRSSchool setTranslatesAutoresizingMaskIntoConstraints:false];
    // constrains for label
    NSLayoutConstraint *labelRSSchoolLeftConstraint = [NSLayoutConstraint
                                                        constraintWithItem:self.labelRSSchool
                                                                 attribute:NSLayoutAttributeLeft
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.view
                                                                 attribute:NSLayoutAttributeLeft
                                                                multiplier:1.0
                                                                  constant:101];
    NSLayoutConstraint *labelRSSchoolTopConstraint = [NSLayoutConstraint
                                                        constraintWithItem:self.labelRSSchool
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.view
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1
                                                                  constant:80];
    
    
    
    // MARK: loginField
    self.loginField = [[RSTextField alloc] initWithPlaceholder:@"Login"];
    [self.loginField setTranslatesAutoresizingMaskIntoConstraints:false];
    
    NSLayoutConstraint *loginFieldLeftConstraint = [NSLayoutConstraint
                                                        constraintWithItem:self.loginField
                                                                 attribute:NSLayoutAttributeLeft
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.view
                                                                 attribute:NSLayoutAttributeLeft
                                                                multiplier:1.0
                                                                  constant:36];
    NSLayoutConstraint *loginFieldTopConstraint = [NSLayoutConstraint
                                                        constraintWithItem:self.loginField
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.labelRSSchool
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1
                                                                  constant:80];
    NSLayoutConstraint *loginFieldRightConstraint = [NSLayoutConstraint
                                                        constraintWithItem:self.loginField
                                                                 attribute:NSLayoutAttributeRight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.view
                                                                 attribute:NSLayoutAttributeRight
                                                                multiplier:1.0
                                                                  constant:-36];
    NSLayoutConstraint *loginFieldHeight= [NSLayoutConstraint
                                                        constraintWithItem:self.loginField
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:NSLayoutAttributeHeight
                                                                multiplier:1
                                                                  constant:30];
    
    // MARK: passwordField
    self.passwordField = [[RSTextField alloc] initWithPlaceholder:@"Password"];
    self.passwordField.secureTextEntry = YES;
    self.passwordField.clearsOnBeginEditing = YES;
    [self.passwordField setTranslatesAutoresizingMaskIntoConstraints:false];

    NSLayoutConstraint *passwordFieldLeftConstraint = [NSLayoutConstraint
                                                        constraintWithItem:self.passwordField
                                                                 attribute:NSLayoutAttributeLeft
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.view
                                                                 attribute:NSLayoutAttributeLeft
                                                                multiplier:1.0
                                                                  constant:36];
    NSLayoutConstraint *passwordFieldTopConstraint = [NSLayoutConstraint
                                                        constraintWithItem:self.passwordField
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.loginField
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1
                                                                  constant:30];
    NSLayoutConstraint *passwordFieldRightConstraint = [NSLayoutConstraint
                                                        constraintWithItem:self.passwordField
                                                                 attribute:NSLayoutAttributeRight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.view
                                                                 attribute:NSLayoutAttributeRight
                                                                multiplier:1.0
                                                                  constant:-36];
    NSLayoutConstraint *passwordFieldHeight= [NSLayoutConstraint
                                                        constraintWithItem:self.passwordField
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:NSLayoutAttributeHeight
                                                                multiplier:1
                                                                  constant:30];
    
    
    // MARK: authorize button
    self.authorizeButton = [[RSAuthorizeButton alloc] initWithTitle:@"Authorize"];
    [self.authorizeButton setTranslatesAutoresizingMaskIntoConstraints:false];

    NSLayoutConstraint *buttonRightConstraint = [NSLayoutConstraint
                                                        constraintWithItem:self.authorizeButton
                                                                 attribute:NSLayoutAttributeRight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.view
                                                                 attribute:NSLayoutAttributeRight
                                                                multiplier:1.0
                                                                  constant: -110];
    NSLayoutConstraint *buttonTopConstraint = [NSLayoutConstraint
                                                        constraintWithItem:self.authorizeButton
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.passwordField
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1
                                                                  constant:60];
    NSLayoutConstraint *buttonWidth= [NSLayoutConstraint
                                                        constraintWithItem:self.authorizeButton
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:NSLayoutAttributeWidth
                                                                multiplier:1
                                                                  constant:156];
    NSLayoutConstraint *buttonHeight= [NSLayoutConstraint
                                                        constraintWithItem:self.authorizeButton
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:NSLayoutAttributeHeight
                                                                multiplier:1
                                                                  constant:42];
    
    
    // MARK: capture label
    self.labelCapture = [[RSLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [self.labelCapture setStateForLabelFrame:noneFrame];
    self.labelCapture.layer.borderWidth = 2.0;
    self.labelCapture.layer.cornerRadius = 10;
    [self.labelCapture setFont: [UIFont systemFontOfSize:18 weight:UIFontWeightSemibold]];
    self.labelCapture.textColor = [UIColor blackColor];
    self.labelCapture.text = @"_";
    [self.labelCapture setNumberOfLines:1];
    [self.labelCapture setHidden:YES];
    [self.labelCapture setTextAlignment:NSTextAlignmentCenter];
    
    [self.labelCapture setTranslatesAutoresizingMaskIntoConstraints:false];
    NSLayoutConstraint *labelCaptureCenterConstraint = [NSLayoutConstraint
                                                        constraintWithItem:self.labelCapture
                                                                 attribute:NSLayoutAttributeCenterX
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.view
                                                                 attribute:NSLayoutAttributeCenterX
                                                                multiplier:1.0
                                                                  constant:0];
    NSLayoutConstraint *labelCabtureTopConstraint = [NSLayoutConstraint
                                                        constraintWithItem:self.labelCapture
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.authorizeButton
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1
                                                                  constant:67];
    NSLayoutConstraint *labelCaptureWidthConstraint = [NSLayoutConstraint
                                                        constraintWithItem:self.labelCapture
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:NSLayoutAttributeWidth
                                                                multiplier:1.0
                                                                  constant:236];
    NSLayoutConstraint *labelCabtureHeigthConstraint = [NSLayoutConstraint
                                                        constraintWithItem:self.labelCapture
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:NSLayoutAttributeHeight
                                                                multiplier:1
                                                                  constant:110];
    
    
    
    // MARK: capture buttons
    self.buttonOne = [[RSCircleButton alloc] initWithDiameter:50.0 andTitle:@"1"];
    self.buttonTwo = [[RSCircleButton alloc] initWithDiameter:50.0 andTitle:@"2"];
    self.buttonThree = [[RSCircleButton alloc] initWithDiameter:50.0 andTitle:@"3"];
    
    // create stackView from 3 buttons
    self.stackCaptureButtons = [[UIStackView alloc] initWithFrame:CGRectMake(0, 0, 190, 50)];
    [self.stackCaptureButtons setAlignment:UIStackViewAlignmentFill];
    [self.stackCaptureButtons setDistribution:UIStackViewDistributionFillEqually];
    [self.stackCaptureButtons addArrangedSubview:self.buttonOne];
    [self.stackCaptureButtons addArrangedSubview:self.buttonTwo];
    [self.stackCaptureButtons addArrangedSubview:self.buttonThree];
    [self.stackCaptureButtons setSpacing:20];
    [self.stackCaptureButtons setHidden:YES];
    
    [self.stackCaptureButtons setTranslatesAutoresizingMaskIntoConstraints:false];
    
    NSLayoutConstraint *stackTopConstraint = [NSLayoutConstraint
                                                        constraintWithItem:self.stackCaptureButtons
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.labelCapture
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1
                                                                  constant: 45];
    NSLayoutConstraint *stackCenterConstraint = [NSLayoutConstraint
                                                        constraintWithItem:self.stackCaptureButtons
                                                                 attribute:NSLayoutAttributeCenterX
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.view
                                                                 attribute:NSLayoutAttributeCenterX
                                                                multiplier:1.0
                                                                  constant:0];
    NSLayoutConstraint *stackWidth= [NSLayoutConstraint
                                                        constraintWithItem:self.stackCaptureButtons
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:NSLayoutAttributeWidth
                                                                multiplier:1
                                                                  constant:190];
    NSLayoutConstraint *stackHeight= [NSLayoutConstraint
                                                        constraintWithItem:self.stackCaptureButtons
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:NSLayoutAttributeHeight
                                                                multiplier:1
                                                                  constant:50];
    
    
    // MARK: add all elements and constrains to view
    [self.view addSubview:self.labelRSSchool];
    [self.view addConstraints:@[labelRSSchoolLeftConstraint, labelRSSchoolTopConstraint]];
    
    [self.view addSubview:self.loginField];
    [self.view addConstraints:@[loginFieldLeftConstraint, loginFieldTopConstraint, loginFieldRightConstraint, loginFieldHeight]];
    
    [self.view addSubview:self.passwordField];
    [self.view addConstraints:@[passwordFieldLeftConstraint, passwordFieldTopConstraint, passwordFieldRightConstraint, passwordFieldHeight]];
    
    [self.view addSubview:self.authorizeButton];
    [self.view addConstraints:@[buttonRightConstraint, buttonTopConstraint, buttonWidth, buttonHeight]];
    
    [self.view addSubview:self.labelCapture];
    [self.view addConstraints:@[labelCaptureCenterConstraint, labelCabtureTopConstraint, labelCaptureWidthConstraint, labelCabtureHeigthConstraint]];
    
    [self.view addSubview:self.stackCaptureButtons];
    [self.view addConstraints:@[stackTopConstraint, stackCenterConstraint, stackWidth, stackHeight]];
    
    self.loginField.delegate = self;
    self.passwordField.delegate = self;
    
    
    // add actions to fields (state to defaulf)
//    [self.loginField addTarget:self action:@selector(setFieldStateToDefaultWhenPressed:) forControlEvents:UIControlEventEditingDidBegin];
//    [self.passwordField addTarget:self action:@selector(setFieldStateToDefaultWhenPressed:) forControlEvents:UIControlEventEditingDidBegin];
    
    // add actios to authorize button
    [self.authorizeButton addTarget:self action:@selector(authorizeButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    // add actios to capture buttons
    [self.buttonOne addTarget:self action:@selector(checkCapture:) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonTwo addTarget:self action:@selector(checkCapture:) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonThree addTarget:self action:@selector(checkCapture:) forControlEvents:UIControlEventTouchUpInside];
}


    // check for only latin letters
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSCharacterSet *set = [NSCharacterSet letterCharacterSet];
    NSMutableCharacterSet *textSet = [NSMutableCharacterSet characterSetWithCharactersInString:string];
    if ([set isSupersetOfSet:textSet]) {
        return true;
    }
    else {
        return false;
    }
}

// check user and password fields
- (void)authorizeButtonTapped:(UIButton *)sender {
    NSString *user = self.loginField.text;
    NSString *password = [self.passwordField text];

    if ([user isEqualToString:self.correctUserString] && [password isEqualToString:self.correctPasswordString]) {
        [self.loginField setStateForTextField:success];
        [self.passwordField setStateForTextField:success];
        // if OK - go to capture
        [self disableTextLables];
        [self enableCapture];
    }
    else if ([user isEqualToString:self.correctUserString] && ![password isEqualToString:self.correctPasswordString]) {
        [self.loginField setStateForTextField:success];
        [self.passwordField setStateForTextField:error];
    }
    else if (![user isEqualToString:self.correctUserString] && [password isEqualToString:self.correctPasswordString]) {
        [self.loginField setStateForTextField:error];
        [self.passwordField setStateForTextField:success];
    }
    else {
        [self.loginField setStateForTextField:error];
        [self.passwordField setStateForTextField:error];
    }
}

// actions to fields (state to defaulf)
- (void)setFieldStateToDefaultWhenPressed:(RSTextField *)textField {
    [textField setStateForTextField:ready];
}


// disable text field and buttons and sel alpha to 0.5
- (void)disableTextLables {
    [self.loginField setAlpha:0.5];
    [self.passwordField setAlpha:0.5];
    [self.authorizeButton setAlpha:0.5];
    self.loginField.enabled = NO;
    self.passwordField.enabled = NO;
    self.authorizeButton.enabled = NO;
}

// enable capture
- (void)enableCapture {
    [self.labelCapture setHidden:FALSE];
    [self.stackCaptureButtons setHidden:FALSE];
}

// check capture: inputCaptureString - send to label string with spaces
-(void)checkCapture:(RSCircleButton *)button {
    NSString *inputCharacter = button.titleLabel.text;
    [self.labelCapture setStateForLabelFrame:noneFrame];
    if (self.captureInputArray.count < 3) {
        if ([self.labelCapture.text isEqualToString: @"_"]) {
            self.inputCaptureString = [NSMutableString stringWithString:@""];
        }
        [self.captureInputArray addObject:inputCharacter];
        [self.inputCaptureString appendString:inputCharacter];
        [self.inputCaptureString appendString:@" "];
        [self.labelCapture setText:self.inputCaptureString];
    }
    if (self.captureInputArray.count == self.correctCapturePassArray.count && [self.captureInputArray isEqualToArray:self.correctCapturePassArray]) {
        [self.labelCapture setHidden:FALSE];
        [self.labelCapture setStateForLabelFrame:successFrame];
        
        [self callAlertController];
    }
    if (self.captureInputArray.count == self.correctCapturePassArray.count && ![self.captureInputArray isEqualToArray:self.correctCapturePassArray]) {
        [self.labelCapture setHidden:FALSE];
        [self.labelCapture setStateForLabelFrame:errorFrame];
        self.inputCaptureString = [NSMutableString stringWithString:@"_"];
        [self.captureInputArray removeAllObjects];
        [self.labelCapture setText:self.inputCaptureString];
    }
    
}

// hide keyboard when taped around
- (void)hideWhenTappedAround {
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
    [self.view addGestureRecognizer:gesture];
}

// hide keyboard when press Return in texfield
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([textField isEqual:self.passwordField]) {
        [self hide];
    }
    else {
        [self.passwordField becomeFirstResponder];
    }
    return true;
}

// hide keybord
-(void)hide {
    [self.view endEditing:true];
}

// create and show alert
-(void)callAlertController {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Welcome" message:@"You are sucsessfully authorized!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *refresh = [UIAlertAction actionWithTitle:@"Refresh" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [self setApplicationToDefaulsStatement];
    }];
    alert.view.tintColor = [UIColor redColor];
    [alert addAction:refresh];
    [self presentViewController:alert animated:YES completion:nil];
}

// set all elements to default statement
-(void)setApplicationToDefaulsStatement {
    [self.loginField setStateForTextField:ready];
    [self.passwordField setStateForTextField:ready];
    [self.loginField setAlpha:1.0];
    [self.passwordField setAlpha:1.0];
    [self.authorizeButton setAlpha:1.0];
    self.loginField.enabled = YES;
    self.passwordField.enabled = YES;
    self.authorizeButton.enabled = YES;
    self.loginField.text = @"";
    self.passwordField.text = @"";
    [self.labelCapture setStateForLabelFrame:noneFrame];
    self.labelCapture.text = @"_";
    [self.labelCapture setHidden:YES];
    [self.stackCaptureButtons setHidden:YES];
    [self.captureInputArray removeAllObjects];
}

@end



