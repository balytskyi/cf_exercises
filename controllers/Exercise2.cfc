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
		rc.user = userService.get(form.userName, form.dob, Val(form.houseNum), Val(form.postCode));
		variables.fw.renderData( 'json', SerializeJSON(rc.user));
	}

}
