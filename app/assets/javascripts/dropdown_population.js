// For populating the interventions dropdown lists

// Buildings dorpdown list
$(function() {

    if ($("select#customer").val() == "") {
        $("select#buildings option").remove();
        var row = "<option value=\"" + "" + "\">" + "Building" + "</option>";
        $(row).appendTo("select#buildings");
    }
    $("select#customer").change(function() {
        var id_value_string = $(this).val();
        if (id_value_string == "") {
            $("select#buildings option").remove();
            var row = "<option value=\"" + "" + "\">" + "Building" + "</option>";
            $(row).appendTo("select#buildings");
        } else {
            // Send the request and update buildings dropdown
            $.ajax({
                dataType: "json",
                cache: false,
                url: '/get_buildings_by_customer/' + id_value_string,
                timeout: 5000,
                error: function(XMLHttpRequest, errorTextStatus, error) {
                    alert("Failed to submit : " + errorTextStatus + " ;" + error);
                },
                success: function(data) {
                    // Clear all options from buildings select
                    $("select#buildings option").remove();
                    // put in a empty default line
                    var row = "<option value=\"" + "" + "\">" + "Building" + "</option>";
                    $(row).appendTo("select#buildings");
                    // Fill buildings select
                    $.each(data, function(i, j) {
                        row = "<option value=\"" + j.id + "\">" + j.number_and_street + "</option>";
                        $(row).appendTo("select#buildings");
                    });
                }
            });
        }
    });
    
});