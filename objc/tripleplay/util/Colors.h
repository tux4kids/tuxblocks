//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: tripleplay/util/Colors.java
//
//  Created by Thomas on 7/1/13.
//

#import "JreEmulation.h"

#define TripleplayUtilColors_BRIGHT_FACTOR 1.4285715
#define TripleplayUtilColors_DARK_FACTOR 0.7
#define TripleplayUtilColors_MIN_BRIGHT 3

@interface TripleplayUtilColors : NSObject {
}

+ (int)WHITE;
+ (int)LIGHT_GRAY;
+ (int)GRAY;
+ (int)DARK_GRAY;
+ (int)BLACK;
+ (int)RED;
+ (int)PINK;
+ (int)ORANGE;
+ (int)YELLOW;
+ (int)GREEN;
+ (int)MAGENTA;
+ (int)CYAN;
+ (int)BLUE;
+ (int)blendWithInt:(int)c1
            withInt:(int)c2;
+ (int)blendWithInt:(int)c1
            withInt:(int)c2
          withFloat:(float)p1;
+ (int)darkerWithInt:(int)color;
+ (int)brighterWithInt:(int)color;
- (id)init;
@end