component accessors="true" {

	property userService;
	property beanFactory;

	public any function init( fw ) {
		variables.fw = fw;
		return this;
	}

	public void function default( rc ) {
		rc.user = variables.beanFactory.getBean("userBean");
	}

	public void function getUserAddress(rc) {
		var userWithAddress = userService.get(form.userName, form.dob, Val(form.houseNum), Val(form.postCode));
		if (!IsNull(userWithAddress)) {
			rc.user = userWithAddress;
			variables.fw.renderData( 'json', SerializeJSON(rc.user));
		} else {
			variables.fw.renderData( 'json', SerializeJSON(StructNew()), 404);
		}
	}

}
