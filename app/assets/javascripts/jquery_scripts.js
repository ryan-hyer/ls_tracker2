var obj;

$(document).ready(function() {
	$('[data-load-remote]').on('click',function(e) {
    e.preventDefault();
    var $this = $(this);
    obj = $this;
    var remote = $this.data('load-remote');
    if(remote) {
      $('#myModal .modal-body').load(remote);
      var modal_title = $this.attr('title');
      var modal_class = "modal-" + modal_title.substr(0, modal_title.indexOf(" ")).toLowerCase();
      $('#myModal .modal-title').text(modal_title);
      $('#myModal .modal-content').removeClass("modal-add modal-edit modal-info");
      $('#myModal .modal-content').addClass(modal_class);
    }
	});
	$('[data-toggle="tooltip"]').tooltip();
	$('[data-toggle="popover"]').popover();
});


$(document).ajaxSuccess(function() {
	// Extra functionality for the Client add/edit modals
	if ($("#client_invoice_freq").val() != "Annual") {
		$("#inv_month").css("visibility", "hidden");
	}
	$("#client_invoice_freq").change(function() {
		if ($("#client_invoice_freq").val() != "Annual") {
			$("#inv_month").css("visibility", "hidden");
		} else {
			$("#inv_month").css("visibility", "visible");
		}
	});
	if ($("#client_status").val() == "Active" || $("#client_status").val() == "NewApp") {
		$("#delist_date").css("visibility", "hidden");
	}
	$("#client_status").change(function() {
		if ($("#client_status").val() == "Active" || $("#client_status").val() == "NewApp") {
			$("#delist_date").css("visibility", "hidden");
		} else {
			$("#delist_date").css("visibility", "visible");
		}
	});

	// Extra functionality for the Invoice add modal (auto-fill)
	if(obj.data('fill-invoice')) {
		var row = $(obj).closest("tr");
		$('#invoice_number').val($(row.children("td.next_number")).html());
		$('#invoice_client_id').val($(row.children("td.client")).attr("ref"));
		$('#invoice_description').val($(row.children("td.description")).html());
		var amount = $(row.children("td.amount")).html();
		amount = amount.replace(/[^\d.]/g,"");
		$('#invoice_amount').val(amount);
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1;
		var yyyy = today.getFullYear();
		if (dd<10) {dd='0'+dd};
		if (mm<10) {mm='0'+mm};
		today = mm+'/'+dd+'/'+yyyy
		$('#invoice_date_invoiced').val(today);
	}

	// Extra functionality for the category standard list
	$('#add-std-btn').on('click',function(e) {
    e.preventDefault();
    var new_id = new Date().getTime();
    var regexp = new RegExp("-999", "g");
    $("#standard-list").append($("#std-add-new-template").html().replace(regexp, new_id));
	});

	$('.del-std-btn').on('click',function(e) {
    e.preventDefault();
    $(this).prev("input[type=hidden]").val("true");
    $(this).closest(".field").hide();
	});

	// Extra functionality for the listing standard checkbox list
	$('#listing_category_id').change(function() {
		var category = $(this).val();
		$("div[id|='category']").hide();
		$('input:checkbox').removeAttr('checked');
		$("#category-"+category).removeClass("hidden").show();
	});

	// Extra functionality for the inspection tagged test list
	$('#add-test-btn').on('click',function(e) {
    e.preventDefault();
    var new_id = new Date().getTime();
    var regexp = new RegExp("-999", "g");
    $("#test-list tr:last").after("<tr>" + $("#test-add-new-template").html().replace(regexp, new_id) + "</tr>");
	});

	$('.del-test-btn').on('click',function(e) {
    e.preventDefault();
    $(this).prev("input[type=hidden]").val("true");
    $(this).closest("tr").hide();
	});

	// Extra functionality for the Amendment add/edit modals
	switch($('#amendment_project_type').val()) {
		case ("Listing Addition"):
		case ("Design Change"):
		case ("New Listing Application"):
			$('#facility-amendments').hide();
			$('#model-amendments').show();
			break;
		case ("Facility Change"):
			$('#model-amendments').hide();
			$('#facility-amendments').show();
			break;
		default:
			$('#model-amendments').hide();
			$('#facility-amendments').hide();
	}
	$('#amendment_project_type').change(function() {
		switch($(this).val()) {
			case ("Listing Addition"):
			case ("Design Change"):
			case ("New Listing Application"):
					$('#facility-amendments').hide();
					$('#model-amendments').show();
					break;
				case ("Facility Change"):
					$('#model-amendments').hide();
					$('#facility-amendments').show();
					break;
				default:
					$('#model-amendments').hide();
					$('#facility-amendments').hide();
		}
	});
	if ($("#amendment_status").val() != "Canceled Before Completion" && $("#amendment_status").val() != "Complete") {
		$("#date_closed").css("visibility", "hidden");
	}
	$("#amendment_status").change(function() {
		if ($("#amendment_status").val() != "Canceled Before Completion" && $("#amendment_status").val() != "Complete") {
			$("#date_closed").css("visibility", "hidden");
		} else {
			$("#date_closed").css("visibility", "visible");
		}
	});


	$('#myModal').modal('show');
});