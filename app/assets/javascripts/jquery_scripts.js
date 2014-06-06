$(document).ready(function() {
	$('[data-load-remote]').on('click',function(e) {
	    e.preventDefault();
	    var $this = $(this);
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
  
  $('#myModal').modal('show');
});