<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$con = mysqli_connect("localhost", "root", "1234", "bpoms", "3306");
if (mysqli_connect_errno()) {
    echo "Failed to connect to MySQL : " . mysqli_connect_errno();
} else {
//    echo '<h5>MySQL connected :P</h5>';
}
?>
