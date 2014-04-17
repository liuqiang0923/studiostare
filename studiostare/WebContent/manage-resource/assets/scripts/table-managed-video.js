var TableManaged = function () {

    return {

        //main function to initiate the module
        init: function () {
            
            if (!jQuery().dataTable) {
                return;
            }

            // begin first table
            $('#managetable_video').dataTable({
                "aoColumns": [
//                  { "bSortable": false, "bSearchable": false },
                  null,
                  { "bSearchable": false},
                  null,
                  { "bSortable": false, "bSearchable": false }, // { "bSortable": false, "sType": "text" },
                  { "bSortable": false, "bSearchable": false },
                  { "bSortable": false, "bSearchable": false },
                  { "bSortable": false, "bSearchable": false },
                  null,
                  null,
//                  { "bSearchable": false},
                  { "bSortable": false, "bSearchable": false },
                  { "bSortable": false, "bSearchable": false }
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

            jQuery('#managetable_video .group-checkable').change(function () {
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

            jQuery('#managetable_video').on('change', 'tbody tr .checkboxes', function(){
                 $(this).parents('tr').toggleClass("active");
            });

            jQuery('#managetable_video_wrapper .dataTables_filter input').addClass("form-control input-medium input-inline"); // modify table search input
            jQuery('#managetable_video_wrapper .dataTables_length select').addClass("form-control input-xsmall"); // modify table per page dropdown
            //jQuery('#managetable_video_wrapper .dataTables_length select').select2(); // initialize select2 dropdown

            $('#managetable_video_new').click(function (e) {
            	addVideo();
            });
            
            $('#managetable_video a.edit').live('click', function (e) {
            	var id = $(this).parents('tr')[0].getElementsByTagName("input")[0].value;
            	editVideo(id);
            });
            
            $('#managetable_video a.delete').live('click', function (e) {
            	var id = $(this).parents('tr')[0].getElementsByTagName("input")[0].value;
            	deleteVideo(id);
            });
            
            function addVideo(){
            	window.location.href="/studiostare/manage/addVideo";
            }
            
            function editVideo(id){
            	window.location.href="/studiostare/manage/editVideo/" + id;
            }
            
            function deleteVideo(id){
            	$.ajax({
            	    url: '/studiostare/manage/deleteVideo/' + id,
            	    type: 'GET',
//            	    dataType: 'json',
//            	    data: "{\"name\":\"hmkcode\",\"id\":2}", 
            	    contentType: 'application/json;',
            	    mimeType: 'application/json;',
            	    success: function(res) {
            	    	if (res.result == "ok") {
	        	        	alert("Delete succeed!");
	        	        	window.location.href="/studiostare/manage/admin-video-list.html";
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