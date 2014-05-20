var TableManaged = function () {

    return {

        //main function to initiate the module
        init: function () {
            
            if (!jQuery().dataTable) {
                return;
            }

            // begin first table
            $('#managetable_news').dataTable({
                "aoColumns": [
                  { "bSortable": false, "bSearchable":false},
                  null,
                  null,
                  { "bSortable": false, "bSearchable":false}, // { "bSortable": false, "sType": "text" },
                  { "bSortable": false, "bSearchable":false},
                  { "bSortable": false, "bSearchable":false},
                  { "bSortable": false, "bSearchable":false},
                  null,
                  { "bSortable": false, "bSearchable":false},
                  { "bSortable": false, "bSearchable":false},
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
            
            $('#managetable_twitter').dataTable({
                "aoColumns": [
                  { "bSortable": false, "bSearchable":false},
                  null,
                  null,
                  null,
                  { "bSortable": false, "bSearchable":false},
                  { "bSortable": false, "bSearchable":false},
                ],
                "aLengthMenu": [
                    [15, 30, 50, -1],
                    [15, 30, 50, "All"] // change per page values here
                ],
                // set the initial value
                "iDisplayLength": 5,
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

            jQuery('#managetable_news .group-checkable').change(function () {
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
            
            jQuery('#managetable_twitter .group-checkable').change(function () {
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

            jQuery('#managetable_news').on('change', 'tbody tr .checkboxes', function(){
                 $(this).parents('tr').toggleClass("active");
            });
            
            jQuery('#managetable_twitter').on('change', 'tbody tr .checkboxes', function(){
                $(this).parents('tr').toggleClass("active");
           });

            jQuery('#managetable_news_wrapper .dataTables_filter input').addClass("form-control input-medium input-inline"); // modify table search input
            jQuery('#managetable_news_wrapper .dataTables_length select').addClass("form-control input-xsmall"); // modify table per page dropdown
            //jQuery('#managetable_news_wrapper .dataTables_length select').select2(); // initialize select2 dropdown
            jQuery('#managetable_twitter_wrapper .dataTables_filter input').addClass("form-control input-medium input-inline"); // modify table search input
            jQuery('#managetable_twitter_wrapper .dataTables_length select').addClass("form-control input-xsmall"); // modify table per page dropdown
            //jQuery('#managetable_twitter_wrapper .dataTables_length select').select2(); // initialize select2 dropdown

            $('#managetable_twitter_new').click(function (e) {
            	window.location.href="/manage/addTwitter";
            });
            
            $('#managetable_news a.edit').live('click', function (e) {
            	var id = $(this).parents('tr')[0].getElementsByTagName("input")[0].value;
            	window.location.href="editNews?newsId=" + id;
            });
            
            $('#managetable_twitter a.edit').live('click', function (e) {
            	var id = $(this).parents('tr')[0].getElementsByTagName("input")[0].value;
            	window.location.href="/manage/editTwitterUser/" + id;
            });
            
            $('#managetable_news a.delete').live('click', function (e) {
            	var id = $(this).parents('tr')[0].getElementsByTagName("input")[0].value;
            	
	            $.ajax({
	        	    url: "deleteNews/" + id,
	        	    type: 'GET',
	        	    //dataType: 'json',
	        	    //data: "{\"name\":\"hmkcode\",\"id\":2}", 
	        	    contentType: 'application/json;',
	        	    mimeType: 'application/json;',
	        	    success: function(res) {
	        	        if (res.result == "ok") {
	        	        	alert("Is deleted successfully!");
	        	        	window.location.href="admin-news-list.html";
	        	        } else {
	        	        	alert("Is deleted failed!");
	        	        }
	        	    },
	        	    error:function(data,status,er) {
	        	        alert("error: "+data+" status: "+status+" er:"+er);
	        	    }
	        	});
            	
            });
            
            $('#managetable_twitter a.delete').live('click', function (e) {
            	var id = $(this).parents('tr')[0].getElementsByTagName("input")[0].value;
            	
	            $.ajax({
	        	    url: "/manage/deleteTwitter/" + id,
	        	    type: 'GET',
	        	    //dataType: 'json',
	        	    //data: "{\"name\":\"hmkcode\",\"id\":2}", 
	        	    contentType: 'application/json;',
	        	    mimeType: 'application/json;',
	        	    success: function(res) {
	        	        if (res.result == "ok") {
	        	        	alert("Twitter account delete succeed!");
	        	        	window.location.href="admin-news-list.html";
	        	        } else {
	        	        	alert("Is deleted failed!");
	        	        }
	        	    },
	        	    error:function(data,status,er) {
	        	        alert("error: "+data+" status: "+status+" er:"+er);
	        	    }
	        	});
            	
            });
            
        }

    };

}();