// For populating the interventions dropdown lists

// Buildings dorpdown list
$(function() {

    if ($("select#customer").val() == "") {
        $("select#buildings option").remove();
        var row = "<option value=\"" + "" + "\">" + "< Select building >" + "</option>";
        $(row).appendTo("select#buildings");
    }
    $("select#customer").change(function() {
        var id_value_string = $(this).val();
        if (id_value_string == "") {
            $("select#buildings option").remove();
            var row = "<option value=\"" + "" + "\">" + "< Select building >" + "</option>";
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
                    var row = "<option value=\"" + "" + "\">" + "< Select building >" + "</option>";
                    $(row).appendTo("select#buildings");
                    // Fill buildings select
                    $.each(data, function(i, j) {
                        row = "<option value=\"" + j.id + "\">" + j.id + " - " + j.building_administrator_full_name + "</option>";
                        $(row).appendTo("select#buildings");
                    });
                }
            });
        }
    });
  
    // Batteries dorpdown list
    if ($("select#buildings").val() == "") {
        $("select#batteries option").remove();
        var row = "<option value=\"" + "" + "\">" + "< Select battery >" + "</option>";
        $(row).appendTo("select#batteries");
    }
    $("select#buildings").change(function() {
        var id_value_string = $(this).val();
        if (id_value_string == "") {
            $("select#batteries option").remove();
            var row = "<option value=\"" + "" + "\">" + "< Select battery >" + "</option>";
            $(row).appendTo("select#batteries");
        } else {
            // Send the request and update batteries dropdown
            $.ajax({
                dataType: "json",
                cache: false,
                url: '/get_batteries_by_building/' + id_value_string,
                timeout: 5000,
                error: function(XMLHttpRequest, errorTextStatus, error) {
                    alert("Failed to submit : " + errorTextStatus + " ;" + error);
                },
                success: function(data) {
                    // Clear all options from batteries select
                    $("select#batteries option").remove();
                    // put in a empty default line
                    var row = "<option value=\"" + "" + "\">" + "< Select battery >" + "</option>";
                    $(row).appendTo("select#batteries");
                    // Fill batteries select
                    $.each(data, function(i, j) {
                        row = "<option value=\"" + j.id + "\">" + j.id + " - " + j.batterie_type + "</option>";
                        $(row).appendTo("select#batteries");
                    });
                }
            });
        }
    });


































});

