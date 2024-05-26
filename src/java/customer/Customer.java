
package customer;

/**
 *
 * @author pulin
 */
public class Customer {
    int id;
    private String first_name;
    private String last_name;
    private String address;
    private String phone;
    private String email;
    private String password;
    private String user;
    
    public Customer(int id, String first_name, String last_name, String address,String phone,String email,String password, String user){
        this.id = id;
        this.first_name = first_name;
        this.last_name = last_name;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.password = password;
        this.user = user;
        
    }
    
    // Getters
    public int getId() {
        return id;
    }

    public String getFirst_name() {
    return first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public String getAddress() {
        return address;
    }

    public String getPhone() {
        return phone;
    }

    public String getEmail() {
        return email;
    }
    
    public String getPassword() {
        return password;
    }
        
    public String getUser() {
        return user;
    }    

    


    
}
