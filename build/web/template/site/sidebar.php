<?php include 'DBCon.php'; ?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title> </title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->       
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    </head><!--/head-->

    <body>

        <div class="col-sm-3">
            <div class="left-sidebar">
                <h2>Subjects</h2>
                <div class="panel-group category-products" id="accordian"><!--category-productsr-->
                    <?php
                    $res = mysqli_query($con, "SELECT * FROM type order by name");

                    if ($res) {
                        while ($row = mysqli_fetch_array($res)) {
                            ?>
                            <div class="panel panel-default">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h2 class="panel-title"><a href="#"><?php echo $row['name'] ?></a></h2>
                                    </div>
                                </div>
                            </div>
                            <?php
                            $idd = $row['idtype'];
                            $tes = mysqli_query($con, "SELECT name FROM subject WHERE type='%" . $idd . "%' ORDER BY name");

                            if ($tes) {
                                $tow = mysqli_fetch_array($tes);
//                                echo "eee".$tow;
                                while ($tow = mysqli_fetch_array($tes)) {
                                    echo $tow;
                                    ?>
                                    <div class="panel panel-default">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title"><a href="#"><?php echo $tow['jname'] ?></a></h4>
                                            </div>
                                        </div>
                                    </div>
                                    <?php
                                }
                            }
                        }
                    }
                    ?>


                </div><!--/category-products-->




            </div>
        </div>




        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>