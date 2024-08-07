/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Tejas
 */
public class login_servlet1 extends HttpServlet {

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
            String uemail=request.getParameter("email");
            String upass=request.getParameter("password");
            HttpSession session=request.getSession();
            Connection con =null;
            RequestDispatcher dispatcher =null;
            
            //VALIDATIONS STARTS
            if (uemail==null && uemail.equals("")) {
                session.setAttribute("status","Invalide Email");
                response.sendRedirect("login.jsp");
                return;
            }
            if (upass==null && upass.equals("")) {
                session.setAttribute("status","Invalide Password");
                response.sendRedirect("login.jsp");
                return;
            }
            
            //Validations Ends
            
            //Database-connection Starts
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/careandcure?autoReconnect=true&useSSL=false","root","root");
                PreparedStatement pst=con.prepareStatement("select * from patient_details_1 where patient_Email = ? and patient_Password = ?");
                pst.setString(1, uemail);
                pst.setString(2, upass);
                ResultSet rs = pst.executeQuery();
                if (rs.next()) {
                    session.setAttribute("name", rs.getString("patient_Name"));
                    session.setAttribute("userType", rs.getString("user_Type"));
                    String userType=(String) session.getAttribute("userType");
                    if (userType.equals("admin")) {
                        response.sendRedirect("admin_home.jsp");
                        return;
                    }
                    if (userType.equals("doctor")) {
                        response.sendRedirect("doctor_home.jsp");
                        return;
                    }
                    
                    if (userType.equals("normal")) {
                        response.sendRedirect("patient_home.jsp");
                        return;
                    }
                    if (userType.equals("receptionist")) {
                        response.sendRedirect("receptionist_home.jsp");
                        return;
                    }
                    
                   
                }
                else{
                    session.setAttribute("status", "failed");
                    dispatcher=request.getRequestDispatcher("login.jsp");
                }
                dispatcher.forward(request, response);
            } catch (Exception e) {
                out.print(e);
            }
            //Database-connection Ends
            
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
