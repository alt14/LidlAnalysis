<?php
ob_start();
header('Content-Type:application/json');

//use your custom data
$dbhost   ='localhost';
$dbuser   ='root';
$dbpass   ='Quartzelec1';
$dbname   ='shoppingdata';
$dbtable  ='price_and_date';


//db-connection
$mysqli = new mysqli($dbhost,$dbuser,$dbpass,$dbname);


if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}

//prepare the datatable
$table = array('cols'=>array(
                              array('label' => 'DateTime', 
                                    'type'  => 'datetime'),
                              array('label' => 'Price Before Discount',
                                    'type'  => 'number')),
									
                'rows'=>array()
);

$itemName = $_GET["ItemName"];


//build the query
$sql="SELECT 
              CONCAT(
                     'Date(',
                     YEAR(TimeStamp),
                     ',',
                     Month(TimeStamp)-1,
                     DATE_FORMAT(TimeStamp,',%e,%k,%i,'),
                     '0)'
                    ) 
                        as `datetime`,
                            `PricePerUnitBeforeDiscount`
              FROM `{$dbtable}` WHERE ItemName = '".$itemName."';";

//run the query  
if ($result = $mysqli->query($sql)) {
    while ($row = $result->fetch_assoc()) {

        //populate the rows-array
        $table['rows'][]=array('c'=>array(
                                            array('v'=>$row['datetime']),
                                            array('v'=>$row['PricePerUnitBeforeDiscount'])
                                         )
                              );
    }
    $result->close();
}
ob_end_clean();
die(json_encode($table));
?>