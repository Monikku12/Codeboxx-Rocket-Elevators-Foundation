// For populating the interventions dropdown lists

$(function() {
    $("#step_2").hide();
    $("#step_3").hide();
    $("#step_4").hide();
    $("#step_5").hide();

    // Buildings dropdown list
    if ($("select#customer_id").val() == "") {
        $("select#building_id option").remove();
        var row = "<option value=\"" + "" + "\">" + "< Select building >" + "</option>";
        $(row).appendTo("select#building_id");
    }
    console.log("********************************")
    console.log("OK");
    console.log("********************************")
    $("select#customer_id").change(function() {
        var id_value_string = $(this).val();
        if (id_value_string == "") {
            $("select#building_id option").remove();
            var row = "<option value=\"" + "" + "\">" + "< Select building >" + "</option>";
            $(row).appendTo("select#building_id");
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
                    $("select#building_id option").remove();
                    // put in a empty default line
                    var row = "<option value=\"" + "" + "\">" + "< Select building >" + "</option>";
                    $(row).appendTo("select#building_id");
                    // Fill building select
                    $.each(data, function(i, j) {
                        row = "<option value=\"" + j.id + "\">" + j.id + " - " + j.building_administrator_full_name + "</option>";
                        $(row).appendTo("select#building_id");
                        $("#step_2").show();
                    });
                }
            });
        }
    });
  
    // Batteries dropdown list
    if ($("select#building_id").val() == "") {
        $("select#battery_id option").remove();
        var row = "<option value=\"" + "" + "\">" + "< Select battery >" + "</option>";
        $(row).appendTo("select#battery_id");
    }
    $("select#building_id").change(function() {
        var id_value_string = $(this).val();
        if (id_value_string == "") {
            $("select#battery_id option").remove();
            var row = "<option value=\"" + "" + "\">" + "< Select battery >" + "</option>";
            $(row).appendTo("select#battery_id");
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
                    $("select#battery_id option").remove();
                    // put in a empty default line
                    var row = "<option value=\"" + "" + "\">" + "< Select battery >" + "</option>";
                    $(row).appendTo("select#battery_id");
                    // Fill battery select
                    $.each(data, function(i, j) {
                        row = "<option value=\"" + j.id + "\">" + j.id + " - " + j.batterie_type + "</option>";
                        $(row).appendTo("select#battery_id");
                        $("#step_3").show();
                    });
                }
            });
        }
    });

     // Columns dropdown list
     if ($("select#battery_id").val() == "") {
        $("select#column_id option").remove();
        var row = "<option value=\"" + "" + "\">" + "None" + "</option>";
        $(row).appendTo("select#column_id");
    }
    $("select#battery_id").change(function() {
        var id_value_string = $(this).val();
        if (id_value_string == "") {
            $("select#column_id option").remove();
            var row = "<option value=\"" + "" + "\">" + "None" + "</option>";
            $(row).appendTo("select#column_id");
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
                    $("select#column_id option").remove();
                    // put in a empty default line
                    var row = "<option value=\"" + "" + "\">" + "None" + "</option>";
                    $(row).appendTo("select#column_id");
                    // Fill column select
                    $.each(data, function(i, j) {
                        row = "<option value=\"" + j.id + "\">" + j.id + " - " + j.column_type + "</option>";
                        $(row).appendTo("select#column_id");
                        $("#step_4").show();
                    });
                }
            });
        }
    });

    // Elevators dropdown list
    if ($("select#column_id").val() == "") {
        $("select#elevator_id option").remove();
        var row = "<option value=\"" + "" + "\">" + "None" + "</option>";
        $(row).appendTo("select#elevator_id");
    } else if ($("select#column_id").val() == null) {
        $("select#elevator_id option").val() == null;  
        var row = "<option value=\"" + "" + "\">" + "None" + "</option>";
    }
    $("select#column_id").change(function() {
        var id_value_string = $(this).val();
        if (id_value_string == "") {
            $("select#elevator_id option").remove();
            var row = "<option value=\"" + "" + "\">" + "None" + "</option>";
            $(row).appendTo("select#elevator_id");
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
                    $("select#elevator_id option").remove();
                    // put in a empty default line
                    var row = "<option value=\"" + "" + "\">" + "None" + "</option>";
                    $(row).appendTo("select#elevator_id");
                    // Fill elevator select
                    $.each(data, function(i, j) {
                        row = "<option value=\"" + j.id + "\">" + j.id + " - " + j.serial_number + "</option>";
                        $(row).appendTo("select#elevator_id");
                        $("#step_5").show();
                    });
                }
            });
        }
    });

});
