/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Stud;

import DbObjects.Courses;
import DbObjects.School;
import JavaCode.admin.DatabaseInfo;
import System.StudentBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nnair
 */
public class SelectAllCourses extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            StudentBean stud = (StudentBean) request.getSession(true).getAttribute("currentSessionUser");
            int schoolID = stud.getSchoolID();
            
            DatabaseInfo dbInfo = new DatabaseInfo();
            Connection conn = null;
            Class.forName(dbInfo.getDriver()).newInstance();
            conn = DriverManager.getConnection(dbInfo.getUrl() + dbInfo.getDbName(), dbInfo.getDbUserName(), dbInfo.getDbPassword());
            
            String redirect = request.getParameter("redirectTo");
            HttpSession session = request.getSession();
            String schools = "SELECT * FROM AssignedSchedule WHERE ASchoolID = ?";
            PreparedStatement stm = conn.prepareStatement(schools);
            stm.setInt(1, schoolID);
            ResultSet rs = stm.executeQuery();

            //ServletContext sc = getServletConfig().getServletContext();
            List<Courses> courseList = new ArrayList<>();      // list to be returned
            
            while (rs.next()) {
                Courses course = new Courses();
                
                course.setCourseID(rs.getInt("AScheduleID"));
                course.setCourseN(rs.getString("ACourseID"));
                course.setSection(rs.getInt("ASectionID"));
                course.setCourseName(rs.getString("ACourseName"));
                course.setInstructor(rs.getString("AInstName"));
                course.setBlocks(rs.getString("ABlocks"));
                course.setYear(rs.getInt("AYear"));
                course.setSemester(rs.getInt("ASemester"));
                
                courseList.add(course);
            }

            session.setAttribute("crs", courseList);
            //RequestDispatcher rd = request.getRequestDispatcher("Admin/modifySchool.jsp");

            response.sendRedirect("Stud/" + redirect + ".jsp");
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SelectAllCourses.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(SelectAllCourses.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(SelectAllCourses.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SelectAllCourses.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SelectAllCourses.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(SelectAllCourses.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(SelectAllCourses.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SelectAllCourses.class.getName()).log(Level.SEVERE, null, ex);
        }
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
