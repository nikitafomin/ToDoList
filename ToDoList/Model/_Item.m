// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Item.m instead.

#import "_Item.h"

const struct ItemAttributes ItemAttributes = {
	.info = @"info",
	.isDone = @"isDone",
	.name = @"name",
	.order = @"order",
	.tag = @"tag",
};

const struct ItemRelationships ItemRelationships = {
	.folder = @"folder",
};

const struct ItemFetchedProperties ItemFetchedProperties = {
};

@implementation ItemID
@end

@implementation _Item

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Item" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Item";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Item" inManagedObjectContext:moc_];
}

- (ItemID*)objectID {
	return (ItemID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"isDoneValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"isDone"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"orderValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"order"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic info;






@dynamic isDone;



- (BOOL)isDoneValue {
	NSNumber *result = [self isDone];
	return [result boolValue];
}

- (void)setIsDoneValue:(BOOL)value_ {
	[self setIsDone:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveIsDoneValue {
	NSNumber *result = [self primitiveIsDone];
	return [result boolValue];
}

- (void)setPrimitiveIsDoneValue:(BOOL)value_ {
	[self setPrimitiveIsDone:[NSNumber numberWithBool:value_]];
}





@dynamic name;






@dynamic order;



- (int16_t)orderValue {
	NSNumber *result = [self order];
	return [result shortValue];
}

- (void)setOrderValue:(int16_t)value_ {
	[self setOrder:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveOrderValue {
	NSNumber *result = [self primitiveOrder];
	return [result shortValue];
}

- (void)setPrimitiveOrderValue:(int16_t)value_ {
	[self setPrimitiveOrder:[NSNumber numberWithShort:value_]];
}





@dynamic tag;






@dynamic folder;

	






@end
