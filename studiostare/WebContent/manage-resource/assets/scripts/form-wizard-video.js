var FormWizard = function () {


    return {
        //main function to initiate the module
        init: function () {
            if (!jQuery().bootstrapWizard) {
                return;
            }

            function format(state) {
                if (!state.id) return state.text; // optgroup
                return "<img class='flag' src='assets/img/flags/" + state.id.toLowerCase() + ".png'/>&nbsp;&nbsp;" + state.text;
            }

            $("#country_list").select2({
                placeholder: "Select",
                allowClear: true,
                formatResult: format,
                formatSelection: format,
                escapeMarkup: function (m) {
                    return m;
                }
            });

            var form = $('#submit_form');
            var error = $('.alert-danger', form);
            var success = $('.alert-success', form);
            
            // add validate of office img.
						jQuery.validator.addMethod("videoimgexist", function(value, element, param) {
							if (value != "")
								return true;
							if (document.getElementById("videoimgdiv").getElementsByTagName("img").length == 0)
								return false;
						 	return true;
						},"This field is required.");
						
						jQuery.validator.addMethod("videomp4exist", function(value, element, param) {
							if (value != "")
								return true;
							if (document.getElementById("videomp4div").getElementsByTagName("video").length == 0)
								return false;
						 	return true;
						},"This field is required.");
						
						jQuery.validator.addMethod("videowebmexist", function(value, element, param) {
							if (value != "")
								return true;
							if (document.getElementById("videowebmdiv").getElementsByTagName("video").length == 0)
								return false;
						 	return true;
						},"This field is required.");
						
						jQuery.validator.addMethod("videooggexist", function(value, element, param) {
							if (value != "")
								return true;
							if (document.getElementById("videooggdiv").getElementsByTagName("video").length == 0)
								return false;
						 	return true;
						},"This field is required.");
						
//						function checkImg(){
//							if (document.getElementById("videoimgdiv").getElementsByTagName("img").length == 0)
//								return false;
//						 	return true;
//						}
						
            form.validate({
                doNotHideMessage: true, //this option enables to show the error/success messages on tab switch.
                errorElement: 'span', //default input error message container
                errorClass: 'help-block', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                rules: {
                    //account
                	name: {
                        required: true
                    },
                    password: {
                        minlength: 5,
                        required: true
                    },
                    rpassword: {
                        minlength: 5,
                        required: true,
                        equalTo: "#submit_form_password"
                    },
                    //profile
                    fullname: {
                        required: true
                    },
                    email: {
                        required: true,
                        email: true
                    },
                    phone: {
                        required: true
                    },
                    gender: {
                        required: true
                    },
                    address: {
                        required: true
                    },
                    city: {
                        required: true
                    },
                    country: {
                        required: true
                    },
                    //payment
                    card_name: {
                        required: true
                    },
                    card_number: {
                        minlength: 16,
                        maxlength: 16,
                        required: true
                    },
                    card_cvc: {
                        digits: true,
                        required: true,
                        minlength: 3,
                        maxlength: 4
                    },
                    card_expiry_date: {
                        required: true
                    },
                    'payment[]': {
                        required: true,
                        minlength: 1
                    },
                    videoimg: {
                    	videoimgexist: true,
                    	accept: "png|jpg|jpeg|gif",
                    },
                    videoname: {
                    	required: true,
                    	maxlength: 50,
                    },
                    'client.id': {
                    	required: true,
                    },
                    'category.id': {
                    	required: true,
                    },
                    videomp4: {
//                    	videomp4exist: true,
                    	accept: "mp4",
                    },
                    videowebm: {
//                    	videowebmexist: true,
                    	accept: "webm",
                    },
                    videoogg: {
//                    	videooggexist: true,
                    	accept: "ogv|ogg",
                    },
                    index: {
                    	required: true,
                    	digits: true,
                    }
                },

                messages: { // custom messages for radio buttons and checkboxes
                    'payment[]': {
                        required: "Please select at least one option",
                        minlength: jQuery.format("Please select at least one option")
                    },
                    videoimg: {
                		accept: "This field must be image.",
                	},
                	videomp4: {
                		accept: "This field must be mp4.",
                	},
                	videowebm: {
                		accept: "This field must be webm.",
                	},
                	videoogg: {
                		accept: "This field must be ogv/ogg.",
                	},
                },

                errorPlacement: function (error, element) { // render error placement for each input type
                    if (element.attr("name") == "gender") { // for uniform radio buttons, insert the after the given container
                        error.insertAfter("#form_gender_error");
                    } else if (element.attr("name") == "payment[]") { // for uniform radio buttons, insert the after the given container
                        error.insertAfter("#form_payment_error");
                    } else {
                        error.insertAfter(element); // for other inputs, just perform default behavior
                    }
                },

                invalidHandler: function (event, validator) { //display error alert on form submit   
                    success.hide();
                    error.show();
                    App.scrollTo(error, -200);
                },

                highlight: function (element) { // hightlight error inputs
                    $(element)
                        .closest('.form-group').removeClass('has-success').addClass('has-error'); // set error class to the control group
                },

                unhighlight: function (element) { // revert the change done by hightlight
                    $(element)
                        .closest('.form-group').removeClass('has-error'); // set error class to the control group
                },

                success: function (label) {
                    if (label.attr("for") == "gender" || label.attr("for") == "payment[]") { // for checkboxes and radio buttons, no need to show OK icon
                        label
                            .closest('.form-group').removeClass('has-error').addClass('has-success');
                        label.remove(); // remove error label here
                    } else { // display success icon for other inputs
                        label
                            .addClass('valid') // mark the current input as valid and display OK icon
                        .closest('.form-group').removeClass('has-error').addClass('has-success'); // set success class to the control group
                    }
                },

                submitHandler: function (form) {
                    success.show();
                    error.hide();
                    // form.submit();
                    var fd = new FormData(form);
                    var xhr = new XMLHttpRequest();
                    xhr.upload.addEventListener("progress", uploadProgress, false);
                    xhr.addEventListener("load", uploadComplete, false);
                    xhr.addEventListener("error", uploadFailed, false);
                    xhr.addEventListener("abort", uploadCanceled, false);
                    xhr.open("POST", "/manage/saveVideo");
                    xhr.send(fd);
                    //add here some ajax code to submit your form or just call form.submit() if you want to submit the form without ajax
                }

            });
            
            function uploadProgress(evt) {
				if (evt.lengthComputable) {
					var percentComplete = Math.round(evt.loaded * 100 / evt.total).toString();
					$('#uploadbar').find('.progress-bar').css({
                        width: percentComplete + '%'
                    });
				} else {
					document.getElementById('progressNumber').innerHTML = 'unable to compute';
				}
			}
			function uploadComplete(evt) {
				alert("add video succeed.");
				window.location.href="/manage/admin-video-list.html";
			}
			function uploadFailed(evt) {
				alert("There was an error attempting to upload the file.");
			}
			function uploadCanceled(evt) {
				alert("The upload has been canceled by the user or the browser dropped the connection.");
			}

            var displayConfirm = function() {
                $('#tab4 .form-control-static', form).each(function(){
                	if ($(this).attr("data-display") == "videoimgdiv"){
                		$(this).html($("#videoimgdiv"));
                	} else if ($(this).attr("data-display") == "videomp4div"){
                		$(this).html($("#videomp4div"));
                	} else if ($(this).attr("data-display") == "videowebmdiv"){
                		$(this).html($("#videowebmdiv"));
                	} else if ($(this).attr("data-display") == "videooggdiv"){
                		$(this).html($("#videooggdiv"));
                	} else{
	                    var input = $('[name="'+$(this).attr("data-display")+'"]', form);
	                    if (input.is(":radio")) {
	                        input = $('[name="'+$(this).attr("data-display")+'"]:checked', form);
	                    }
	                    if (input.is(":text") || input.is("textarea")) {
	                        $(this).html(input.val());
	                    } else if (input.is("select")) {
	                        $(this).html(input.find('option:selected').text());
	                    } else if (input.is(":radio") && input.is(":checked")) {
	                        $(this).html(input.attr("data-title"));
	                    } else if ($(this).attr("data-display") == 'payment') {
	                        var payment = [];
	                        $('[name="payment[]"]').each(function(){
	                            payment.push($(this).attr('data-title'));
	                        });
	                        $(this).html(payment.join("<br>"));
	                    }
                	}
                });
            }

            var handleTitle = function(tab, navigation, index) {
                var total = navigation.find('li').length;
                var current = index + 1;
                // set wizard title
                $('.step-title', $('#form_wizard_1')).text('Step ' + (index + 1) + ' of ' + total);
                // set done steps
                jQuery('li', $('#form_wizard_1')).removeClass("done");
                var li_list = navigation.find('li');
                for (var i = 0; i < index; i++) {
                    jQuery(li_list[i]).addClass("done");
                }

                if (current == 1) {
                    $('#form_wizard_1').find('.button-previous').hide();
                } else {
                    $('#form_wizard_1').find('.button-previous').show();
                }

                if (current >= total) {
                    $('#form_wizard_1').find('.button-next').hide();
                    $('#form_wizard_1').find('.button-submit').show();
                    displayConfirm();
                } else {
                    $('#form_wizard_1').find('.button-next').show();
                    $('#form_wizard_1').find('.button-submit').hide();
                }
                App.scrollTo($('.page-title'));
            }

            // default form wizard
            $('#form_wizard_1').bootstrapWizard({
                'nextSelector': '.button-next',
                'previousSelector': '.button-previous',
                onTabClick: function (tab, navigation, index, clickedIndex) {
                    success.hide();
                    error.hide();
                    if (form.valid() == false) {
                        return false;
                    }
                    handleTitle(tab, navigation, clickedIndex);
                },
                onNext: function (tab, navigation, index) {
                    success.hide();
                    error.hide();

                    if (form.valid() == false) {
                        return false;
                    }

                    handleTitle(tab, navigation, index);
                },
                onPrevious: function (tab, navigation, index) {
                    success.hide();
                    error.hide();

                    handleTitle(tab, navigation, index);
                },
                onTabShow: function (tab, navigation, index) {
                    var total = navigation.find('li').length;
                    var current = index + 1;
                    var $percent = (current / total) * 100;
                    $('#form_wizard_1').find('.progress-bar').css({
                        width: $percent + '%'
                    });
                    $('#uploadbar').find('.progress-bar').css({
                        width: '0%'
                    });
                }
            });

            $('#form_wizard_1').find('.button-previous').hide();
            $('#form_wizard_1 .button-submit').click(function () {
//                alert('Finished! Hope you like it :)');
            	form.submit();
            }).hide();
        }

    };

}();