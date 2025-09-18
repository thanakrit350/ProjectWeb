package com.springmvc.controller;

import java.util.*;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.model.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ProjectController {
	
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView loadStartPage(HttpSession session) {
        UserManager um = new UserManager();

        List<Post> allPosts = um.getAllPosts();

        ModelAndView mav = new ModelAndView("index");
        mav.addObject("posts", allPosts);
        return mav;
    }
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView loadIndexPage(HttpSession session) {
        UserManager um = new UserManager();

        List<Post> allPosts = um.getAllPosts();

        ModelAndView mav = new ModelAndView("index");
        mav.addObject("posts", allPosts);
        return mav;
    }

	@RequestMapping(value = "/reg", method = RequestMethod.GET)
	public String loadRegisterPage() {
		return "register";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request, HttpSession session) {
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String dob = request.getParameter("dob");
		String profileUrl = request.getParameter("profileUrl");
		try {
		password = PasswordUtil.getInstance().createPassword(password,"itmjusci");
		}catch(Exception e){
			e.printStackTrace();
		}
		UserManager um = new UserManager();
		User user = new User(email,name,password,dob,profileUrl);
		um.InsertUser(user);
		return new ModelAndView("login");
	}
    
	@RequestMapping(value = "/home", method = RequestMethod.POST)
	public ModelAndView home(HttpServletRequest request, HttpSession session) {
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");
	    UserManager um = new UserManager();

	    // ตรวจสอบว่า email มีอยู่ในระบบหรือไม่
	    if (!um.emailExists(email)) {
	        ModelAndView mav = new ModelAndView("login");
	        mav.addObject("error", "ไม่มีอีเมลนี้ในระบบ");
	        return mav;
	    }

	    try {
	        password = PasswordUtil.getInstance().createPassword(password, "itmjusci");
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    User user = um.validateUser(email, password);

	    if (user != null) {
	        session.setAttribute("user", user);
	        session.setMaxInactiveInterval(15 * 60);

	        // ตรวจสอบว่าเป็นผู้ใช้ admin หรือไม่
	        if (user.getEmail().equals("admin@gmail.com")) {
	            return new ModelAndView("redirect:/adminHome"); // เปลี่ยนเส้นทางไปหน้า admin_home.jsp
	        }

	        List<Post> allPosts = um.getAllPosts();
	        return new ModelAndView("home").addObject("posts", allPosts);
	    } else {
	        ModelAndView mav = new ModelAndView("login");
	        mav.addObject("error1", "กรอก Email หรือ รหัสไม่ถูกต้อง");
	        return mav;
	    }
	}



	@RequestMapping(value = "/showHome", method = RequestMethod.GET)
	public ModelAndView showHome(HttpSession session) {
	    User user = (User) session.getAttribute("user");
	    UserManager um = new UserManager();

	    // ดึงโพสต์ทั้งหมด
	    List<Post> allPosts = um.getAllPosts();

	    // ตรวจสอบว่าผู้ใช้ได้กดไลค์โพสต์ไหนบ้าง
	    for (Post post : allPosts) {
	        boolean likedByUser = um.isPostLikedByUser(post.getId(), user.getEmail());
	        post.setLikedByUser(likedByUser); // กำหนดค่าว่าผู้ใช้กดไลค์หรือไม่
	    }

	    ModelAndView mav = new ModelAndView("home");
	    mav.addObject("user", user);
	    mav.addObject("posts", allPosts); // ส่งโพสต์ไปยังหน้า JSP
	    return mav;
	}




    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public ModelAndView logout(HttpSession session) {
    	session.invalidate(); 
        UserManager um = new UserManager();

        List<Post> allPosts = um.getAllPosts();

        ModelAndView mav = new ModelAndView("index");
        mav.addObject("posts", allPosts);
        return mav;
    }
    
    
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public ModelAndView viewProfile(HttpSession session) {
	    User user = (User) session.getAttribute("user");
	    
	    if (user == null) {
	        return new ModelAndView("login");
	    }
	    
	    ModelAndView mav = new ModelAndView("profile");
	    mav.addObject("user", user);
	    return mav;
	}
	
	@RequestMapping(value = "/editProfile", method = RequestMethod.GET)
	public ModelAndView editProfile(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return new ModelAndView("login");
		}else {
		ModelAndView mav = new ModelAndView("editProfile");
		mav.addObject("user", user);
		return mav;
		}
	}

	@RequestMapping(value = "/updateProfile", method = RequestMethod.POST)
	public ModelAndView updateProfile(HttpServletRequest request, HttpSession session) {
		User user = (User) session.getAttribute("user");

		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String dob = request.getParameter("dob");
		String profileUrl = request.getParameter("profileUrl");
		try {
		password = PasswordUtil.getInstance().createPassword(password,"itmjusci");
		}catch(Exception e){
			e.printStackTrace();
		}
		user.setName(name);
		user.setPassword(password);
		user.setBirth(dob);
		user.setUrlPic(profileUrl);

		UserManager rm = new UserManager();
		rm.updateUser(user);

		session.setAttribute("user", user);

		ModelAndView mav = new ModelAndView("profile");
		mav.addObject("user", user);
		return mav;
	}
	
	@RequestMapping(value = "/open_createPost", method = RequestMethod.GET)
	public String loadCreatePostPage(HttpSession session) {
		return "createPost";
	}
	
	
	@RequestMapping(value = "/createPost", method = RequestMethod.POST)
	public ModelAndView createPost(HttpServletRequest request, HttpSession session) {
	    // ตรวจสอบว่าผู้ใช้ล็อกอินหรือไม่
	    User user = (User) session.getAttribute("user");
	    if (user == null) {
	        return new ModelAndView("login").addObject("error", "กรุณาเข้าสู่ระบบก่อนสร้างกระทู้");
	    }

	    // รับค่าจากฟอร์ม
	    String title = request.getParameter("title");
	    String content = request.getParameter("content");
	    String imageUrl = request.getParameter("imageUrl"); // รูปภาพที่อาจจะมีหรือไม่มี

	    // สร้างโพสต์ใหม่
	    Post post = new Post();
	    post.setTitle(title);
	    post.setContent(content);
	    post.setImageUrl(imageUrl);
	    post.setCreatedDate(Calendar.getInstance());
	    post.setUser(user);
	    

	    // บันทึกโพสต์ใหม่ลงในฐานข้อมูล
	    UserManager um = new UserManager();
	    boolean result = um.InsertPost(post); // สมมติว่าเรามีเมธอดนี้ใน UserManager สำหรับการบันทึกโพสต์

	    // ตรวจสอบว่าการบันทึกสำเร็จหรือไม่
	    ModelAndView mav = new ModelAndView("createPost");
	    if (result) {
	        mav.addObject("mg", "สร้างกระทู้เรียบร้อย");
	    } else {
	        mav.addObject("error", "เกิดข้อผิดพลาดในการสร้างกระทู้");
	    }
	    return mav;
	}

	@RequestMapping(value = "/toggleLikePost", method = RequestMethod.POST)
	public ModelAndView toggleLikePost(HttpServletRequest request, HttpSession session) {
	    String postIdStr = request.getParameter("postId");
	    int postId = Integer.parseInt(postIdStr);

	    User user = (User) session.getAttribute("user");
	    UserManager um = new UserManager();

	    Post post = um.getPostByid(postId);

	    // ตรวจสอบว่าผู้ใช้ได้กดไลค์โพสต์นี้หรือยัง
	    boolean likedByUser = um.isPostLikedByUser(post.getId(), user.getEmail());

	    if (likedByUser) {
	        // ถ้าผู้ใช้กดไลค์แล้ว ให้ลบไลค์
	        post.setLikeCount(post.getLikeCount() - 1); // ลดยอดไลค์
	        um.removeLike(post, user); // ลบข้อมูลไลค์จากฐานข้อมูล
	    } else {
	        // ถ้ายังไม่กดไลค์ ให้เพิ่มไลค์
	        post.setLikeCount(post.getLikeCount() + 1); // เพิ่มยอดไลค์
	        um.addLike(post, user); // เพิ่มข้อมูลไลค์ในฐานข้อมูล
	    }

	    um.updatePost(post); // อัปเดตโพสต์ในฐานข้อมูล

	    // หลังจากกดไลค์หรือยกเลิก ให้กลับไปหน้า showHome
	    return new ModelAndView("redirect:/showHome");
	}







	
	@RequestMapping(value = "/list_post", method = RequestMethod.GET)
	public ModelAndView listHelpPage(HttpSession session) {
		UserManager um = new UserManager();
		User u = (User) session.getAttribute("user");
		String email = u.getEmail();
		User user = um.getRegisterByEmail(email);
		ModelAndView mav = new ModelAndView("list_post");
		mav.addObject("user",user);
		return mav;
	}
	

	@RequestMapping(value = "/editPost", method = RequestMethod.GET)
	public ModelAndView editPost(HttpServletRequest request, HttpSession session) {
	    int postId = Integer.parseInt(request.getParameter("id"));
	    UserManager um = new UserManager();
	    Post post = um.getPostByid(postId);
	    if (post == null) {
	        return new ModelAndView("list_post").addObject("error", "Post not found");
	    }
	    
	    ModelAndView mav = new ModelAndView("editPost");
	    mav.addObject("post", post);
	    return mav;
	}

	@RequestMapping(value = "/updatePost", method = RequestMethod.POST)
	public ModelAndView updatePost(HttpServletRequest request, HttpSession session) {
	    int postId = Integer.parseInt(request.getParameter("id"));
	    String title = request.getParameter("title");
	    String content = request.getParameter("content");
	    
	    UserManager um = new UserManager();
	    Post post = um.getPostByid(postId); // Get the existing post
	    if (post != null) {
	        post.setTitle(title);
	        post.setContent(content);
	        post.setCreatedDate(Calendar.getInstance());

	        um.updatePost(post); // You need to implement this method
	    }
	    ModelAndView mav = new ModelAndView("editPost");
	    mav.addObject("meg","อัปเดตสำเร็จ");
	    return mav;
	}
	
	@RequestMapping(value = "/deletePost", method = RequestMethod.GET)
	public ModelAndView deletePost(HttpServletRequest request, HttpSession session) {
	    int postId = Integer.parseInt(request.getParameter("id"));
	    UserManager um = new UserManager();
	    Post p = um.getPostByid(postId);
	    boolean result = um.deletePost(p);
	    List<Post> post = um.getAllPosts();
        ModelAndView mav = new ModelAndView("profile");
    		mav.addObject("post", post);
    	if (post.size() == 0) {
    		mav.addObject("error", "ยังไม่ได้ลงทะเบียน");
    	}
    	return mav;
	}
	
	@RequestMapping(value = "/searchPostIndex", method = RequestMethod.POST)
	public ModelAndView searchPostIndex(HttpServletRequest request, HttpSession session) {
	    String keyword = request.getParameter("keyword");
	    UserManager um = new UserManager();

	    List<Post> searchResults = um.searchPosts(keyword); // Call the search method from your UserManager

	    ModelAndView mav = new ModelAndView("index"); // or the appropriate view for search results
	    mav.addObject("posts", searchResults);
	    if (searchResults.size()==0) {
	        mav.addObject("errorf", "ไม่พบโพสตน์ที่ค้นหา");
	    }
	    return mav;
	}

	@RequestMapping(value = "/searchPostHome", method = RequestMethod.POST)
	public ModelAndView searchPostHome(HttpServletRequest request, HttpSession session) {
	    String keyword = request.getParameter("keyword");
	    UserManager um = new UserManager();

	    List<Post> searchResults = um.searchPosts(keyword); // Call the search method from your UserManager

	    ModelAndView mav = new ModelAndView("home"); // or the appropriate view for search results
	    mav.addObject("posts", searchResults);
	    if (searchResults.size()==0) {
	        mav.addObject("errorf", "ไม่พบโพสตน์ที่ค้นหา");
	    }
	    return mav;
	}
    @RequestMapping(value = "/contract", method = RequestMethod.GET)
    public String ContractPage() {
        return "contract";
    }
    
    
    @RequestMapping(value = "/ruleAdvice", method = RequestMethod.GET)
    public String RuleAdvicePage() {
        return "rule_advice";
    }
    
    @RequestMapping(value = "/postAdvice", method = RequestMethod.GET)
    public String PostAdvicePage() {
        return "post_advice";
    }

    @RequestMapping(value = "/addComment", method = RequestMethod.POST)
    public String addComment(HttpServletRequest request, HttpSession session) {
        String commentText = request.getParameter("commentText");
        int postId = Integer.parseInt(request.getParameter("postId"));
        
        // ตรวจสอบว่าผู้ใช้ได้ล็อกอินหรือไม่
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        
        // ดึงโพสต์จากฐานข้อมูล
        UserManager um = new UserManager();
        Post post = um.getPostByid(postId);

        // สร้างคอมเมนต์ใหม่
        Comment comment = new Comment();
        comment.setText(commentText);
        comment.setCreatedDate(Calendar.getInstance());
        comment.setPost(post);
        comment.setUser(user);
        // บันทึกคอมเมนต์ลงฐานข้อมูล
        um.insertComment(comment);

        return "redirect:/showHome";  // เปลี่ยนกลับไปหน้าหลัก
    }

    @RequestMapping(value = "/myComments", method = RequestMethod.GET)
    public ModelAndView viewMyComments(HttpSession session) {
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            return new ModelAndView("redirect:/login"); // Redirect to login if not authenticated
        }
        
        UserManager um = new UserManager();
        List<Comment> userComments = um.getCommentsByUser(user.getEmail()); // Fetch comments by user email
        

        ModelAndView mav = new ModelAndView("my_comments");
        mav.addObject("comments", userComments);
        return mav;
    }
    
    @RequestMapping(value = "/deleteComment", method = RequestMethod.GET)
    public ModelAndView deleteComment(HttpServletRequest request, HttpSession session) {
        int commentId = Integer.parseInt(request.getParameter("id"));
        UserManager um = new UserManager();
        
        // ดึงคอมเมนต์ตาม commentId
        Comment comment = um.getCommentById(commentId);
        
        // ทำการลบคอมเมนต์
        boolean result = um.deleteComment(comment);
        
        // ดึงคอมเมนต์ทั้งหมดของผู้ใช้ที่ล็อกอิน
        User user = (User) session.getAttribute("user");
        List<Comment> comments = um.getCommentsByUserEmail(user.getEmail());
        
        ModelAndView mav = new ModelAndView("my_comments");
        mav.addObject("comments", comments);
        
        if (comments.size() == 0) {
            mav.addObject("error", "ยังไม่มีความคิดเห็น");
        }
        
        return mav;
    }


    







}        
