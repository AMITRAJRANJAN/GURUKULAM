<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    </head>
    <body>
        <div class="card text-center mx-5 my-2">
            <div class="card-body">
                <h5 class="card-title">Enter the details for new fee</h5>
                <form method="get" action="CREATEMONTHLYFEE2">
                    <select class="form-select my-2" aria-label="Default select example" name="MONTH">
                        <option selected>Select Month</option>
                        <option value="01APRIL">April</option>
                        <option value="02MAY">May</option>
                        <option value="03JUNE">June</option>
                        <option value="04JULY">July</option>
                        <option value="05AUGUST">August</option>
                        <option value="06SEPTEMBER">September</option>
                        <option value="07OCTOBER">October</option>
                        <option value="08NOVEMBER">November</option>
                        <option value="09DECEMBER">December</option>
                        <option value="10JANUARY">January</option>
                        <option value="11FEBRUARY">February</option>
                        <option value="12MARCH">March</option>
                    </select>

                    <select class="form-select my-2" aria-label="Default select example" name="CLASS">
                        <option selected>Select a class</option>
                        <option value="1">Class 1</option>
                        <option value="2">Class 2</option>
                        <option value="3">Class 3</option>
                        <option value="4">Class 4</option>
                        <option value="5">Class 5</option>
                        <option value="6">Class 6</option>
                        <option value="7">Class 7</option>
                        <option value="8">Class 8</option>
                        <option value="9">Class 9</option>
                        <option value="10">Class 10</option>
                    </select>
                    <div class="form-floating mb-3 my-2">
                        <input type="text" class="form-control" id="floatingInput" placeholder="name@example.com" name="FEEAMOUNT">
                        <label for="floatingInput">Fee Amount</label>
                    </div>
                    <button type="submit" class="btn btn-outline-warning">Submit</button>
                    <button type="reset" class="btn btn-outline-danger">Reset</button>
                    
                </form>
            </div>    
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

    </body>
</html>
