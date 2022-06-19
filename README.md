# LidlAnalysis

This code parses the text from images of Lidl receipts created by the Lidl Plus app and stores the data in a mySQL database, and creates price graphs from this data.

## Requirements
* Windows
* mysql (I used 8.0.27)
* LabVIEW 2018 or higher with Vision Development Module

## How to use
### Setting Up Database
You can import the structure from *\resources\sqlTemplate\shoppingdata_structure_only.sql*

### Exporting Receipts
Download your receipts from the Lidl Plus App (*More>Digital Receipts>Select receipt>Download*) and put them in the *\resources\receiptImages\* folder (needs creating). Then open and run *\sourcecode\Lidl Analysis.lvproj Main.lvlib:Main.vi* each time you want to parse a receipt, correcting any incorrect data as you go until the total amount matches that at teh bottom of the receipt. This VI will tell you when you have completed all receipts.

### Displaying Graphs
You can view price graphs if you have a suitable WAMP stack installed.
e.g. download WampServer 3.2.6 (make a backup of your databases first as they may get overwritten), set up phpmyadmin to be able to access your mysql database, and paste contents of *\resources\web\* into *C:\wamp64\www*. Then you can view graphs of any itemNames from your database in a browse using *http://localhost/itemPriceGraph.html?itemName=&lt;ItemName&gt*; e.g.   *http://localhost/itemPriceGraph.html?itemName=MildOnions* . This uses Google Charts.

## Known Limitations
The detection of spaces between words in the receipt is not built in. Most text is CamelCase (and there is a function that will backconvert this) but it tends to get confused when words start with numbers e.g. 6FRangeEggs. Also 50p discounts don't always get applied. There is the opportunity to correct errors (e.g. add any missed discounts or missing items) during parsing.