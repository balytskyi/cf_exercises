<cfset rc.title = "Exercise 2" />
<cfset local.user = rc.user>

<cfform name="userForm" action="" method="POST">

	<div class="field">
		<label for="userName" class="label">Name:</label>
		<cfinput type="text" name="userName" id="userName" value="#local.user.getUserName()#">
	</div>

	<div class="field">
		<label for="dob" class="label">Date of birth:</label>
		<cfinput type="text" name="dob" id="dob" value="#local.user.getDOB()#">
	</div>

	<div class="field">
		<label for="houseNum" class="label">House number:</label>
		<cfinput type="text" name="houseNum" id="houseNum" value="#local.user.getHouseNum()#">
	</div>

	<div class="field">
		<label for="postCode" class="label">Post code:</label>
		<cfinput type="text" name="postCode" id="postCode" value="#local.user.getPostCode()#">
	</div>

	<div class="field" id="streetContainer" style="display: none;">
		<label for="street" class="label">Street:</label>
		<cfinput type="text" name="street" id="street" value="#local.user.getStreet()#">
	</div>

	<div class="field" id="cityContainer" style="display: none;">
		<label for="city" class="label">City:</label>
		<cfinput type="text" name="city" id="city" value="#local.user.getCity()#">
	</div>


	<div class="control">
		<input id="submit" type="submit" value="Submit">
	</div>
</cfform>

<div id="errorContainer"></div>

<cfoutput>
	<a href="#buildURL('main')#">Back</a>
</cfoutput>

<div>
	<p>Try to look for:</p>
	<ul>
		<li>Name: John Doe</li>
		<li>DOB: 09/04/1988</li>
		<li>House Number: 10</li>
		<li>Post Code: 7900</li>
	</ul>
	<ul>
		<li>Name: Sven Doe</li>
		<li>DOB: 12/01/1980</li>
		<li>House Number: 10</li>
		<li>Post Code: 7903</li>
	</ul>
</div>

<script>
    (function($) {
        $('#submit').click( function(e) {
            e.preventDefault();
            $.post(
                '<cfoutput>#buildURL("exercise2.getUserAddress")#</cfoutput>',
                {
                    userName: $('#userName').val(),
                    dob: $('#dob').val(),
                    houseNum: $('#houseNum').val(),
                    postCode: $('#postCode').val()
                }
                )
                .done( function(data) {
					var user = $.parseJSON(data);
					$('#streetContainer').show();
					$('#cityContainer').show();

					$('#street').val(user["street"]);
                   	$('#city').val(user["city"]);

                   	$('#errorContainer').empty();
                })
                .fail( function() {
                	$('#streetContainer').hide();
					$('#cityContainer').hide();

                    $('#errorContainer').html('Cannot find address');
                }
            );
        });
    })(jQuery);
</script>