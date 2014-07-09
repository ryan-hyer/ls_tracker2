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
	        $('#myModal .modal-content').removeClass("modal-add modal-edit");
	        $('#myModal .modal-content').addClass(modal_class);
	    }
	});
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

	$('#myModal').modal('show');
});
