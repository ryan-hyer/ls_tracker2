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
		today = yyyy+'-'+mm+'-'+dd;
		$('#invoice_date_invoiced').val(today);
	}

	// Extra functionality for the category standard list
	$('#add-std-btn').on('click',function(e) {
	    e.preventDefault();
	    var new_id = new Date().getTime();
	    var regexp = new RegExp("-1", "g");
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

	$('#myModal').modal('show');
});
