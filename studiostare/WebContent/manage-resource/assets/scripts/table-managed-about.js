var TableManaged = function () {

    return {

        //main function to initiate the module
        init: function () {
            
            if (!jQuery().dataTable) {
                return;
            }

            // begin first table
            $('#managetable_about').dataTable({
                "aoColumns": [
                  { "bSortable": false, "bSearchable": false },
                  { "bSortable": false, "bSearchable": false },
                  null,
                  null, // { "bSortable": false, "sType": "text" },
                  null,
                  { "bSortable": false},
                  { "bSortable": false, "bSearchable": false},
                  { "bSortable": false, "bSearchable": false},
                ],
                "aLengthMenu": [
                    [5, 15, 20, -1],
                    [5, 15, 20, "All"] // change per page values here
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

            jQuery('#managetable_about .group-checkable').change(function () {
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

            jQuery('#managetable_about').on('change', 'tbody tr .checkboxes', function(){
                 $(this).parents('tr').toggleClass("active");
            });

            jQuery('#managetable_about_wrapper .dataTables_filter input').addClass("form-control input-medium input-inline"); // modify table search input
            jQuery('#managetable_about_wrapper .dataTables_length select').addClass("form-control input-xsmall"); // modify table per page dropdown
            //jQuery('#managetable_about_wrapper .dataTables_length select').select2(); // initialize select2 dropdown

            $('#managetable_about_new').click(function (e) {
            	addAboutUs();
            });
            
            $('#managetable_about a.edit').live('click', function (e) {
            	var id = $(this).parents('tr')[0].getElementsByTagName("input")[0].value;
            	// window.location.href="/studiostare/manage/editAboutUs/" + id;
            	editAboutUs(id);
            });
            
            $('#managetable_about a.delete').live('click', function (e) {
            	// window.location.href="/studiostare/manage/deleteAboutUs/{id}";
            	var id = $(this).parents('tr')[0].getElementsByTagName("input")[0].value;
            	deleteAboutUs(id);
            });
            
            function addAboutUs(){
            	window.location.href="/studiostare/manage/addWho";
            }
            
            function editAboutUs(id){
            	window.location.href="/studiostare/manage/editWho/" + id;
            }
            
            function deleteAboutUs(id){
            	$.ajax({
            	    url: '/studiostare/manage/deleteWho/' + id,
            	    type: 'GET',
//            	    dataType: 'json',
//            	    data: "{\"name\":\"hmkcode\",\"id\":2}", 
            	    contentType: 'application/json;',
            	    mimeType: 'application/json;',
            	    success: function(res) {
            	    	if (res.result == "ok") {
	        	        	alert("Delete succeed!");
	        	        	window.location.href="/studiostare/manage/admin-about.html";
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