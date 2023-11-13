<?php
include 'conn.php';
// delete sql query
$sql = "DELETE FROM users WHERE id = ?";

// prepare the sql statement
if($stmt = $mysqli->prepare($sql)){

    // bind the id of the record to be deleted
    // we use "i" here for integer
    $stmt->bind_param("i", $_GET['id']);

    // execute the delete statement
    if($stmt->execute()){
    
        // close the prepared statement
        $stmt->close();
                // redirect to index page
        // parameter "action=deleted" is used to show that something was deleted
       header('Location: index.php?action=deleted');
	   

    }else{
        die("Unable to delete.");
    }
}
?>

//Example 2
//AJAX Example
// document 1
<html>
<head>
<script>
function showUser(str) {
    if (str == "") {
        document.getElementById("txtHint").innerHTML = "";
        return;
    } else { 
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                document.getElementById("txtHint").innerHTML = xmlhttp.responseText;
            }
        };
        xmlhttp.open("GET","getuser.php?q="+str,true);
        xmlhttp.send();
    }
}
</script>
</head>
<body>

<form>
<img src="2.jpg" width=500px height=900px />
<select name="users" onchange="showUser(this.value)">
  <option value="">Select a person:</option>
  <option value="1">Record 1</option>
  <option value="2">Record 2</option>
  <option value="3">Record 3</option>

  </select>
</form>
<br>
<div id="txtHint"><b>Person information...</b></div>
</body>
</html>

//document 2
<!DOCTYPE html>
<html>
<head>
<style>
table {
    width: 100%;
    border-collapse: collapse;
}

table, td, th {
    border: 1px solid black;
    padding: 5px;
}

th {text-align: left;}
</style>
</head>
<body>
<h1> AJAX RESPONSE </h1>
<?php
$q = $_GET['q'];

$con = mysqli_connect('localhost','root','','mydb');
if (!$con) {
    die('Could not connect: ' . mysqli_error($con));
}
$sql="SELECT * FROM customers WHERE id = '".$q."'";
$result = mysqli_query($con,$sql);

echo "<table>
<tr>
<th>Name</th>
<th>Address</th>
<th>Phone</th>
</tr>";
while($row = mysqli_fetch_array($result)) {
    echo "<tr>";
    echo "<td>" . $row['name'] . "</td>";
    echo "<td>" . $row['address'] . "</td>";
    echo "<td>" . $row['phone'] . "</td>";
    echo "</tr>";
}
echo "</table>";
mysqli_close($con);
?>
</body>
</html>
