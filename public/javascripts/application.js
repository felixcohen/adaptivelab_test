// Put your application scripts here

$(document).ready(function() {
  var request;

  $("#fetch_responses").click(function(event){
      // abort any pending request
      if (request) {
          request.abort();
      }

      // setup some local variables
      if ($('td.message_id').length > 0) {
      var existing_ids = $(".message_id").map(function() {
          return this.innerHTML;
      });
      existing_ids = existing_ids.toArray().join();
    }
    else {
      existing_ids = ""
    }

    data = "existing_ids="+existing_ids;

    console.log(data);

      request = $.ajax({
          url: "/responses",
          type: "post",
          data: data
      });

      request.done(function (response, textStatus, jqXHR){
          // log a message to the console
          console.log("got response");
          console.log(response);
          console.log(typeof(response));
          if (response === "The API is unavailable") {
            $("#warning").html = "Sorry, could not contact the API";
          }
          else {
            data = $.parseJSON(response);
            $.each(data, function(i, item) {
              $('#responses tr:last').after('<tr>'+'<td class="message_id">'+item.id+'</td>'+'<td>'+item.user_handle+'</td>'+'<td>'+item.created_at+'</td>'+'<td>'+item.message+'</td>'+'<td>'+item.sentiment+'</td>'+'</tr>');
            });
          }
      });

      // callback handler that will be called on failure
      request.fail(function (jqXHR, textStatus, errorThrown){
          // log the error to the console
          console.error(
              "The following error occured: "+
              textStatus, errorThrown
          );
      });
    });
});