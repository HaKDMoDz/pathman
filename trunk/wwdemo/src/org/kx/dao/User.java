package org.kx.dao;

/**
 * User entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class User extends AbstractUser implements java.io.Serializable {

    // Constructors

    /** default constructor */
    public User() {
    }

    /** full constructor */
    public User(String account, String name, String password) {
	super(account, name, password);
    }

}
