//
//  ACAccountStore+RACExtensions.m
//  Pods
//
//  Created by Stefano Comba on 27/03/14.
//
//

#import "ACAccountStore+RACExtensions.h"

@implementation ACAccountStore (RACExtensions)


+ (RACSignal*) rac_accountWithType:(NSString*) accountTypeName options:(NSDictionary*) options{
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        ACAccountStore *account = [[ACAccountStore alloc] init];
        ACAccountType* accountType = [account accountTypeWithAccountTypeIdentifier:accountTypeName];

        [account requestAccessToAccountsWithType: accountType options:options completion:^(BOOL granted, NSError *error) {
            if  (granted) {
                if (![accountType.identifier isEqualToString: ACAccountTypeIdentifierTwitter] && ![accountType.identifier isEqualToString: ACAccountTypeIdentifierTencentWeibo]) {
                    [account renewCredentialsForAccount: [[account accountsWithAccountType:accountType] lastObject] completion:^(ACAccountCredentialRenewResult renewResult, NSError *error) {
                        if (renewResult == ACAccountCredentialRenewResultRenewed) {
                            [subscriber sendNext:account];
                            [subscriber sendCompleted];
                        }
                        else {
                            [subscriber sendError:error];
                        }
                    }];
                }
                else {
                    [subscriber sendNext:account];
                    [subscriber sendCompleted];
                }
            }
            else {
                [subscriber sendError:error];
            }
            
        }];
        return [RACDisposable disposableWithBlock:^{
            ;
        }];
    }];
}
@end
