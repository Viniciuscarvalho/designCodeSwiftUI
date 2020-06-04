/*
 * Copyright 2019 Google
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <TargetConditionals.h>
#if TARGET_OS_IOS

#import <FirebaseAuth/FIRPhoneMultiFactorAssertion.h>

#import "FirebaseAuth/Sources/MultiFactor/FIRMultiFactorAssertion+Internal.h"
#import "FirebaseAuth/Sources/MultiFactor/Phone/FIRPhoneMultiFactorAssertion+Internal.h"

NS_ASSUME_NONNULL_BEGIN

extern NSString *const _Nonnull FIRPhoneMultiFactorID;

@implementation FIRPhoneMultiFactorAssertion

- (instancetype)init {
  self = [super init];
  if (self) {
    _factorID = FIRPhoneMultiFactorID;
  }
  return self;
}

@end

NS_ASSUME_NONNULL_END

#endif
