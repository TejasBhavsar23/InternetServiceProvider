package com.Tejas.ISP;

public  class GetCustomerId {
	public static String custid;
	
	public static void setCustid(String id) {
		GetCustomerId.custid = id;
	} 

	public static String getCustid() {
		return custid;
	}

}
