package org.kx.dao;

/**
 * AbstractUser entity provides the base persistence definition of the User
 * entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractUser implements java.io.Serializable {

    // Fields

    private Integer id;
    private String account;
    private String name;
    private String password;

    // Constructors

    /** default constructor */
    public AbstractUser() {
    }

    /** full constructor */
    public AbstractUser(String account, String name, String password) {
	this.account = account;
	this.name = name;
	this.password = password;
    }

    // Property accessors

    public Integer getId() {
	return this.id;
    }

    public void setId(Integer id) {
	this.id = id;
    }

    public String getAccount() {
	return this.account;
    }

    public void setAccount(String account) {
	this.account = account;
    }

    public String getName() {
	return this.name;
    }

    public void setName(String name) {
	this.name = name;
    }

    public String getPassword() {
	return this.password;
    }

    public void setPassword(String password) {
	this.password = password;
    }

}