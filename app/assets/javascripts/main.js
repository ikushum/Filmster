$(function(){
  let form = $('#movie-search');
  form.submit(function(e){
    e.preventDefault();

    $.ajax({
      url: 'http://www.omdbapi.com/?',
      data: form.serialize()
    })
    .done(function(data){
      displayMovies(data);
    });
  });


    function displayMovies(data){
      let container = $("#movies")
      let htmlString = "";
    
      container.empty();
    
      if (data["Response"] == "False") {
        htmlString = `<div class="alert alert-danger text-center" role="alert">${data["Error"]}</div>`
      } 
      else {
    
        data["Search"].forEach(function(movie){
          htmlString += `<img src=${movie["Poster"] == "N/A" ? "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRnINMwmB4xbH1-A01_6yCHuugXwvee3rv9fZnuE7EITlJ5tLDR0w" : movie["Poster"]} />
                         <p>${movie["Title"]}</p>
                         <p>${movie["Year"]}</p>`;
        });
      }
    
      container.append(htmlString);
    }
});