/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package myclasses;

/**
 *
 * @author ABCD
 */

import java.util.Calendar;  
import javax.servlet.jsp.JspException;  
import javax.servlet.jsp.JspWriter;  
import static javax.servlet.jsp.tagext.Tag.SKIP_BODY;
import javax.servlet.jsp.tagext.TagSupport;  
public class LoginTime extends TagSupport{  
  
public int doStartTag() throws JspException {  
    JspWriter out=pageContext.getOut(); 
    try{  
     out.print(Calendar.getInstance().getTime());//printing date and time using JspWriter  
    }catch(Exception e){System.out.println(e);}  
    return SKIP_BODY; 
}  
}  
