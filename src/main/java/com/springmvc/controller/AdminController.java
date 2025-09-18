package com.springmvc.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.model.*;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

    @RequestMapping(value = "/adminHome", method = RequestMethod.GET)
    public ModelAndView adminHome(HttpSession session) {
        User user = (User) session.getAttribute("user");

        if (user == null || !user.getEmail().equals("admin@gmail.com")) {
            return new ModelAndView("redirect:/login");
        }

        UserManager um = new UserManager();
        List<User> users = um.getAllUser(); // ดึงผู้ใช้ทั้งหมด
        List<Post> allPosts = um.getAllPosts();
        ModelAndView mav = new ModelAndView("admin_home");
        mav.addObject("users", users);// ส่งรายชื่อผู้ใช้ไปหน้า admin_home
        mav.addObject("posts", allPosts);
        return mav;
    }

    // ฟังก์ชันสำหรับลบผู้ใช้
    @RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
    public ModelAndView deleteUser(HttpServletRequest request, HttpSession session) {
        String email = request.getParameter("email");

        UserManager um = new UserManager();
        User user = um.getUserByEmail(email);
        boolean result = um.deleteUser(user);

        List<User> users = um.getAllUser();

        ModelAndView mav = new ModelAndView("manage_users");
        mav.addObject("users", users);

        if (!result) {
            mav.addObject("error", "เกิดข้อผิดพลาดในการลบผู้ใช้");
        }

        return mav;
    }
    @RequestMapping(value = "/deletePost", method = RequestMethod.POST)
    public ModelAndView deletePost(HttpServletRequest request, HttpSession session) {
        String postIdStr = request.getParameter("id");
        int postId;
        postId = Integer.parseInt(postIdStr);
        UserManager um = new UserManager();
        Post p = um.getPostByid(postId);
        boolean result = um.deletePost(p);

        List<Post> posts = um.getAllPosts();
        ModelAndView mav = new ModelAndView("manage_user_posts");
        mav.addObject("posts", posts);

        if (!result) {
            mav.addObject("error", "เกิดข้อผิดพลาดในการลบโพสต์");
        }

        return mav;
    }

    @RequestMapping(value = "/deleteComment", method = RequestMethod.POST)
    public ModelAndView deleteComment(HttpServletRequest request, HttpSession session) {
        String commentIdStr = request.getParameter("id");
        int commentId;
        commentId = Integer.parseInt(commentIdStr);

        UserManager um = new UserManager();
        Comment comment = um.getCommentById(commentId);
        
        boolean result = um.deleteComment(comment);

        List<Comment> comments = um.getAllComments();
        ModelAndView mav = new ModelAndView("manage_user_comments");
        mav.addObject("comments", comments);

        if (!result) {
            mav.addObject("error", "เกิดข้อผิดพลาดในการลบคอมเมนต์");
        }

        return mav;
    }


    @RequestMapping(value = "/manageUserPosts", method = RequestMethod.GET)
    public ModelAndView manageUserPosts(HttpSession session) {
        User user = (User) session.getAttribute("user");

        // ตรวจสอบว่าเป็น admin หรือไม่
        if (user == null || !user.getEmail().equals("admin@gmail.com")) {
            return new ModelAndView("redirect:/login");
        }

        UserManager um = new UserManager();
        List<Post> posts = um.getAllPosts(); // ดึงโพสต์ทั้งหมด
        
        ModelAndView mav = new ModelAndView("manage_user_posts");
        mav.addObject("posts", posts);
        return mav;
    }

    @RequestMapping(value = "/manageUserComments", method = RequestMethod.GET)
    public ModelAndView manageUserComments(HttpSession session) {
        User user = (User) session.getAttribute("user");

        // ตรวจสอบว่าเป็น admin หรือไม่
        if (user == null || !user.getEmail().equals("admin@gmail.com")) {
            return new ModelAndView("redirect:/login");
        }

        UserManager um = new UserManager();
        List<Comment> comments = um.getAllComments(); // ดึงคอมเมนต์ทั้งหมด
        
        ModelAndView mav = new ModelAndView("manage_user_comments");
        mav.addObject("comments", comments);
        return mav;
    }




    
    @RequestMapping(value = "/manageUsers", method = RequestMethod.GET)
    public ModelAndView manageUsers(HttpSession session) {
        User user = (User) session.getAttribute("user");
        
        // ตรวจสอบว่าผู้ใช้คือ admin หรือไม่
        if (user == null || !user.getEmail().equals("admin@gmail.com")) {
            return new ModelAndView("redirect:/login");
        }

        UserManager um = new UserManager();
        List<User> users = um.getAllUser(); // ดึงข้อมูลผู้ใช้ทั้งหมด
        
        ModelAndView mav = new ModelAndView("manage_users");
        mav.addObject("users", users);
        return mav;
    }

}
