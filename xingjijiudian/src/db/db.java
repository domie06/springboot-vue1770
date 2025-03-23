package db;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.*;
import java.util.Properties;
public class db {
	private String dbDriver="";
	private String username = "";
	private String password = "";
	private String sConnStr = ""; 
	public Connection connect = null;
	  public ResultSet rs=null;
	  public db() {
	    try {
	      String realpath = db.class.getResource("/").toString();
	      String osname = System.getProperty("os.name");
			int data = 6;
			if (osname.toLowerCase().indexOf("windows") >= 0) {
				data = 6;
			} else {
				data = 5;
			}
			realpath = realpath.substring(data,realpath.length());
			Properties props = new Properties();
			props.load(new FileInputStream(realpath + "config.properties"));
			dbDriver ="com.mysql.jdbc.Driver"; //Çý¶¯
			sConnStr =props.getProperty("jdbc_url"); //Êý¾Ý¿âÃû³Æ
			username =props.getProperty("jdbc_username"); //ÕËºÅ
			password =props.getProperty("jdbc_password"); //ÃÜÂë
	      Class.forName(dbDriver).newInstance(); 
	     
	      connect = DriverManager.getConnection(sConnStr,username,password); 
	     
	    } catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    catch (Exception ex) {
	    	System.err.println(ex.getMessage());
	    }
	  }
	
	  
	  public ResultSet executeQuery(String sql) {
		  	System.out.println(sql);
			try{
				connect=DriverManager.getConnection(sConnStr,username,password);
				Statement stmt=connect.createStatement();
				rs=stmt.executeQuery(sql);
				
			}catch(SQLException ex){
				System.err.println(ex.getMessage());
			}
			return rs;
		}
	  public void executeUpdate(String sql)
	    {
		  	System.out.println(sql);
	    	Statement stmt=null;
	    	rs=null;
	    	try
	    	{   connect=DriverManager.getConnection(sConnStr,username,password);
	    		stmt=connect.createStatement();
	    		stmt.executeUpdate(sql);
	    		stmt.close();
	    		connect.close();
	    		
	    	
	    	}
	    	catch(SQLException ex)
	    	{
	    		System.err.println(ex.getMessage());
	    		
	    		
	    	}
	    
	    	
	    }
}
