<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="ACADEMIC.css">
    </head>
    <body>
        <div class="container my-2 mx-5 text-warning fs-5">
            <h3 class="text-center">School Academics</h3>
            <form method="get" action="ACADEMICS2">
                <div class="row">
                    <label for="" class="col-sm-2 col-form-label">Select a class</label>
                    <div class="col-sm-6 mt-2">
                        <select class="form-select" aria-label="Default select example" name="CLASS">
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
                    </div>
                    <button type="submit" class="btn btn-outline-warning col-sm-2 ms-5 fs-5">Submit</button
                </div>
            </form>   
        </div>

    
    </body>
</html>
