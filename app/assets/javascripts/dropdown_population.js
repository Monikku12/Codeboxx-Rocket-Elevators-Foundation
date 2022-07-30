// For populating the interventions dropdown lists

$(function() {
    $("#step_2").hide();
    $("#step_3").hide();
    $("#step_4").hide();
    $("#step_5").hide();

    // Buildings dropdown list
    if ($("select#customer").val() == "") {
        $("select#building option").remove();
        var row = "<option value=\"" + "" + "\">" + "< Select building >" + "</option>";
        $(row).appendTo("select#building");
    }
    $("select#customer").change(function() {
        var id_value_string = $(this).val();
        if (id_value_string == "") {
            $("select#building option").remove();
            var row = "<option value=\"" + "" + "\">" + "< Select building >" + "</option>";
            $(row).appendTo("select#building");
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
                    $("select#building option").remove();
                    // put in a empty default line
                    var row = "<option value=\"" + "" + "\">" + "< Select building >" + "</option>";
                    $(row).appendTo("select#building");
                    // Fill building select
                    $.each(data, function(i, j) {
                        row = "<option value=\"" + j.id + "\">" + j.id + " - " + j.building_administrator_full_name + "</option>";
                        $(row).appendTo("select#building");
                        $("#step_2").show();
                    });
                }
            });
        }
    });
  
    // Batteries dropdown list
    if ($("select#building").val() == "") {
        $("select#battery option").remove();
        var row = "<option value=\"" + "" + "\">" + "< Select battery >" + "</option>";
        $(row).appendTo("select#battery");
    }
    $("select#building").change(function() {
        var id_value_string = $(this).val();
        if (id_value_string == "") {
            $("select#battery option").remove();
            var row = "<option value=\"" + "" + "\">" + "< Select battery >" + "</option>";
            $(row).appendTo("select#battery");
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
                    $("select#battery option").remove();
                    // put in a empty default line
                    var row = "<option value=\"" + "" + "\">" + "< Select battery >" + "</option>";
                    $(row).appendTo("select#battery");
                    // Fill battery select
                    $.each(data, function(i, j) {
                        row = "<option value=\"" + j.id + "\">" + j.id + " - " + j.batterie_type + "</option>";
                        $(row).appendTo("select#battery");
                        $("#step_3").show();
                    });
                }
            });
        }
    });

     // Columns dropdown list
     if ($("select#battery").val() == "") {
        $("select#column option").remove();
        var row = "<option value=\"" + "" + "\">" + "None" + "</option>";
        $(row).appendTo("select#column");
    }
    $("select#battery").change(function() {
        var id_value_string = $(this).val();
        if (id_value_string == "") {
            $("select#column option").remove();
            var row = "<option value=\"" + "" + "\">" + "None" + "</option>";
            $(row).appendTo("select#column");
        } else {
            // Send the request and update columns dropdown
            $.ajax({
                dataType: "json",
                cache: false,
                url: '/get_columns_by_battery/' + id_value_string,
                timeout: 5000,
                error: function(XMLHttpRequest, errorTextStatus, error) {
                    alert("Failed to submit : " + errorTextStatus + " ;" + error);
                },
                success: function(data) {
                    // Clear all options from columns select
                    $("select#column option").remove();
                    // put in a empty default line
                    var row = "<option value=\"" + "" + "\">" + "None" + "</option>";
                    $(row).appendTo("select#column");
                    // Fill column select
                    $.each(data, function(i, j) {
                        row = "<option value=\"" + j.id + "\">" + j.id + " - " + j.column_type + "</option>";
                        $(row).appendTo("select#column");
                        $("#step_4").show();
                    });
                }
            });
        }
    });

    // Elevators dropdown list
    if ($("select#column").val() == "") {
        $("select#elevator option").remove();
        var row = "<option value=\"" + "" + "\">" + "None" + "</option>";
        $(row).appendTo("select#elevator");
    } else if ($("select#column_id").val() == null) {
        $("select#elevator_id option").val() == null;  
        var row = "<option value=\"" + "" + "\">" + "None" + "</option>";
    
    $("select#column").change(function() {
        var id_value_string = $(this).val();
        if (id_value_string == "") {
            $("select#elevator option").remove();
            var row = "<option value=\"" + "" + "\">" + "None" + "</option>";
            $(row).appendTo("select#elevator");
        } else {
            // Send the request and update elevators dropdown
            $.ajax({
                dataType: "json",
                cache: false,
                url: '/get_elevators_by_column/' + id_value_string,
                timeout: 5000,
                error: function(XMLHttpRequest, errorTextStatus, error) {
                    alert("Failed to submit : " + errorTextStatus + " ;" + error);
                },
                success: function(data) {
                    // Clear all options from elevator select
                    $("select#elevator option").remove();
                    // put in a empty default line
                    var row = "<option value=\"" + "" + "\">" + "None" + "</option>";
                    $(row).appendTo("select#elevator");
                    // Fill elevator select
                    $.each(data, function(i, j) {
                        row = "<option value=\"" + j.id + "\">" + j.id + " - " + j.serial_number + "</option>";
                        $(row).appendTo("select#elevator");
                        $("#step_5").show();
                    });
                }
            });
        }
    });

});

