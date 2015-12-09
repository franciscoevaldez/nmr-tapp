//
//  tchEditGradeTable.m
//  Teechers App
//
//  Created by fran on 12/8/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import "tchEditGradeTable.h"
#import "Evaluation.h"

@implementation tchEditGradeTable

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark - Cell data handling
// refresh the data array with an updated cell
-(void)refreshDataFromCell:(tchEditFormTableCell*)cell{
    
    // skip if there is no property assigned
    if ([cell.propertyName isEqualToString:@""]) {return;}
    
    // get the value from the cell
    id newValue = cell.value;
    
    // new evaluation abbreviation
    // if the changed cell is the name cell
    if ([cell.propertyName isEqualToString:@"name"]) {
        
        // get the text from the cell
        NSString *newShortName = (NSString*)cell.value;
        
        // Abbreviation steps here! ------------------------------------------
        /*
        // crop the first two letters and capitalize them
        newShortName = [[newShortName substringToIndex:2] uppercaseString];
        
        */
        // Abbreviation steps end here! --------------------------------------
        
        
        
        
        
        // Abbreviation steps here! ------------------------------------------
        
        // get words into an array
        NSMutableArray *wordArray = [NSMutableArray arrayWithArray:[newShortName componentsSeparatedByString:@" "]];
        
        // delete 1, 2 and 3 letter words
        NSMutableIndexSet *wordIndexesToDelete = [NSMutableIndexSet indexSet];
        NSUInteger index = 0;
        
        for (id aWord in wordArray) {
            
            NSString *currentWord = (NSString*) aWord;
            
            // if the word is not a number and has less than 3 characters, discard it
            if ([currentWord length] <= 3
                && [currentWord rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]].location == NSNotFound) {
                
                [wordIndexesToDelete addIndex:index];
                
            }
            
            index++;
            
        }
        
        [wordArray removeObjectsAtIndexes:wordIndexesToDelete];
        
        // if there is only one word, crop the first two letters and use them
        if ([wordArray count]==1) {
            newShortName = [newShortName substringToIndex:2];
        }
        
        // otherwise get the first two initials
        if ([wordArray count]>1) {
            NSString *newInitials = [NSString new];
            
            for (NSString* currentWord in wordArray) {
                
                NSString *currentInitial = [currentWord substringToIndex:1];
                newInitials = [newInitials stringByAppendingString:currentInitial];
                
            }
            
            newShortName = [newInitials substringToIndex:2];
            
        }
        
        // check for duplicates  ---------------------------------------------
        BOOL hasDuplicates = false;
        NSUInteger tryCount = 1;
        NSString *currentCandidate = newShortName;
        
        // get the current short name list
        NSArray *currentAbbs = [self.activeClass getEvalAbbreviations];
        
        // if we are editing, remove the original one
        
        NSString *currentAbbreviation = [self.formDataDict objectForKey:@"nameShort"];
        
        if (currentAbbreviation) {
            
            // create a temporary mutable array
            NSMutableArray *tempArray = [NSMutableArray arrayWithArray:currentAbbs];
            
            // remove the current abbreviation from the temp array
            [tempArray removeObject:currentAbbreviation];
            
            // pass the temp array to the final one
            currentAbbs = [NSArray arrayWithArray:tempArray];
            
        }
        
        // test until there are no duplicates
        do {
            
            hasDuplicates = false;
            
            // check for the existance of the current abbreviation
            if ([currentAbbs containsObject:currentCandidate]) {
                
                // flag there are duplicates
                hasDuplicates = true;
                
                // set range for replacement
                NSRange range = NSMakeRange(1, 1);
                
                // add the number count to the second character
                currentCandidate = [currentCandidate stringByReplacingCharactersInRange:range withString:[NSString stringWithFormat:@"%lu", (unsigned long)tryCount]];
                
                // increase the count in case a repeat is needed
                tryCount++;
                
            } else {
                
                newShortName = currentCandidate;
                
            }
            
            
        } while (hasDuplicates == true);
        
        
        
        
        // capitalize the letters
        newShortName = [newShortName uppercaseString];
        
        
        
        // Abbreviation steps end here! --------------------------------------
        
        // pass it to the temp dictionary
        [self.formDataDict setValue:newShortName forKey:@"nameShort"];
        
        // tell the data source to reload the second cell
        NSIndexPath *secondRow = [NSIndexPath indexPathForRow:3 inSection:0];
        NSArray *rowsToReload = [NSArray arrayWithObject:secondRow];
        [self reloadRowsAtIndexPaths:rowsToReload withRowAnimation:UITableViewRowAnimationFade];
        
        
    }
    
    // update the value in the temp dictionary
    [self.formDataDict setValue:newValue forKey:cell.propertyName];
    
    
}


@end
