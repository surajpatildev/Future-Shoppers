package in.sj.futureshopping.dto;

import java.util.Arrays;
import java.util.List;

public enum UserRoles {
	// the collection of different roles that users can have

	USER, SUPPLIER;

	public static List<UserRoles> asList() {
		UserRoles[] all = UserRoles.values();
		return Arrays.asList(all);
	}
}
