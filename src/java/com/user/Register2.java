/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.user;

import java.io.File;
import java.io.*;
import javax.servlet.*;
import java.sql.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author ANUPRIYA
 */

@MultipartConfig     
public class Register2 extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           
            //getting all the incoming detail from the request
            String name=request.getParameter("user_name");
            String email=request.getParameter("user_email");
            String password=request.getParameter("user_password");
            Part part=request.getPart("image");
            String filename = part.getSubmittedFileName();
 //           out.println(filename);
//            out.println(name);
//            out.println(email);
//            out.println(password);
            
            //connection with the help of jdbc
            try{
             
                
             //Thread.sleep(1000);
             
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","root@123");
            
            //query....
            String q="insert into user(name,email,password,imageName) value(?,?,?,?)";
            PreparedStatement pstmt  = con.prepareStatement(q);
            pstmt.setString(1,name);
            pstmt.setString(2,email);
            pstmt.setString(3,password);
            pstmt.setString(4,filename);
           
            pstmt.executeUpdate();
            //upload...
            InputStream is = part.getInputStream();
            byte []data = new byte[is.available()];
            
            is.read(data);
            String path = request.getRealPath("/")+"img"+File.separator+filename;
//            out.println(path);
            FileOutputStream fos = new FileOutputStream(path);
                    fos.write(data);
               
            
            
            out.println("done");
            
            
            }catch(Exception e){
                e.printStackTrace();
                out.println("error!!");
            }
            
            
            
            // database......
            
            
            
           
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
