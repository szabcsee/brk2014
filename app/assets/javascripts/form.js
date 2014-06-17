$(document).ready(function(){
	// Initial housekeeping for the form and setting variables
	$("#escort_fields").hide();
	$("input:checkbox").prop("checked", false);
	$("#user_price_method").val("");

	var cat = '';
	var pricecat = '';
	var lang = $("#form_language").val();

	$("#currency_selector").val(lang);
	$(".meal_price").val('0');
	$("#forint").hide();
	$("#eur").hide();
	$("#email_warning").hide();
	$(".price_category_info").hide();
	$("#price_method_alert").hide();

	// Setup form helpers
	$("#user_email_address").focus(function(){
		$("#email_warning").show();
	});

	$("#user_email_address").focusout(function(){
		$("#email_warning").hide();
	});

	// Listeners
	$("#currency_selector").change(function(){
		lang = $(this).val();
		calculateTotal();
	});
	$("#user_price_method").change(function(){
		cat = $(this).val();
		calculateTotal();
	});

	$("input[name$='user[price_category]']").each(function(){
		$(this).prop('checked', false);
		calculateTotal();
	});

	$("input[name$='user[price_category]']").click(function(){
		if ($(this).attr("id") == "user_price_category_escort"){
			$("#escort_fields").show();
			$(".program_participation").prop('checked', false);
        	$("#program_fields").hide();
		}
		else {
			$(".escort_day").prop('checked', false);
			$("#escort_fields").hide();
        	$("#program_fields").show();
		}
		$('.price_category_info').hide();
		pricecat = $(this).val();
		$('#'+$(this).attr('id')+'_info').show();
		$('#price_method_alert').show();
		calculateTotal();
	});

	$(".escort_day").click(function(){
       calculateTotal();
	});

	$(".meal_price").change(function(){
		if (cat == ''){
			if ($("#form_language").val() == "hu"){
	        	alert('Válaszd ki a fizetés módját');
	        	}
	       	if ($("#form_language").val() == "en"){
	        	alert('Choose payment method');
	        	}
			$(this).prop('checked', false);
		}
		else {
       		calculateTotal();
        }
	});

	$(".program_participation").click(function(){
		if (pricecat == '' || cat == ''){
			if ($("#form_language").val() == "hu"){
	        	alert('Válassz árkategóriát');
	        	}
	       	if ($("#form_language").val() == "en"){
	        	alert('Choose price category');
	        	}
			$(this).prop('checked', false);
		}
		calculateTotal();
	});

	$(document).on('click', '.meal_fields', function(){
   		calculateTotal();
	});

	$(document).on('click', '.add_nested_fields', function(){
   		calculateTotal();
	});

	$(document).on('click', '.remove_fields', function(){
   		calculateTotal();
	});


	// Main function, calculates prices
	function calculateTotal() {
		price = 0;

		// Calculate escort prices
		if ($(".escort_day").not(':checked').length == 0){
        		if (lang == "hu"){
			        	price = price + 5000;
			    }
			    if (lang == "en"){
			        	price = price + 17;
			    }
		}
		else {
			$(".escort_day").each(function(){
        		if($(this).is(':checked')){
		        	if (lang == "hu"){
			        	price = price + parseFloat($(this).val());
			        }
			        if (lang == "en"){
			        	price = price + 3.5;
			        }
	        	}

        	});
		}

		// Calculate meal prices
        $(".meal_price").each(function()
        {
        	if($(this).is(':visible')){
        		if ($(this).hasClass("first_day"))
        		{
        			if (cat == "after")
        			{
	        			if ($(this).val() == "3"){
	        				if (lang == "hu"){
	        					price = price + 1200;
	        				}
	        				if (lang == "en"){
	        					price = price + 4;
	        				}
	        			}
        			}
        			if (cat == "before")
        			{
	        			if ($(this).val() == "3"){
	        				if (lang == "hu"){
	        					price = price + 800;
	        				}
	        				if (lang == "en"){
	        					price = price + 3;
	        				}
	        			}
        			}
        		}
        		else if ($(this).hasClass("sixth_day"))
        		{
        			if (cat == "after")
        			{
	        			if ($(this).val() == "3"){
	        				if (lang == "hu"){
	        					price = price + 1800;
	        				}
	        				if (lang == "en"){
	        					price = price + 6;
	        				}
	        			}
        			}
        			if (cat == "before")
        			{
	        			if ($(this).val() == "3"){
	        				if (lang == "hu"){
	        					price = price + 1300;
	        				}
	        				if (lang == "en"){
	        					price = price + 5;
	        				}
	        			}
        			}
        		}
        		else
        		{
        			if (cat == "after")
        			{
	        			if ($(this).val() == "3"){
	        				if (lang == "hu"){
	        					price = price + 3000;
	        				}
	        				if (lang == "en"){
	        					price = price + 10;
	        				}
	        			}
        			}
        			if (cat == "before")
        			{
	        			if ($(this).val() == "3"){
	        				if (lang == "hu"){
	        					price = price + 2100;
	        				}
	        				if (lang == "en"){
	        					price = price + 8;
	        				}
	        			}
        			}
        		}
        	}
        });
		if ($(".program_participation").not(':checked').length == 0){
				if (cat == 'after' && pricecat == 'full'){
						if (lang == "hu"){
	        				price = price + 20000;
	        			}
	        			if (lang == "en"){
	        				price = price + 70;
	        			}
				}
				if (cat == 'before' && pricecat == 'full'){
						if (lang == "hu"){
	        				price = price + 15000;
	        			}
	        			if (lang == "en"){
	        				price = price + 50;
	        			}
				}
				else if (pricecat == 'discount'){
						if (lang == "hu"){
	        				price = price + 10000;
	        			}
	        			if (lang == "en"){
	        				price = price + 35;
	        			}
	        	}
		}
		else {
			$(".program_participation").each(function(){
					if($(this).is(':checked'))
					{
							if (pricecat == 'full'){
								if (lang == "hu"){
		        					price = price + parseFloat($(this).attr('data-full-price'));
		        				}
		        				if (lang == "en"){
		        					price = price + parseFloat($(this).attr('data-full-price-eur'));
		        				}
							}
							else if (pricecat == 'discount')
							{
								if (lang == "hu"){
		        					price = price + parseFloat($(this).attr('data-discount-price'));
		        				}
		        				if (lang == "en"){
		        					price = price + parseFloat($(this).attr('data-discount-price-eur'));
		        				}
							}
							else if (pricecat == 'escort')
							{
								price = price;
							}
					}
			});
		}
        $("#total_price").text(price);
        $(".price_container").val(price);
        if (lang == "hu"){
        	$("#eur").hide();
        	$("#forint").show();
        }
        if (lang == "en"){
        	$("#forint").hide();
        	$("#eur").show();
        }
        price = 0;
	}
});