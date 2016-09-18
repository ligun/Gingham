package gingham

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes='authority')
@ToString(includes='authority', includeNames=true, includePackage=false)
class Role implements Serializable {

	private static final long serialVersionUID = 1

	String name
	String authority

	static constraints = {
		name blank: false, unique: true
		authority blank: false, unique: true
	}

	static mapping = {
		cache true
	}
}
