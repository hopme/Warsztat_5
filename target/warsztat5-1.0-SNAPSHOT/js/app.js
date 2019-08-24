$(function () {

    var context = window.location.pathname;
    var books = $("#books");
    returnAllBooks();


    // zwrócenie wszystkich książek do tabeli
    function returnAllBooks() {
        $.getJSON(context + "/books/", function (result) {
            console.log("result = " + result);
            books.empty();
            $(result).each(function () {
                books.append("<div class = 'bookTitle' data-id='" + this.id + "'>" + "Tytuł książki: " + this.title + "</div>" + "<div class='info'>"); //this.title to jest tytul ksiazki brany z json z "result" (Zwrot danych z jsona, zamiast result moze byc inne slowo"
                books.append("<button type= 'button' class='deleteBook btn btn-danger' data-id='" + this.id + "'>Usuń</button>");
                books.append("<button type= 'button' class='editBook btn btn-secondary' data-id='" + this.id + "' data-toggle='modal' data-target='#modalChangeBook'>Edytuj</button>"
                );
            });

        }).fail(function () {
            alert("Coś poszło nie tak, odśwież stronę");
        });
    }

    //dodawanie nowych ksiazek do listy
    var addBook = $("#addBookForm");

    addBook.on('submit', function (e) {
        e.preventDefault();
        var title = JSON.stringify($("input#title").val());
        var author = JSON.stringify($("input#author").val());
        var publisher = JSON.stringify($("input#publisher").val());
        var type = JSON.stringify($("input#type").val());
        var isbn = JSON.stringify($("input#isbn").val());

        $.ajax({
            url: context + '/books/',
            data: '{"title": ' + title +
                ', "author": ' + author +
                ', "publisher": ' + publisher +
                ', "type": ' + type +
                ', "isbn": ' + isbn + '}',
            contentType: "application/json",
            method: "POST"
        }).done(function () {
            alert("Dodano książkę");
            returnAllBooks();
        }).fail(function () {
            alert("Nie udało się dodać książki")
        });
        $(this).trigger("reset");
    });
    //kasowanie książek z listy
    books.on('click', 'button.deleteBook', function (e) {
        e.stopPropagation();
        $.ajax({
            url: context + '/books/' + this.dataset.id,
            type: "DELETE"
        }).done(function () {
            alert("Usunięto!");
            returnAllBooks();
        }).fail(function () {
            alert("Nie udało się usunąć książki");
        });
    });


    // edycja książki

    books.on('click', '.editBook', function (e) {
        console.log("edycja!");

        var id = this.dataset.id;
        $.getJSON(context + '/books/' + id, function (result) {
            $("#changeTitle").val(result.title);
            $("#changeAuthor").val(result.author);
            $("#changePublisher").val(result.publisher);
            $("#changeType").val(result.type);
            $("#changeIsbn").val(result.isbn);
        });

        var editBook = $(".editBookForm");
        editBook.on('submit', function (e) {
            var idJson = JSON.stringify(id);
            var title = JSON.stringify($("input#changeTitle").val());
            var author = JSON.stringify($("input#changeAuthor").val());
            var publisher = JSON.stringify($("input#changePublisher").val());
            var type = JSON.stringify($("input#changeType").val());
            var isbn = JSON.stringify($("input#changeIsbn").val());

            $.ajax({
                url: context + '/books/',
                data: '{"id": ' + idJson +
                    ', "title": ' + title +
                    ', "author": ' + author +
                    ', "publisher": ' + publisher +
                    ', "type": ' + type +
                    ', "isbn": ' + isbn + '}',
                contentType: "application/json",
                method: "PUT"
            }).done(function () {
                alert("Edycja książki powiodła się");
                $("#modalChangeBook").modal('hide');
                returnAllBooks();
            }).fail(function () {
                alert("Edycja książki nie powiodła się");
                $("#modalChangeBook").modal('hide');
            });

        })

    })

});