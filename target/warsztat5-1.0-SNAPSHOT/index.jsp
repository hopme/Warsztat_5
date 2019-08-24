<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="pl">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>Books</title>
</head>
<body>

<div class="container">
    <h1>Książki</h1>

    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home"
               aria-selected="true">Dodaj książkę</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
               aria-selected="false">Pełna lista książek</a>
        </li>

    </ul>
    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">

            <h2>Dodaj książkę</h2>
            <p>Wypełnij formularz by dodać nową książkę</p>


            <form id="addBookForm" role="form">
                <div class="form-group">
                    <label for="title">Title</label>
                    <input type="text" class="form-control" id="title" placeholder="Title..." required>
                </div>
                <div class="form-group">
                    <label for="author">Author</label>
                    <input type="text" class="form-control" id="author" placeholder="Author..." required>
                </div>
                <div class="form-group">
                    <label for="publisher">Publisher</label>
                    <input type="text" class="form-control" id="publisher" placeholder="Publisher..." required>
                </div>
                <div class="form-group">
                    <label for="type">Type</label>
                    <input type="text" class="form-control" id="type" placeholder="Type..." required>
                </div>
                <div class="form-group">
                    <label for="isbn">Isbn</label>
                    <input type="number" class="form-control" id="isbn" placeholder="Isbn..." required>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>


        </div>
        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">

            <h2>Lista dodanych książek:</h2>
            <p>Możesz edytować/usunąć dodane książki</p>

    <!--tutaj wyswietla sie lista dodanych ksiazek-->
            <div class="">
                <div>
                    <div id="books"></div>
                </div>
                <br>
            </div>
    <!---->

        </div>
    </div>

    <!--tutaj jest modal, ktosy sie pojawia przy edycji ksiazek-->
    <div class="modal fade" id="modalChangeBook">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <div class="modal-header">
                    <h4 class="modal-title">Edycja książki</h4>
                </div>

                <div class="modal-body">
                    <form class="editBookForm form-inline" role="form">
                        <div class="form-group col-md-12">
                            <label for="changeTitle" class="col-md-4">Tytuł:</label>
                            <input type="text" class="form-control col-md-8" id="changeTitle" required>
                        </div>
                        <div class="form-group col-md-12">
                            <label for="changeAuthor" class="col-md-4">Autor:</label>
                            <input type="text" class="form-control col-md-8" id="changeAuthor" required>
                        </div>
                        <div class="form-group col-md-12">
                            <label for="changePublisher" class="col-md-4">Wydawca:</label>
                            <input type="text" class="form-control col-md-8" id="changePublisher" required>
                        </div>
                        <div class="form-group col-md-12">
                            <label for="changeType" class="col-md-4">Gatunek:</label>
                            <input type="text" class="form-control col-md-8" id="changeType" required>
                        </div>
                        <div class="form-group col-md-12">
                            <label for="changeIsbn" class="col-md-4">isbn:</label>
                            <input type="number" class="form-control col-md-8" id="changeIsbn" required>
                        </div>
                        <div class="col-md-12">
                            <button type="submit" class="change btn btn-warning float-right">Zapisz</button>
                            <button type="button" class="btn btn-danger float-right" data-dismiss="modal">Anuluj
                            </button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>


</div>

<!--<button type='button' class='deleteBook btn btn-danger'>Usuń</button>-->

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
<script src="js/app.js"></script>
</body>
</html>