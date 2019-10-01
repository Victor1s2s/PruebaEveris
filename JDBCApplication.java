package org.springframework.samples.petclinic;


import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;




public class JDBCApplication {

	public static void main(String[] args) {
		System.out.println("-------- Test de conexión con MySQL ------------");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
		} catch (ClassNotFoundException e) {
			System.out.println("No encuentro el driver en el Classpath");
			e.printStackTrace();
			return;
		}

		System.out.println("Driver instalado y funcionando");
		Connection connection = null;
		Statement statement = null;
		PreparedStatement preparedStatement = null;
		
		
		
		try {
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/petclinic","root", "root");
			if (connection != null) {
				System.out.println("Conexión establecida");
				
				//insertarnos a nosotros mismos

				/*String sql = "INSERT INTO owners (first_name, last_name, address, city,telephone)" + 
						"VALUES ('Victor Manuel', 'Piris Carnerero', 'Calle Chivarria','Valencia de Alcantara',622893758)";
			   
				statement = connection.createStatement();
			    statement.executeUpdate(sql);*/
			 
			    //Actualizar modificar nuestra ciudad por sevilla
			    
				/*String sql="UPDATE owners" + 
			    "SET city = 'Sevilla'" + 
			    "WHERE id='12' ;";
				
				statement = connection.createStatement();
			    statement.executeUpdate(sql);*/
				
				
				
				 /*
				    String sql1 = "SELECT * FROM OWNERS";
				    statement = connection.createStatement();
	
				 ResultSet rs=statement.executeQuery(sql1);
				 
				 System.out.println("Id "+"++++++++++"+" nombre  ");				
				 while(rs.next()) {
					 
					 int id = rs.getInt("id");
					 String nombre = rs.getString("first_name");
					 String apellidos = rs.getString("last_name");
					 String direccion= rs.getString("address");
					 String ciudad= rs.getString("city");
					 String telefono= rs.getString("telephone");
						  
					
	
					 System.out.println("Id: "+id
							 +" nombre:  "+nombre
							 + " Apellidos: "+apellidos
							 +" ditecion: "+direccion
							 +" ciudad: "+ciudad
							 +" telefono: "+telefono);
				 }
				 
				 rs.close();*/
				 
			//select parametrizado
			
				//crear una variable de tipo string y buscar
			//todos los dueños con el mismo nombre
			
				//consulta parametrizada
 /*
				 String sql = "SELECT * FROM OWNERS where first_name LIKE ? OR last_name LIKE ?";
				 preparedStatement = connection.prepareStatement(sql);
				String nombreP = "Davis%";
				 preparedStatement.setString(1, nombreP);
				 preparedStatement.setString(1, nombreP);
					
		
				 ResultSet rs=preparedStatement.executeQuery();
				 
				 while(rs.next()) {
					 
					 int id = rs.getInt("id");
					 String nombre = rs.getString("first_name");
					 String apellidos = rs.getString("last_name");
					 
						
					 System.out.println("Id: "+id+" nombre:  "+nombre+ " Apellidos: "+apellidos);
				 }
				 rs.close();*/
				 
				 
				 // insert parametrizado
				 //crear a partir de unas variables nombre,apellidos,direcion,ciudad y telefono (todas string)
				 // un nuevo owner
				
				 String nombre = "Andres";
				 String apellidos = "Lumbreras";
				 String direccion= "Calle liorna";
				 String ciudad= "Sevilla";
				 String telefono= "786523245";
				 String sql = " insert into owners (first_name, last_name, address, city,telephone) values (?, ?, ?, ?, ?)";
				 preparedStatement = connection.prepareStatement(sql);
					
					 preparedStatement.setString(1, nombre);
					 preparedStatement.setString(2, apellidos);
					 preparedStatement.setString(3, direccion);
					 preparedStatement.setString(4, ciudad);
					 preparedStatement.setString(5, telefono);
				 
				
				 
			
			}
		
			
			
			
			
			
			
		
			
			} catch (SQLException e) {
			System.out.println("Connection Failed! Check output console");
			e.printStackTrace();
			return;
		} finally {
			try {
				if(statement != null)
					connection.close();
			} catch (SQLException se) {
		    	  
		    }
		    try {
		        if(connection != null)
		            connection.close();
		    } catch (SQLException se) {
		         	se.printStackTrace();
		    }
		}
		
		
		
		
		
		
	}

}
