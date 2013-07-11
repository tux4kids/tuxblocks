//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: react/RMap.java
//
//  Created by Thomas on 7/1/13.
//

#import "Connection.h"
#import "Cons.h"
#import "IOSClass.h"
#import "MultiFailureException.h"
#import "Reactor.h"
#import "Value.h"
#import "ValueView.h"
#import "java/lang/Boolean.h"
#import "java/lang/IllegalStateException.h"
#import "java/lang/Integer.h"
#import "java/lang/NullPointerException.h"
#import "java/lang/Throwable.h"
#import "java/util/Collection.h"
#import "java/util/HashMap.h"
#import "java/util/HashSet.h"
#import "java/util/Iterator.h"
#import "java/util/Map.h"
#import "java/util/Set.h"

@implementation ReactRMap

- (id<JavaUtilMap>)_impl {
  return _impl_;
}
- (void)set_impl:(id<JavaUtilMap>)_impl {
  JreOperatorRetainedAssign(&_impl_, self, _impl);
}
@synthesize _impl = _impl_;
- (ReactValue *)_sizeView {
  return _sizeView_;
}
- (void)set_sizeView:(ReactValue *)_sizeView {
  JreOperatorRetainedAssign(&_sizeView_, self, _sizeView);
}
@synthesize _sizeView = _sizeView_;

+ (ReactRMap *)create {
  return ((ReactRMap *) [ReactRMap createWithJavaUtilMap:[[[JavaUtilHashMap alloc] init] autorelease]]);
}

+ (ReactRMap *)createWithJavaUtilMap:(id<JavaUtilMap>)impl {
  return [[[ReactRMap alloc] initWithJavaUtilMap:impl] autorelease];
}

- (id)initWithJavaUtilMap:(id<JavaUtilMap>)impl {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&_impl_, self, impl);
  }
  return self;
}

- (id<ReactConnection>)connectWithReactRMap_Listener:(ReactRMap_Listener *)listener {
  ReactRMap_Listener *casted = (ReactRMap_Listener *) listener;
  return ((ReactCons *) [self addConnectionWithId:casted]);
}

- (void)disconnectWithReactRMap_Listener:(ReactRMap_Listener *)listener {
  ReactRMap_Listener *casted = (ReactRMap_Listener *) listener;
  [self removeConnectionWithId:casted];
}

- (id)getOrElseWithId:(id)key
               withId:(id)defaultValue {
  id value = [((id<JavaUtilMap>) NIL_CHK(_impl_)) getWithId:key];
  return (value == nil) ? defaultValue : value;
}

- (id)putForceWithId:(id)key
              withId:(id)value {
  [self checkMutate];
  id ovalue = [((id<JavaUtilMap>) NIL_CHK(_impl_)) putWithId:key withId:value];
  [self emitPutWithId:key withId:value withId:ovalue];
  return ovalue;
}

- (id)removeForceWithId:(id)key {
  [self checkMutate];
  id ovalue = [((id<JavaUtilMap>) NIL_CHK(_impl_)) removeWithId:key];
  [self emitRemoveWithId:key withId:ovalue];
  return ovalue;
}

- (id<ReactValueView>)containsKeyViewWithId:(id)key {
  if (key == nil) @throw [[[JavaLangNullPointerException alloc] initWithNSString:@"Must supply non-null 'key'."] autorelease];
  return [[[ReactRMap_$1 alloc] initWithReactRMap:self withId:key] autorelease];
}

- (id<ReactValueView>)getViewWithId:(id)key {
  if (key == nil) @throw [[[JavaLangNullPointerException alloc] initWithNSString:@"Must supply non-null 'key'."] autorelease];
  return [[[ReactRMap_$2 alloc] initWithReactRMap:self withId:key] autorelease];
}

- (id<ReactValueView>)sizeView {
  @synchronized(self) {
    {
      if (_sizeView_ == nil) {
        JreOperatorRetainedAssign(&_sizeView_, self, ((ReactValue *) [ReactValue createWithId:[JavaLangInteger valueOfWithInt:[self size]]]));
        (void) [self connectWithReactRMap_Listener:[[[ReactRMap_$3 alloc] initWithReactRMap:self] autorelease]];
      }
      return _sizeView_;
    }
  }
}

- (int)size {
  return [((id<JavaUtilMap>) NIL_CHK(_impl_)) size];
}

- (BOOL)isEmpty {
  return [((id<JavaUtilMap>) NIL_CHK(_impl_)) isEmpty];
}

- (BOOL)containsKeyWithId:(id)key {
  return [((id<JavaUtilMap>) NIL_CHK(_impl_)) containsKeyWithId:key];
}

- (BOOL)containsValueWithId:(id)value {
  return [((id<JavaUtilMap>) NIL_CHK(_impl_)) containsValueWithId:value];
}

- (NSUInteger)hash {
  return [((id<JavaUtilMap>) NIL_CHK(_impl_)) hash];
}

- (BOOL)isEqual:(id)other {
  return ([other conformsToProtocol: @protocol(JavaUtilMap)]) ? [((id<JavaUtilMap>) NIL_CHK(_impl_)) isEqual:other] : NO;
}

- (NSString *)description {
  return [NSString stringWithFormat:@"RMap%@", _impl_];
}

- (id)getWithId:(id)key {
  return [((id<JavaUtilMap>) NIL_CHK(_impl_)) getWithId:key];
}

- (id)putWithId:(id)key
         withId:(id)value {
  [self checkMutate];
  id ovalue = [((id<JavaUtilMap>) NIL_CHK(_impl_)) putWithId:key withId:value];
  if (![ReactReactor areEqualWithId:value withId:ovalue]) {
    [self emitPutWithId:key withId:value withId:ovalue];
  }
  return ovalue;
}

- (id)removeWithId:(id)rawKey {
  [self checkMutate];
  if (![((id<JavaUtilMap>) NIL_CHK(_impl_)) containsKeyWithId:rawKey]) {
    return nil;
  }
  id key = (id) rawKey;
  id ovalue = [((id<JavaUtilMap>) NIL_CHK(_impl_)) removeWithId:key];
  [self emitRemoveWithId:key withId:ovalue];
  return ovalue;
}

- (void)putAllWithJavaUtilMap:(id<JavaUtilMap>)map {
  {
    id<JavaUtilIterator> iter__ = ((id<JavaUtilIterator>) [((id<JavaUtilSet>) [((id<JavaUtilMap>) NIL_CHK(map)) entrySet]) iterator]);
    while ([((id<JavaUtilIterator>) NIL_CHK(iter__)) hasNext]) {
      id<JavaUtilMap_Entry> entry = ((id<JavaUtilMap_Entry>) [((id<JavaUtilIterator>) NIL_CHK(iter__)) next]);
      (void) [self putWithId:[((id<JavaUtilMap_Entry>) NIL_CHK(entry)) getKey] withId:[((id<JavaUtilMap_Entry>) NIL_CHK(entry)) getValue]];
    }
  }
}

- (void)clear {
  [self checkMutate];
  id<JavaUtilSet> entries = [[[JavaUtilHashSet alloc] initWithJavaUtilCollection:((id<JavaUtilSet>) [((id<JavaUtilMap>) NIL_CHK(_impl_)) entrySet])] autorelease];
  [((id<JavaUtilMap>) NIL_CHK(_impl_)) clear];
  {
    id<JavaUtilIterator> iter__ = ((id<JavaUtilIterator>) [((id<JavaUtilSet>) NIL_CHK(entries)) iterator]);
    while ([((id<JavaUtilIterator>) NIL_CHK(iter__)) hasNext]) {
      id<JavaUtilMap_Entry> entry = ((id<JavaUtilMap_Entry>) [((id<JavaUtilIterator>) NIL_CHK(iter__)) next]);
      [self emitRemoveWithId:[((id<JavaUtilMap_Entry>) NIL_CHK(entry)) getKey] withId:[((id<JavaUtilMap_Entry>) NIL_CHK(entry)) getValue]];
    }
  }
}

- (id<JavaUtilSet>)keySet {
  id<JavaUtilSet> iset = ((id<JavaUtilSet>) [((id<JavaUtilMap>) NIL_CHK(_impl_)) keySet]);
  return [[[ReactRMap_$4 alloc] initWithReactRMap:self withJavaUtilSet:iset] autorelease];
}

- (id<JavaUtilCollection>)values {
  id<JavaUtilCollection> iset = ((id<JavaUtilCollection>) [((id<JavaUtilMap>) NIL_CHK(_impl_)) entrySet]);
  return [[[ReactRMap_$5 alloc] initWithReactRMap:self withJavaUtilCollection:iset] autorelease];
}

- (id<JavaUtilSet>)entrySet {
  id<JavaUtilSet> iset = ((id<JavaUtilSet>) [((id<JavaUtilMap>) NIL_CHK(_impl_)) entrySet]);
  return [[[ReactRMap_$6 alloc] initWithReactRMap:self withJavaUtilSet:iset] autorelease];
}

- (void)emitPutWithId:(id)key
               withId:(id)value
               withId:(id)oldValue {
  [self notifyPutWithId:key withId:value withId:oldValue];
}

- (void)notifyPutWithId:(id)key
                 withId:(id)value
                 withId:(id)oldValue {
  ReactCons *lners = ((ReactCons *) [self prepareNotify]);
  ReactMultiFailureException *error = nil;
  @try {
    for (ReactCons * cons = lners; cons != nil; cons = ((ReactCons *) NIL_CHK(cons)).next) {
      @try {
        [((ReactRMap_Listener *) NIL_CHK(cons.listener)) onPutWithId:key withId:value withId:oldValue];
      }
      @catch (JavaLangThrowable *t) {
        if (error == nil) error = [[[ReactMultiFailureException alloc] init] autorelease];
        [((ReactMultiFailureException *) NIL_CHK(error)) addFailureWithJavaLangThrowable:t];
      }
      if (((ReactCons *) NIL_CHK(cons)).oneShot) [((ReactCons *) NIL_CHK(cons)) disconnect];
    }
  }
  @finally {
    [self finishNotifyWithReactCons:lners];
  }
  if (error != nil) [error trigger];
}

- (void)emitRemoveWithId:(id)key
                  withId:(id)oldValue {
  [self notifyRemoveWithId:key withId:oldValue];
}

- (void)notifyRemoveWithId:(id)key
                    withId:(id)oldValue {
  ReactCons *lners = ((ReactCons *) [self prepareNotify]);
  ReactMultiFailureException *error = nil;
  @try {
    for (ReactCons * cons = lners; cons != nil; cons = ((ReactCons *) NIL_CHK(cons)).next) {
      @try {
        [((ReactRMap_Listener *) NIL_CHK(cons.listener)) onRemoveWithId:key withId:oldValue];
      }
      @catch (JavaLangThrowable *t) {
        if (error == nil) error = [[[ReactMultiFailureException alloc] init] autorelease];
        [((ReactMultiFailureException *) NIL_CHK(error)) addFailureWithJavaLangThrowable:t];
      }
      if (((ReactCons *) NIL_CHK(cons)).oneShot) [((ReactCons *) NIL_CHK(cons)) disconnect];
    }
  }
  @finally {
    [self finishNotifyWithReactCons:lners];
  }
  if (error != nil) [error trigger];
}

- (void)dealloc {
  JreOperatorRetainedAssign(&_sizeView_, self, nil);
  JreOperatorRetainedAssign(&_impl_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  ReactRMap *typedCopy = (ReactRMap *) copy;
  typedCopy._impl = _impl_;
  typedCopy._sizeView = _sizeView_;
}

@end
@implementation ReactRMap_$1

- (ReactRMap *)this$0 {
  return this$0_;
}
- (void)setThis$0:(ReactRMap *)this$0 {
  JreOperatorRetainedAssign(&this$0_, self, this$0);
}
@synthesize this$0 = this$0_;
- (id)val$key {
  return val$key_;
}
- (void)setVal$key:(id)val$key {
  JreOperatorRetainedAssign(&val$key_, self, val$key);
}
@synthesize val$key = val$key_;

- (JavaLangBoolean *)get {
  return [JavaLangBoolean valueOfWithBOOL:[this$0_ containsKeyWithId:val$key_]];
}

- (id<ReactConnection>)connect {
  return [this$0_ connectWithReactRMap_Listener:[[[ReactRMap_$1_$1 alloc] initWithReactRMap_$1:self] autorelease]];
}

- (id)initWithReactRMap:(ReactRMap *)outer$
                 withId:(id)capture$0 {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&this$0_, self, outer$);
    JreOperatorRetainedAssign(&val$key_, self, capture$0);
  }
  return self;
}

- (void)dealloc {
  JreOperatorRetainedAssign(&val$key_, self, nil);
  JreOperatorRetainedAssign(&this$0_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  ReactRMap_$1 *typedCopy = (ReactRMap_$1 *) copy;
  typedCopy.this$0 = this$0_;
  typedCopy.val$key = val$key_;
}

@end
@implementation ReactRMap_Listener

- (void)onPutWithId:(id)key
             withId:(id)value
             withId:(id)oldValue {
  [self onPutWithId:key withId:value];
}

- (void)onPutWithId:(id)key
             withId:(id)value {
}

- (void)onRemoveWithId:(id)key
                withId:(id)oldValue {
  [self onRemoveWithId:key];
}

- (void)onRemoveWithId:(id)key {
}

- (id)init {
  return [super init];
}

- (void)dealloc {
  [super dealloc];
}

@end
@implementation ReactRMap_$1_$1

- (ReactRMap_$1 *)this$0 {
  return this$0_;
}
- (void)setThis$0:(ReactRMap_$1 *)this$0 {
  JreOperatorRetainedAssign(&this$0_, self, this$0);
}
@synthesize this$0 = this$0_;

- (void)onPutWithId:(id)pkey
             withId:(id)value
             withId:(id)ovalue {
  if ([NIL_CHK(this$0_.val$key) isEqual:pkey] && ovalue == nil) [this$0_ notifyChangeWithId:[JavaLangBoolean valueOfWithBOOL:YES] withId:[JavaLangBoolean valueOfWithBOOL:NO]];
}

- (void)onRemoveWithId:(id)rkey
                withId:(id)ovalue {
  if ([NIL_CHK(this$0_.val$key) isEqual:rkey]) [this$0_ notifyChangeWithId:[JavaLangBoolean valueOfWithBOOL:NO] withId:[JavaLangBoolean valueOfWithBOOL:YES]];
}

- (id)initWithReactRMap_$1:(ReactRMap_$1 *)outer$ {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&this$0_, self, outer$);
  }
  return self;
}

- (void)dealloc {
  JreOperatorRetainedAssign(&this$0_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  ReactRMap_$1_$1 *typedCopy = (ReactRMap_$1_$1 *) copy;
  typedCopy.this$0 = this$0_;
}

@end
@implementation ReactRMap_$2

- (ReactRMap *)this$0 {
  return this$0_;
}
- (void)setThis$0:(ReactRMap *)this$0 {
  JreOperatorRetainedAssign(&this$0_, self, this$0);
}
@synthesize this$0 = this$0_;
- (id)val$key {
  return val$key_;
}
- (void)setVal$key:(id)val$key {
  JreOperatorRetainedAssign(&val$key_, self, val$key);
}
@synthesize val$key = val$key_;

- (id)get {
  return [this$0_ getWithId:val$key_];
}

- (id<ReactConnection>)connect {
  return [this$0_ connectWithReactRMap_Listener:[[[ReactRMap_$2_$1 alloc] initWithReactRMap_$2:self] autorelease]];
}

- (id)initWithReactRMap:(ReactRMap *)outer$
                 withId:(id)capture$0 {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&this$0_, self, outer$);
    JreOperatorRetainedAssign(&val$key_, self, capture$0);
  }
  return self;
}

- (void)dealloc {
  JreOperatorRetainedAssign(&val$key_, self, nil);
  JreOperatorRetainedAssign(&this$0_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  ReactRMap_$2 *typedCopy = (ReactRMap_$2 *) copy;
  typedCopy.this$0 = this$0_;
  typedCopy.val$key = val$key_;
}

@end
@implementation ReactRMap_$2_$1

- (ReactRMap_$2 *)this$0 {
  return this$0_;
}
- (void)setThis$0:(ReactRMap_$2 *)this$0 {
  JreOperatorRetainedAssign(&this$0_, self, this$0);
}
@synthesize this$0 = this$0_;

- (void)onPutWithId:(id)pkey
             withId:(id)value
             withId:(id)ovalue {
  if ([NIL_CHK(this$0_.val$key) isEqual:pkey]) [this$0_ notifyChangeWithId:value withId:ovalue];
}

- (void)onRemoveWithId:(id)pkey
                withId:(id)ovalue {
  if ([NIL_CHK(this$0_.val$key) isEqual:pkey]) [this$0_ notifyChangeWithId:nil withId:ovalue];
}

- (id)initWithReactRMap_$2:(ReactRMap_$2 *)outer$ {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&this$0_, self, outer$);
  }
  return self;
}

- (void)dealloc {
  JreOperatorRetainedAssign(&this$0_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  ReactRMap_$2_$1 *typedCopy = (ReactRMap_$2_$1 *) copy;
  typedCopy.this$0 = this$0_;
}

@end
@implementation ReactRMap_$3

- (ReactRMap *)this$0 {
  return this$0_;
}
- (void)setThis$0:(ReactRMap *)this$0 {
  JreOperatorRetainedAssign(&this$0_, self, this$0);
}
@synthesize this$0 = this$0_;

- (void)onPutWithId:(id)key
             withId:(id)value
             withId:(id)ovalue {
  (void) [((ReactValue *) NIL_CHK(this$0_._sizeView)) updateWithId:[JavaLangInteger valueOfWithInt:[this$0_ size]]];
}

- (void)onRemoveWithId:(id)key {
  (void) [((ReactValue *) NIL_CHK(this$0_._sizeView)) updateWithId:[JavaLangInteger valueOfWithInt:[this$0_ size]]];
}

- (id)initWithReactRMap:(ReactRMap *)outer$ {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&this$0_, self, outer$);
  }
  return self;
}

- (void)dealloc {
  JreOperatorRetainedAssign(&this$0_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  ReactRMap_$3 *typedCopy = (ReactRMap_$3 *) copy;
  typedCopy.this$0 = this$0_;
}

@end
@implementation ReactRMap_$4

- (ReactRMap *)this$0 {
  return this$0_;
}
- (void)setThis$0:(ReactRMap *)this$0 {
  JreOperatorRetainedAssign(&this$0_, self, this$0);
}
@synthesize this$0 = this$0_;
- (id<JavaUtilSet>)val$iset {
  return val$iset_;
}
- (void)setVal$iset:(id<JavaUtilSet>)val$iset {
  JreOperatorRetainedAssign(&val$iset_, self, val$iset);
}
@synthesize val$iset = val$iset_;

- (id<JavaUtilIterator>)iterator {
  id<JavaUtilIterator> iiter = ((id<JavaUtilIterator>) [((id<JavaUtilSet>) NIL_CHK(val$iset_)) iterator]);
  return [[[ReactRMap_$4_$1 alloc] initWithReactRMap_$4:self withJavaUtilIterator:iiter] autorelease];
}

- (int)size {
  return [this$0_ size];
}

- (BOOL)removeWithId:(id)o {
  [this$0_ checkMutate];
  id ovalue = [this$0_ getWithId:o];
  BOOL modified = [((id<JavaUtilSet>) NIL_CHK(val$iset_)) removeWithId:o];
  if (modified) {
    id key = (id) o;
    [this$0_ emitRemoveWithId:key withId:ovalue];
  }
  return modified;
}

- (void)clear {
  [this$0_ clear];
}

- (id)initWithReactRMap:(ReactRMap *)outer$
        withJavaUtilSet:(id<JavaUtilSet>)capture$0 {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&this$0_, self, outer$);
    JreOperatorRetainedAssign(&val$iset_, self, capture$0);
  }
  return self;
}

- (void)dealloc {
  JreOperatorRetainedAssign(&val$iset_, self, nil);
  JreOperatorRetainedAssign(&this$0_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  ReactRMap_$4 *typedCopy = (ReactRMap_$4 *) copy;
  typedCopy.this$0 = this$0_;
  typedCopy.val$iset = val$iset_;
}

@end
@implementation ReactRMap_$4_$1

- (ReactRMap_$4 *)this$0 {
  return this$0_;
}
- (void)setThis$0:(ReactRMap_$4 *)this$0 {
  JreOperatorRetainedAssign(&this$0_, self, this$0);
}
@synthesize this$0 = this$0_;
- (id)_current {
  return _current_;
}
- (void)set_current:(id)_current {
  JreOperatorRetainedAssign(&_current_, self, _current);
}
@synthesize _current = _current_;
- (id<JavaUtilIterator>)val$iiter {
  return val$iiter_;
}
- (void)setVal$iiter:(id<JavaUtilIterator>)val$iiter {
  JreOperatorRetainedAssign(&val$iiter_, self, val$iiter);
}
@synthesize val$iiter = val$iiter_;

- (BOOL)hasNext {
  return [((id<JavaUtilIterator>) NIL_CHK(val$iiter_)) hasNext];
}

- (id)next {
  return (JreOperatorRetainedAssign(&_current_, self, [((id<JavaUtilIterator>) NIL_CHK(val$iiter_)) next]));
}

- (void)remove {
  [this$0_.this$0 checkMutate];
  if (_current_ == nil) @throw [[[JavaLangIllegalStateException alloc] init] autorelease];
  id ovalue = [this$0_.this$0 getWithId:_current_];
  [((id<JavaUtilIterator>) NIL_CHK(val$iiter_)) remove];
  [this$0_.this$0 emitRemoveWithId:_current_ withId:ovalue];
  JreOperatorRetainedAssign(&_current_, self, nil);
}

- (id)initWithReactRMap_$4:(ReactRMap_$4 *)outer$
      withJavaUtilIterator:(id<JavaUtilIterator>)capture$0 {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&this$0_, self, outer$);
    JreOperatorRetainedAssign(&val$iiter_, self, capture$0);
  }
  return self;
}

- (void)dealloc {
  JreOperatorRetainedAssign(&val$iiter_, self, nil);
  JreOperatorRetainedAssign(&_current_, self, nil);
  JreOperatorRetainedAssign(&this$0_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  ReactRMap_$4_$1 *typedCopy = (ReactRMap_$4_$1 *) copy;
  typedCopy.this$0 = this$0_;
  typedCopy._current = _current_;
  typedCopy.val$iiter = val$iiter_;
}

@end
@implementation ReactRMap_$5

- (ReactRMap *)this$0 {
  return this$0_;
}
- (void)setThis$0:(ReactRMap *)this$0 {
  JreOperatorRetainedAssign(&this$0_, self, this$0);
}
@synthesize this$0 = this$0_;
- (id<JavaUtilCollection>)val$iset {
  return val$iset_;
}
- (void)setVal$iset:(id<JavaUtilCollection>)val$iset {
  JreOperatorRetainedAssign(&val$iset_, self, val$iset);
}
@synthesize val$iset = val$iset_;

- (id<JavaUtilIterator>)iterator {
  id<JavaUtilIterator> iiter = ((id<JavaUtilIterator>) [((id<JavaUtilCollection>) NIL_CHK(val$iset_)) iterator]);
  return [[[ReactRMap_$5_$1 alloc] initWithReactRMap_$5:self withJavaUtilIterator:iiter] autorelease];
}

- (int)size {
  return [this$0_ size];
}

- (BOOL)containsWithId:(id)o {
  return [this$0_ containsValueWithId:o];
}

- (void)clear {
  [this$0_ clear];
}

- (id)initWithReactRMap:(ReactRMap *)outer$
 withJavaUtilCollection:(id<JavaUtilCollection>)capture$0 {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&this$0_, self, outer$);
    JreOperatorRetainedAssign(&val$iset_, self, capture$0);
  }
  return self;
}

- (void)dealloc {
  JreOperatorRetainedAssign(&val$iset_, self, nil);
  JreOperatorRetainedAssign(&this$0_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  ReactRMap_$5 *typedCopy = (ReactRMap_$5 *) copy;
  typedCopy.this$0 = this$0_;
  typedCopy.val$iset = val$iset_;
}

@end
@implementation ReactRMap_$5_$1

- (ReactRMap_$5 *)this$0 {
  return this$0_;
}
- (void)setThis$0:(ReactRMap_$5 *)this$0 {
  JreOperatorRetainedAssign(&this$0_, self, this$0);
}
@synthesize this$0 = this$0_;
- (id<JavaUtilMap_Entry>)_current {
  return _current_;
}
- (void)set_current:(id<JavaUtilMap_Entry>)_current {
  JreOperatorRetainedAssign(&_current_, self, _current);
}
@synthesize _current = _current_;
- (id<JavaUtilIterator>)val$iiter {
  return val$iiter_;
}
- (void)setVal$iiter:(id<JavaUtilIterator>)val$iiter {
  JreOperatorRetainedAssign(&val$iiter_, self, val$iiter);
}
@synthesize val$iiter = val$iiter_;

- (BOOL)hasNext {
  return [((id<JavaUtilIterator>) NIL_CHK(val$iiter_)) hasNext];
}

- (id)next {
  return [(JreOperatorRetainedAssign(&_current_, self, ((id<JavaUtilMap_Entry>) [((id<JavaUtilIterator>) NIL_CHK(val$iiter_)) next]))) getValue];
}

- (void)remove {
  [this$0_.this$0 checkMutate];
  [((id<JavaUtilIterator>) NIL_CHK(val$iiter_)) remove];
  [this$0_.this$0 emitRemoveWithId:[((id<JavaUtilMap_Entry>) NIL_CHK(_current_)) getKey] withId:[((id<JavaUtilMap_Entry>) NIL_CHK(_current_)) getValue]];
  JreOperatorRetainedAssign(&_current_, self, nil);
}

- (id)initWithReactRMap_$5:(ReactRMap_$5 *)outer$
      withJavaUtilIterator:(id<JavaUtilIterator>)capture$0 {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&this$0_, self, outer$);
    JreOperatorRetainedAssign(&val$iiter_, self, capture$0);
  }
  return self;
}

- (void)dealloc {
  JreOperatorRetainedAssign(&val$iiter_, self, nil);
  JreOperatorRetainedAssign(&_current_, self, nil);
  JreOperatorRetainedAssign(&this$0_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  ReactRMap_$5_$1 *typedCopy = (ReactRMap_$5_$1 *) copy;
  typedCopy.this$0 = this$0_;
  typedCopy._current = _current_;
  typedCopy.val$iiter = val$iiter_;
}

@end
@implementation ReactRMap_$6

- (ReactRMap *)this$0 {
  return this$0_;
}
- (void)setThis$0:(ReactRMap *)this$0 {
  JreOperatorRetainedAssign(&this$0_, self, this$0);
}
@synthesize this$0 = this$0_;
- (id<JavaUtilSet>)val$iset {
  return val$iset_;
}
- (void)setVal$iset:(id<JavaUtilSet>)val$iset {
  JreOperatorRetainedAssign(&val$iset_, self, val$iset);
}
@synthesize val$iset = val$iset_;

- (id<JavaUtilIterator>)iterator {
  id<JavaUtilIterator> iiter = ((id<JavaUtilIterator>) [((id<JavaUtilSet>) NIL_CHK(val$iset_)) iterator]);
  return [[[ReactRMap_$6_$1 alloc] initWithReactRMap_$6:self withJavaUtilIterator:iiter] autorelease];
}

- (BOOL)containsWithId:(id)o {
  return [((id<JavaUtilSet>) NIL_CHK(val$iset_)) containsWithId:o];
}

- (BOOL)removeWithId:(id)o {
  [this$0_ checkMutate];
  BOOL modified = [((id<JavaUtilSet>) NIL_CHK(val$iset_)) removeWithId:o];
  if (modified) {
    id<JavaUtilMap_Entry> entry = (id<JavaUtilMap_Entry>) o;
    [this$0_ emitRemoveWithId:[((id<JavaUtilMap_Entry>) NIL_CHK(entry)) getKey] withId:[((id<JavaUtilMap_Entry>) NIL_CHK(entry)) getValue]];
  }
  return modified;
}

- (int)size {
  return [this$0_ size];
}

- (void)clear {
  [this$0_ clear];
}

- (id)initWithReactRMap:(ReactRMap *)outer$
        withJavaUtilSet:(id<JavaUtilSet>)capture$0 {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&this$0_, self, outer$);
    JreOperatorRetainedAssign(&val$iset_, self, capture$0);
  }
  return self;
}

- (void)dealloc {
  JreOperatorRetainedAssign(&val$iset_, self, nil);
  JreOperatorRetainedAssign(&this$0_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  ReactRMap_$6 *typedCopy = (ReactRMap_$6 *) copy;
  typedCopy.this$0 = this$0_;
  typedCopy.val$iset = val$iset_;
}

@end
@implementation ReactRMap_$6_$1

- (ReactRMap_$6 *)this$0 {
  return this$0_;
}
- (void)setThis$0:(ReactRMap_$6 *)this$0 {
  JreOperatorRetainedAssign(&this$0_, self, this$0);
}
@synthesize this$0 = this$0_;
- (id<JavaUtilMap_Entry>)_current {
  return _current_;
}
- (void)set_current:(id<JavaUtilMap_Entry>)_current {
  JreOperatorRetainedAssign(&_current_, self, _current);
}
@synthesize _current = _current_;
- (id<JavaUtilIterator>)val$iiter {
  return val$iiter_;
}
- (void)setVal$iiter:(id<JavaUtilIterator>)val$iiter {
  JreOperatorRetainedAssign(&val$iiter_, self, val$iiter);
}
@synthesize val$iiter = val$iiter_;

- (BOOL)hasNext {
  return [((id<JavaUtilIterator>) NIL_CHK(val$iiter_)) hasNext];
}

- (id<JavaUtilMap_Entry>)next {
  JreOperatorRetainedAssign(&_current_, self, ((id<JavaUtilMap_Entry>) [((id<JavaUtilIterator>) NIL_CHK(val$iiter_)) next]));
  return [[[ReactRMap_$6_$1_$1 alloc] initWithReactRMap_$6_$1:self] autorelease];
}

- (void)remove {
  [this$0_.this$0 checkMutate];
  [((id<JavaUtilIterator>) NIL_CHK(val$iiter_)) remove];
  [this$0_.this$0 emitRemoveWithId:[((id<JavaUtilMap_Entry>) NIL_CHK(_current_)) getKey] withId:[((id<JavaUtilMap_Entry>) NIL_CHK(_current_)) getValue]];
  JreOperatorRetainedAssign(&_current_, self, nil);
}

- (id)initWithReactRMap_$6:(ReactRMap_$6 *)outer$
      withJavaUtilIterator:(id<JavaUtilIterator>)capture$0 {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&this$0_, self, outer$);
    JreOperatorRetainedAssign(&val$iiter_, self, capture$0);
  }
  return self;
}

- (void)dealloc {
  JreOperatorRetainedAssign(&val$iiter_, self, nil);
  JreOperatorRetainedAssign(&_current_, self, nil);
  JreOperatorRetainedAssign(&this$0_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  ReactRMap_$6_$1 *typedCopy = (ReactRMap_$6_$1 *) copy;
  typedCopy.this$0 = this$0_;
  typedCopy._current = _current_;
  typedCopy.val$iiter = val$iiter_;
}

@end
@implementation ReactRMap_$6_$1_$1

- (ReactRMap_$6_$1 *)this$0 {
  return this$0_;
}
- (void)setThis$0:(ReactRMap_$6_$1 *)this$0 {
  JreOperatorRetainedAssign(&this$0_, self, this$0);
}
@synthesize this$0 = this$0_;
- (id<JavaUtilMap_Entry>)_ientry {
  return _ientry_;
}
- (void)set_ientry:(id<JavaUtilMap_Entry>)_ientry {
  JreOperatorRetainedAssign(&_ientry_, self, _ientry);
}
@synthesize _ientry = _ientry_;

- (id)getKey {
  return [((id<JavaUtilMap_Entry>) NIL_CHK(_ientry_)) getKey];
}

- (id)getValue {
  return [((id<JavaUtilMap_Entry>) NIL_CHK(_ientry_)) getValue];
}

- (id)setValueWithId:(id)value {
  [this$0_.this$0.this$0 checkMutate];
  if (![((id<JavaUtilSet>) NIL_CHK(this$0_.this$0.val$iset)) containsWithId:self]) @throw [[[JavaLangIllegalStateException alloc] initWithNSString:@"Cannot update removed map entry."] autorelease];
  id ovalue = [((id<JavaUtilMap_Entry>) NIL_CHK(_ientry_)) setValueWithId:value];
  if (![ReactReactor areEqualWithId:value withId:ovalue]) {
    [this$0_.this$0.this$0 emitPutWithId:[((id<JavaUtilMap_Entry>) NIL_CHK(_ientry_)) getKey] withId:value withId:ovalue];
  }
  return ovalue;
}

- (BOOL)isEqual:(id)o {
  return [((id<JavaUtilMap_Entry>) NIL_CHK(_ientry_)) isEqual:o];
}

- (NSUInteger)hash {
  return [((id<JavaUtilMap_Entry>) NIL_CHK(_ientry_)) hash];
}

- (id)initWithReactRMap_$6_$1:(ReactRMap_$6_$1 *)outer$ {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&this$0_, self, outer$);
    JreOperatorRetainedAssign(&_ientry_, self, outer$._current);
  }
  return self;
}

- (void)dealloc {
  JreOperatorRetainedAssign(&_ientry_, self, nil);
  JreOperatorRetainedAssign(&this$0_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  ReactRMap_$6_$1_$1 *typedCopy = (ReactRMap_$6_$1_$1 *) copy;
  typedCopy.this$0 = this$0_;
  typedCopy._ientry = _ientry_;
}

@end