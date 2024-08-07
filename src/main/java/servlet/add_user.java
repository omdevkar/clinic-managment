/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Tejas
 */
public class add_user extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
                String umail=request.getParameter("email");
            String upass=request.getParameter("password");
            String urepass=request.getParameter("repassword");
            String uname=request.getParameter("name");
            String ubirthday=request.getParameter("birthday");
            String umob_no=request.getParameter("mob_no");
            String user_type=request.getParameter("user_type");
            HttpSession session=request.getSession();
            
            Connection con=null;
            
            //Validations Starts
            
            if (uname==null) {
                session.setAttribute("status","Invalide Name");
                response.sendRedirect("register.jsp");
                return;
            }
            
            
            if (umail==null ) {
                session.setAttribute("status","Invalide Email");
                response.sendRedirect("register.jsp");
                return;
            }
            
            
            if (upass==null ) {
                session.setAttribute("status","Invalide Pass");
                response.sendRedirect("register.jsp");
                return;
            }
            if(!upass.equals(urepass)){
                session.setAttribute("status","Confirm Password Does Not Match");
                response.sendRedirect("register.jsp");
                return;
            }
            
            if (ubirthday==null) {
                session.setAttribute("status","Invalide Birth-Date");
                response.sendRedirect("register.jsp");
                return;
            }
            
            if (umob_no==null) {
                session.setAttribute("status","Invalide Mobile Number");
                response.sendRedirect("register.jsp");
                return;
            }
            if (user_type==null) {
                session.setAttribute("status","Invalide Mobile Number");
                response.sendRedirect("register.jsp");
                return;
            }
            
            //Validations Ends
            
            //Database-connection Starts
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/careandcure?autoReconnect=true&useSSL=false","root","root");
                PreparedStatement pst=con.prepareStatement("insert into patient_details_1(patient_Name,patient_Email,patient_Password,patient_BirthDate,patient_MobNo,user_Type) values(?,?,?,?,?,?)");
                pst.setString(1, uname);
                pst.setString(2, umail);
                pst.setString(3, upass);
                pst.setString(4, ubirthday);
                pst.setString(5, umob_no);
                pst.setString(6, user_type);
                int row = pst.executeUpdate();
                
                if (row>0) {
                    session.setAttribute("status", "Registraion Successful!!");
                    response.sendRedirect("login.jsp");
                    
                }
                else{
                    session.setAttribute("status","Registration Failed!!");
                    response.sendRedirect("register.jsp");
                    
                }
                
            } catch (Exception e) {
                out.print(e);
            }
            finally{
                try {
                    con.close();
                } catch (Exception e) {
                    out.print(e);
                }
            }
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
