ToggleMonth = function() {
  if ($("select#client_invoice_freq").val() == "Annual") {
    $("div#inv_month").css("visibility", "visible");
  } else {
    $("div#inv_month").css("visibility", "hidden");
  }
};

$(document).ready(function() {
	ToggleMonth();
	$("select#client_invoice_freq").change(function() {
		ToggleMonth();
	});

	$('[data-load-remote]').on('click',function(e) {
	    e.preventDefault();
	    var $this = $(this);
	    var remote = $this.data('load-remote');
	    if(remote) {
	        $($this.data('remote-target')).load(remote);
	        $($this.data('remote-target')).closest('div.modal').modal('show');
	    }
	});
});