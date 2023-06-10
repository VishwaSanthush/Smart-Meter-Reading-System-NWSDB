<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Details</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-KRdPz+rZHHlj2+/TbzT6UfJ6Uu+6lNgVn8uLW1Jf7G+ZuyYsV9dCY0WfIvzw/XSoGfvHWeC7c8eWiqQLvM+cZQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>

    <br><br><br>

    <div style="text-align:center;">
        <h1><strong>Customer Details</strong></h1>
    </div>
    <br>

    <div class="container mt-3">
        <style>
            .form-group label {
                text-align: center;
            }
        </style>
        </head>

        <div>
            <div>
                <form method="POST" action="">
                    <div class="form-group">
                        <label for="textInput"><h2><strong>Customer ID</strong></h2></label>
                        <input type="text" class="form-control" id="textInput" name="customerID" placeholder="Enter Customer ID">
                    </div>
                    <div class="form-group">
                        <label for="textInput" style="text-align:center"><h2><strong>Account Number</strong></h2></label>
                        <input type="text" class="form-control" id="textInput" name="accountNumber" placeholder="Enter Customer Account Number">
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary" name="searchBtn"><i class="fa-solid fa-folder-magnifying-glass" style="color: #000000;"></i> Search</button>
                    </div>
                </form>

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
                    $sql = "SELECT * FROM csdataa WHERE customerID = '$customerID' AND accountNumber = '$accountNumber'";
                    $result = $conn->query($sql);

                    // Display the query results in a table
                    if ($result->num_rows > 0) {
                        echo "<br><br><div class='table-responsive'><table class='table'><thead><tr><th>No</th><th>Date</th><th>Time</th><th>Meter Reader ID</th><th>Meter Reading</th><th>Comments</th><th>Reference</th></tr></thead><tbody>";
                        // Output data of each row
                        while ($row = $result->fetch_assoc()) {
                            echo "<tr><td>" . $row["no"] . "</td><td>" . $row["date"] . "</td><td>" . $row["time"] . "</td><td>" . $row["meterReaderID"] . "</td><td>" . $row["meterReading"] . "</td><td>" . $row["comments"] . "</td><td>" . $row["reference"] . "</td></tr>";
                        }
                        echo "</tbody></table></div>";
                    } else {
                        echo "0 results";
                    }

                    // Close the database connection
                    $conn->close();
                }
                ?>

            </div>
        </div>
    </div>
</body>

</html>
