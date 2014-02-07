// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Item.h instead.

#import <CoreData/CoreData.h>


extern const struct ItemAttributes {
	__unsafe_unretained NSString *info;
	__unsafe_unretained NSString *isDone;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *order;
	__unsafe_unretained NSString *tag;
} ItemAttributes;

extern const struct ItemRelationships {
	__unsafe_unretained NSString *folder;
} ItemRelationships;

extern const struct ItemFetchedProperties {
} ItemFetchedProperties;

@class Folder;







@interface ItemID : NSManagedObjectID {}
@end

@interface _Item : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ItemID*)objectID;





@property (nonatomic, strong) NSString* info;



//- (BOOL)validateInfo:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* isDone;



@property BOOL isDoneValue;
- (BOOL)isDoneValue;
- (void)setIsDoneValue:(BOOL)value_;

//- (BOOL)validateIsDone:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* order;



@property int16_t orderValue;
- (int16_t)orderValue;
- (void)setOrderValue:(int16_t)value_;

//- (BOOL)validateOrder:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* tag;



//- (BOOL)validateTag:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Folder *folder;

//- (BOOL)validateFolder:(id*)value_ error:(NSError**)error_;





@end

@interface _Item (CoreDataGeneratedAccessors)

@end

@interface _Item (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveInfo;
- (void)setPrimitiveInfo:(NSString*)value;




- (NSNumber*)primitiveIsDone;
- (void)setPrimitiveIsDone:(NSNumber*)value;

- (BOOL)primitiveIsDoneValue;
- (void)setPrimitiveIsDoneValue:(BOOL)value_;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSNumber*)primitiveOrder;
- (void)setPrimitiveOrder:(NSNumber*)value;

- (int16_t)primitiveOrderValue;
- (void)setPrimitiveOrderValue:(int16_t)value_;




- (NSString*)primitiveTag;
- (void)setPrimitiveTag:(NSString*)value;





- (Folder*)primitiveFolder;
- (void)setPrimitiveFolder:(Folder*)value;


@end
