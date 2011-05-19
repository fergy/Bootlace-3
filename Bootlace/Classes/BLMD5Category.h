//
//  BLMD5Category.h
//  Bootlace
//
//  Created by Nick Pack on 19/05/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

@interface NSString (BLMD5Category)

- (NSString *)md5Sum;

@end

@interface NSData (BLMD5Category)

- (NSString *)md5Sum;

@end
