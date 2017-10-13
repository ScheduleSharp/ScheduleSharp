/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DbObjects;

/**
 *
 * @author nnair
 */
public class Courses {
    
    private int CourseID;
    private String CourseN;
    private int Section;
    private String CourseName;
    private String Instructor;
    private String blocks;
    private int year;
    private int semester;

    /**
     * @return the CourseID
     */
    public int getCourseID() {
        return CourseID;
    }

    /**
     * @param CourseID the CourseID to set
     */
    public void setCourseID(int CourseID) {
        this.CourseID = CourseID;
    }

    /**
     * @return the CourseN
     */
    public String getCourseN() {
        return CourseN;
    }

    /**
     * @param CourseN the CourseN to set
     */
    public void setCourseN(String CourseN) {
        this.CourseN = CourseN;
    }

    /**
     * @return the Section
     */
    public int getSection() {
        return Section;
    }

    /**
     * @param Section the Section to set
     */
    public void setSection(int Section) {
        this.Section = Section;
    }

    /**
     * @return the CourseName
     */
    public String getCourseName() {
        return CourseName;
    }

    /**
     * @param CourseName the CourseName to set
     */
    public void setCourseName(String CourseName) {
        this.CourseName = CourseName;
    }

    /**
     * @return the Instructor
     */
    public String getInstructor() {
        return Instructor;
    }

    /**
     * @param Instructor the Instructor to set
     */
    public void setInstructor(String Instructor) {
        this.Instructor = Instructor;
    }

    /**
     * @return the blocks
     */
    public String getBlocks() {
        return blocks;
    }

    /**
     * @param blocks the blocks to set
     */
    public void setBlocks(String blocks) {
        this.blocks = blocks;
    }

    /**
     * @return the year
     */
    public int getYear() {
        return year;
    }

    /**
     * @param year the year to set
     */
    public void setYear(int year) {
        this.year = year;
    }

    /**
     * @return the semester
     */
    public int getSemester() {
        return semester;
    }

    /**
     * @param semester the semester to set
     */
    public void setSemester(int semester) {
        this.semester = semester;
    }
    
    
}
