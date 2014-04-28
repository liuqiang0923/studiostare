var TableManaged = function () {

    return {

        //main function to initiate the module
        init: function () {
            
            if (!jQuery().dataTable) {
                return;
            }

            // begin first table
            $('#managetable_leading').dataTable({
                "aoColumns": [
					{ "bSortable": false, "bSearchable": false },
					{ "bSortable": false, "bSearchable": false },
//					null, // { "bSortable": false, "sType": "text" },
//					null,
					{ "bSortable": false, "bSearchable": false },
					{ "bSortable": false, "bSearchable": false }
                ],
                "aLengthMenu": [
                    [15, 30, 50, -1],
                    [15, 30, 50, "All"] // change per page values here
                ],
                // set the initial value
                "iDisplayLength": 15,
                "sPaginationType": "bootstrap",
                "oLanguage": {
                    "sLengthMenu": "_MENU_ records",
                    "oPaginate": {
                        "sPrevious": "Prev",
                        "sNext": "Next"
                    }
                },
                "aoColumnDefs": [
                    { 'bSortable': false, 'aTargets': [0] },
                    { "bSearchable": false, "aTargets": [ 0 ] }
                ]
            });
            
            $('#managetable_word').dataTable({
                "aoColumns": [
					{ "bSortable": false, "bSearchable": false },
//					{ "bSortable": false, "bSearchable": false },
//					null, // { "bSortable": false, "sType": "text" },
					null,
					{ "bSortable": false, "bSearchable": false },
					{ "bSortable": false, "bSearchable": false }
                ],
                "aLengthMenu": [
                    [15, 30, 50, -1],
                    [15, 30, 50, "All"] // change per page values here
                ],
                // set the initial value
                "iDisplayLength": 15,
                "sPaginationType": "bootstrap",
                "oLanguage": {
                    "sLengthMenu": "_MENU_ records",
                    "oPaginate": {
                        "sPrevious": "Prev",
                        "sNext": "Next"
                    }
                },
                "aoColumnDefs": [
                    { 'bSortable': false, 'aTargets': [0] },
                    { "bSearchable": false, "aTargets": [ 0 ] }
                ]
            });

            jQuery('#managetable_leading .group-checkable').change(function () {
                var set = jQuery(this).attr("data-set");
                var checked = jQuery(this).is(":checked");
                jQuery(set).each(function () {
                    if (checked) {
                        $(this).attr("checked", true);
                        $(this).parents('tr').addClass("active");
                    } else {
                        $(this).attr("checked", false);
                        $(this).parents('tr').removeClass("active");
                    }                    
                });
                jQuery.uniform.update(set);
            });
            
            jQuery('#managetable_leading_word .group-checkable').change(function () {
                var set = jQuery(this).attr("data-set");
                var checked = jQuery(this).is(":checked");
                jQuery(set).each(function () {
                    if (checked) {
                        $(this).attr("checked", true);
                        $(this).parents('tr').addClass("active");
                    } else {
                        $(this).attr("checked", false);
                        $(this).parents('tr').removeClass("active");
                    }                    
                });
                jQuery.uniform.update(set);
            });

            jQuery('#managetable_leading').on('change', 'tbody tr .checkboxes', function(){
                 $(this).parents('tr').toggleClass("active");
            });
            
            jQuery('#managetable_leading_word').on('change', 'tbody tr .checkboxes', function(){
                $(this).parents('tr').toggleClass("active");
           });

            jQuery('#managetable_leading_wrapper .dataTables_filter input').addClass("form-control input-medium input-inline"); // modify table search input
            jQuery('#managetable_leading_wrapper .dataTables_length select').addClass("form-control input-xsmall"); // modify table per page dropdown
            //jQuery('#managetable_leading_wrapper .dataTables_length select').select2(); // initialize select2 dropdown
            jQuery('#managetable_leading_word_wrapper .dataTables_filter input').addClass("form-control input-medium input-inline"); // modify table search input
            jQuery('#managetable_leading_word_wrapper .dataTables_length select').addClass("form-control input-xsmall"); // modify table per page dropdown
            //jQuery('#managetable_leading_word_wrapper .dataTables_length select').select2(); // initialize select2 dropdown

            $('#managetable_leading_new').click(function (e) {
            	addLeading();
            });
            
            $('#managetable_leading_word_new').click(function (e) {
            	addLeadingWord();
            });
            
            $('#managetable_leading a.edit').live('click', function (e) {
            	var id = $(this).parents('tr')[0].getElementsByTagName("input")[0].value;
            	// window.location.href="/studiostare/manage/editLeading/" + id;
            	editLeading(id);
            });
            
            $('#managetable_leading_word a.edit').live('click', function (e) {
            	var id = $(this).parents('tr')[0].getElementsByTagName("input")[0].value;
            	// window.location.href="/studiostare/manage/editLeading/" + id;
            	editLeadingWord(id);
            });
            
            $('#managetable_leading a.delete').live('click', function (e) {
            	// window.location.href="/studiostare/manage/deleteLeading/{id}";
            	var id = $(this).parents('tr')[0].getElementsByTagName("input")[0].value;
            	deleteLeading(id);
            });
            
            $('#managetable_leading_word a.delete').live('click', function (e) {
            	// window.location.href="/studiostare/manage/deleteLeading/{id}";
            	var id = $(this).parents('tr')[0].getElementsByTagName("input")[0].value;
            	deleteLeading(id);
            });
            
            function addLeading(){
            	window.location.href="/studiostare/manage/addLeading";
            }
            
            function addLeadingWord(){
            	window.location.href="/studiostare/manage/addLeadingWord";
            }
            
            function editLeading(id){
            	window.location.href="/studiostare/manage/editLeading/" + id;
            }
            
            function editLeadingWord(id){
            	window.location.href="/studiostare/manage/editLeadingWord/" + id;
            }
            
            function deleteLeading(id){
            	$.ajax({
            	    url: '/studiostare/manage/deleteLeading/' + id,
            	    type: 'GET',
//            	    dataType: 'json',
//            	    data: "{\"name\":\"hmkcode\",\"id\":2}", 
            	    contentType: 'application/json;',
            	    mimeType: 'application/json;',
            	    success: function(res) {
            	    	if (res.result == "ok") {
	        	        	alert("Delete succeed!");
	        	        	window.location.href="/studiostare/manage/admin-leading-list.html";
	        	        } else {
	        	        	alert("Deleted failed!");
	        	        }
            	    },
            	    error:function(data,status,er) {
            	        alert("error: "+data+" status: "+status+" er:"+er);
            	    }
            	});
            }
            
            function deleteLeading(id){
            	$.ajax({
            	    url: '/studiostare/manage/deleteLeadingWord/' + id,
            	    type: 'GET',
//            	    dataType: 'json',
//            	    data: "{\"name\":\"hmkcode\",\"id\":2}", 
            	    contentType: 'application/json;',
            	    mimeType: 'application/json;',
            	    success: function(res) {
            	    	if (res.result == "ok") {
	        	        	alert("Delete succeed!");
	        	        	window.location.href="/studiostare/manage/admin-leading-list.html";
	        	        } else {
	        	        	alert("Deleted failed!");
	        	        }
            	    },
            	    error:function(data,status,er) {
            	        alert("error: "+data+" status: "+status+" er:"+er);
            	    }
            	});
            }
            
        }

    };

}();