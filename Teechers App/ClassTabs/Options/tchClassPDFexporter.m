//
//  tchClassPDFexporter.m
//  Teechers App
//
//  Created by fran on 8/22/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import "tchClassPDFexporter.h"

@implementation tchClassPDFexporter

-(NSString*)getPDF
{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"classshare.pdf"];
    
    NSData *pdfData = [self generatePDF]; // data representing your created PDF
    NSError *error = nil;
    
    if ([pdfData writeToFile:filePath options:NSDataWritingAtomic error:&error]) {
        // file saved
    } else {
        // error writing file
        NSLog(@"Unable to write PDF to %@. Error: %@", filePath, error);
    }
    
    // return the file path
    return filePath;
    
}

-(NSData*) generatePDF
{
    
    
    // initialize the pdf data
    NSMutableData *pdfData = [NSMutableData data];
    
    // PDF metadata
    NSDictionary *pdfMetaData = [NSDictionary dictionaryWithObjectsAndKeys:@"Class Export", kCGPDFContextTitle, @"Teechers app", kCGPDFContextCreator, nil];

    // initialize the PDF CONTEXT
    UIGraphicsBeginPDFContextToData(pdfData, CGRectZero, pdfMetaData);
    
    
    //CFRange currentRange = CFRangeMake(0, 0);
    NSInteger currentPage = 0;
    //BOOL done = NO;
    
    
    // Mark the beginning of a new page.
    UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, 612, 792), nil);
    
    
    // --------------------------------------------------------------------------------
    // Drawing a page
    // --------------------------------------------------------------------------------
    
    
    NSString *pageString = [NSString stringWithFormat:@"Page %d", currentPage+1];
    UIFont *theFont = [UIFont systemFontOfSize:12];
    //CGSize maxSize = CGSizeMake(612, 72);
    
    //CGSize pageStringSize = [pageString sizeWithFont:theFont constrainedToSize:maxSize lineBreakMode:UILineBreakModeClip];

    CGSize pageStringSize = [pageString sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:17.0f]}];
    
    CGRect stringRect = CGRectMake(((612.0 - pageStringSize.width) / 2.0),
                                   720.0 + ((72.0 - pageStringSize.height) / 2.0),
                                   pageStringSize.width,
                                   pageStringSize.height);
    
    //[pageString drawInRect:stringRect withFont:theFont];
    
    [pageString drawInRect:stringRect withAttributes:@{NSFontAttributeName: theFont}];
    
   

    // --------------------------------------------------------------------------------
    // End of drawing a page
    // --------------------------------------------------------------------------------
    
    
    // Close the PDF CONTEXT and write the contents out.
    UIGraphicsEndPDFContext();
    
    return pdfData;
}

@end
