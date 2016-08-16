component accessors=true {

    function init(beanFactory) {
        variables.beanFactory = beanFactory;

		fillData();

        return this;
    }

    function fillData() {
		var users = QueryNew("userName, dob, houseNum, postCode, street, city", "CF_SQL_VARCHAR, CF_SQL_VARCHAR, CF_SQL_INTEGER, CF_SQL_INTEGER, CF_SQL_VARCHAR, CF_SQL_VARCHAR");
		QueryAddRow(users, 4);

		QuerySetCell(users, "userName", "John Doe", 1);
		QuerySetCell(users, "dob", "09/04/1988", 1);
		QuerySetCell(users, "houseNum", 10, 1);
		QuerySetCell(users, "postCode", 7900, 1);
		QuerySetCell(users, "street", "64 Ave", 1);
		QuerySetCell(users, "city", "New York", 1);

		QuerySetCell(users, "userName", "Jane Doe", 2);
		QuerySetCell(users, "dob", "10/04/1985", 2);
		QuerySetCell(users, "houseNum", 10, 2);
		QuerySetCell(users, "postCode", 7901, 2);
		QuerySetCell(users, "street", "65 Ave", 2);
		QuerySetCell(users, "city", "Los Angeles", 2);

		QuerySetCell(users, "userName", "Katy Doe", 3);
		QuerySetCell(users, "dob", "11/05/1986", 3);
		QuerySetCell(users, "houseNum", 10, 3);
		QuerySetCell(users, "postCode", 7902, 3);
		QuerySetCell(users, "street", "66 Ave", 3);
		QuerySetCell(users, "city", "Seatle", 3);

		QuerySetCell(users, "userName", "Sven Doe", 4);
		QuerySetCell(users, "dob", "12/01/1980", 4);
		QuerySetCell(users, "houseNum", 10, 4);
		QuerySetCell(users, "postCode", 7903, 4);
		QuerySetCell(users, "street", "67 Ave", 4);
		QuerySetCell(users, "city", "Portland", 4);

		variables.users = users;
    }

	function get(string userName, string dob, numeric houseNum, numeric postCode) {
		var queryService = new query();
		queryService.setDbType("query");
		queryService.setAttributes(sourceQuery = variables.users);
		queryService.setSql("SELECT * FROM sourceQuery WHERE userName = :userName AND dob = :dob AND houseNum = :houseNum AND postCode = :postCode");
		queryService.addParam(name="userName",value=userName,cfsqltype="cf_sql_varchar");
		queryService.addParam(name="dob",value=dob,cfsqltype="cf_sql_varchar");
		queryService.addParam(name="houseNum",value=houseNum,cfsqltype="cf_sql_integer");
		queryService.addParam(name="postCode",value=postCode,cfsqltype="cf_sql_integer");

 		var records = queryService.execute().getResult();

		if (records.RecordCount GT 0) {
			var user = variables.beanFactory.getBean("userBean");

			user.setUserName(records["userName"][1]);
			user.setDob(records["dob"][1]);
			user.setHouseNum(records["houseNum"][1]);
			user.setPostCode(records["postCode"][1]);
			user.setStreet(records["street"][1]);
			user.setCity(records["city"][1]);

			return user;
		}
    }

}