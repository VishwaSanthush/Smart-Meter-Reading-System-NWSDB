<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Details</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>

<body>

    <br><br>
    <div style="text-align:center;">
        <h1><strong>Customer Details</strong></h1>
    </div>
    <br><br><br>
    <style>


        .center {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        
        .search-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
    </style>
    </head>


    <div class="center">
        <form method="POST">
            <div class="form-group">
                <input type="text" class="form-control" id="textInput1" name="customerID" placeholder="Customer ID">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" id="textInput2" name="accountNumber" placeholder="Account Number">
            </div>
            <div class="search-container">
                <button class="btn btn-primary" type="submit" name="searchBtn"><i class="fas fa-search"></i> Search</button>
            </div>
        </form>
        <br><br>
        
    



    <div class="container">
        <div class="row justify-content-center mt-5">
            <div class="col-md-8">
                <form>

              
                    <?php
// Check if the form is submitted
if (isset($_POST['searchBtn'])) {
    // Retrieve the entered customer ID and account number
    $customerID = $_POST['customerID'];
    $accountNumber = $_POST['accountNumber'];

    // Perform database connection
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "nwsdb";

    // Create a database connection
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Prepare and execute the query
    $sql = "SELECT * FROM csdataaaa WHERE customerID = '$customerID' AND accountNumber = '$accountNumber'";
    $result = $conn->query($sql);

    // Display the query results in a table
    if ($result->num_rows > 0) {
        // Retrieve the first row of data
        $row = $result->fetch_assoc();

        // Assign the data to variables
        $name = $row["name"];
        
        $phone = $row["phone"];

        // Output the data to the respective text fields
        echo '
        <form>
            <div class="form-group">
                <input type="text" class="form-control" id="name" placeholder="Customer ID" readonly value="' . $name . '">
            </div>
            <div class="form-group">
            <div class="form-group">
                <input type="text" class="form-control" id="phone" placeholder="T.P" readonly value="' . $phone . '">
            </div>
        </form>
        ';

        // Output the data in the table
        echo '
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>NO</th>
                    <th>Accounts</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody id="table-body">
                <tr>
                    <td>' . $row["no"] . '</td>
                    <td>' . $row["accounts"] . '</td>
                    <td>' . $row["description"] . '</td>
                </tr>
            </tbody>
        </table>
        ';
    } else {
        echo "<p>No results found.</p>";
    }

    // Close the database connection
    $conn->close();
}
?>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
    </div>
    </div>
    </div>




    <!-- Bootstrap JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>

</html>
