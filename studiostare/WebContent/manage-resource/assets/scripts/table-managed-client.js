var TableManaged = function () {

    return {

        //main function to initiate the module
        init: function () {
            
            if (!jQuery().dataTable) {
                return;
            }

            // begin first table
            $('#managetable_client').dataTable({
                "aoColumns": [
                  { "bSortable": false },
                  null,
                  null, // { "bSortable": false, "sType": "text" },
                  null,
                  { "bSearchable": false},
                  { "bSortable": false },
                  { "bSortable": false }
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

            jQuery('#managetable_client .group-checkable').change(function () {
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

            jQuery('#managetable_client').on('change', 'tbody tr .checkboxes', function(){
                 $(this).parents('tr').toggleClass("active");
            });

            jQuery('#managetable_client_wrapper .dataTables_filter input').addClass("form-control input-medium input-inline"); // modify table search input
            jQuery('#managetable_client_wrapper .dataTables_length select').addClass("form-control input-xsmall"); // modify table per page dropdown
            //jQuery('#managetable_client_wrapper .dataTables_length select').select2(); // initialize select2 dropdown

            $('#managetable_client_new').click(function (e) {
            	var client = new Object();
            	client.name = "asdf";
            	client.phone = "asdf";
            	client.email = "asdf";
            	client.description = "asdf";
            	var tmpjsonstr = '{"name":"hmkcode","id":2}';
            	var jj = $.parseJSON(tmpjsonstr);
//            	var da = $.parseJSON(client);
            	editClient();
            });
            
            function addClient(){
            	
            }
            
            function editClient(id){
            	$.ajax({
            	    url: 'admin-client-edit.html',
            	    type: 'POST',
            	    dataType: 'json',
            	    data: "{\"name\":\"hmkcode\",\"id\":2}", 
            	    contentType: 'application/json;',
            	    mimeType: 'application/json;',
            	    success: function(res) {
            	        alert("scccess." + res.name);
            	    },
            	    error:function(data,status,er) {
            	        alert("error: "+data+" status: "+status+" er:"+er);
            	    }
            	});
            }
            
        }

    };

}();