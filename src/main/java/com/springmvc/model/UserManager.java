package com.springmvc.model;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class UserManager {

    public List<User> getAllUser() {
        List<User> list = new ArrayList<>();
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            session.beginTransaction();
            list = session.createQuery("FROM User", User.class).list();
            session.getTransaction().commit();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return list;
    }

    public List<Post> getAllPosts() {
        List<Post> posts = null;
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            session.beginTransaction();
            
            posts = session.createQuery("FROM Post", Post.class).list();
            
            session.getTransaction().commit();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return posts;
    }

    public boolean InsertUser(User u) {
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            session.beginTransaction();
            session.saveOrUpdate(u);
            session.getTransaction().commit();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public User validateUser(String email, String password) {
        User user = null;
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            session.beginTransaction();
            user = session.createQuery("FROM User WHERE email = :email", User.class)
                    .setParameter("email", email)
                    .uniqueResult();
            session.getTransaction().commit();
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        if (user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null;
    }

    public User getRegisterByEmail(String email) {
        User user = null;
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            session.beginTransaction();
            user = session.createQuery("FROM User WHERE email = :email", User.class)
                    .setParameter("email", email)
                    .uniqueResult();
            session.getTransaction().commit();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return user;
    }

    public boolean updateUser(User u) {
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            session.beginTransaction();
            session.update(u);
            session.getTransaction().commit();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean updatePost(Post p) {
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            session.beginTransaction();
            session.update(p);
            session.getTransaction().commit();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean deletePost(Post p) {
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            session.beginTransaction();
            session.delete(p);
            session.getTransaction().commit();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public Post getPostByid(int id) {
        Post post = null;
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            session.beginTransaction();
            post = session.createQuery("FROM Post WHERE id = :id", Post.class)
                    .setParameter("id", id)
                    .uniqueResult();
            session.getTransaction().commit();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return post;
    }

    public List<Post> searchPosts(String keyword) {
        List<Post> post = new ArrayList<>();
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            session.beginTransaction();
            post = session.createQuery("FROM Post WHERE title LIKE :keyword", Post.class)
                    .setParameter("keyword", "%" + keyword + "%")
                    .list();
            session.getTransaction().commit();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return post;
    }
    public boolean InsertPost(Post post) {
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            session.beginTransaction();
            session.save(post);  // บันทึกโพสต์ใหม่
            session.getTransaction().commit();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }
    
    public boolean insertComment(Comment comment) {
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            session.beginTransaction();
            session.save(comment);
            session.getTransaction().commit();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public List<Comment> getCommentsByUser(String userEmail) {
        List<Comment> comments = new ArrayList<>();
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            session.beginTransaction();
            comments = session.createQuery("SELECT c FROM Comment c JOIN FETCH c.user u WHERE u.email = :email", Comment.class)
                    .setParameter("email", userEmail)
                    .list();
            session.getTransaction().commit();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return comments;
    }








    public Comment getCommentById(int commentId) {
        Comment comment = null;
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            session.beginTransaction();
            comment = session.createQuery("FROM Comment WHERE id = :id", Comment.class)
                             .setParameter("id", commentId)
                             .uniqueResult();
            session.getTransaction().commit();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return comment;
    }

    public boolean deleteComment(Comment comment) {
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            session.beginTransaction();
            session.delete(comment);
            session.getTransaction().commit();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }
    public List<Comment> getCommentsByUserEmail(String email) {
        List<Comment> comments = new ArrayList<>();
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            session.beginTransaction();
            
            // ดึงคอมเมนต์ทั้งหมดที่เกี่ยวข้องกับผู้ใช้
            comments = session.createQuery("FROM Comment WHERE post.user.email = :email", Comment.class)
                              .setParameter("email", email)
                              .list();
            
            session.getTransaction().commit();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return comments;
    }

    public List<Comment> getAllComments() {
        List<Comment> comments = null;
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            session.beginTransaction();
            
            // ดึงข้อมูลคอมเมนต์ทั้งหมด
            comments = session.createQuery("FROM Comment", Comment.class).list();
            
            session.getTransaction().commit();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return comments;
    }

    public User getUserByEmail(String email) {
        User user = null;
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            session.beginTransaction();
            
            // สร้าง query เพื่อดึงข้อมูลผู้ใช้จาก email
            user = session.createQuery("FROM User WHERE email = :email", User.class)
                          .setParameter("email", email)
                          .uniqueResult();  // uniqueResult เพื่อดึงผลลัพธ์เดียว
            
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return user;
    }

    public boolean deleteUser(User u) {
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            session.beginTransaction();
            session.delete(u);
            session.getTransaction().commit();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }
    public List<Like> getLikesByPost(Post post) {
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            return session.createQuery("FROM Like WHERE post = :post", Like.class)
                          .setParameter("post", post)
                          .list();
            
        }
    }
 // ตรวจสอบว่าผู้ใช้ได้กดไลค์โพสต์นี้หรือยัง
    public boolean isPostLikedByUser(int postId, String userEmail) {
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            Like like = session.createQuery("FROM Like WHERE post.id = :postId AND user.email = :userEmail", Like.class)
                               .setParameter("postId", postId)
                               .setParameter("userEmail", userEmail)
                               .uniqueResult();
            return like != null;  // ถ้ามี like อยู่แสดงว่าผู้ใช้ได้กดไลค์แล้ว
        }
    }

    public void addLike(Post post, User user) {
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            session.beginTransaction();
            
            // สร้าง Like object
            Like like = new Like();
            like.setPost(post);
            like.setUser(user);
            like.setLikedAt(Calendar.getInstance());

            session.save(like); // บันทึกไลค์ในฐานข้อมูล
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public void removeLike(Post post, User user) {
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            session.beginTransaction();

            // ค้นหาไลค์ของผู้ใช้ในโพสต์นี้
            Like like = session.createQuery("FROM Like l WHERE l.post.id = :postId AND l.user.email = :userEmail", Like.class)
                    .setParameter("postId", post.getId())
                    .setParameter("userEmail", user.getEmail())
                    .uniqueResult();

            if (like != null) {
                session.delete(like); // ลบไลค์จากฐานข้อมูล
            }

            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }



    public int getLikeCountForPost(int postId) {
        int likeCount = 0;
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            session.beginTransaction();
            // นับจำนวนไลค์ที่เชื่อมกับโพสต์นี้
            Long count = (Long) session.createQuery("SELECT COUNT(*) FROM Like WHERE post.id = :postId")
                    .setParameter("postId", postId)
                    .uniqueResult();
            likeCount = count != null ? count.intValue() : 0;
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return likeCount;
    }



    public boolean emailExists(String email) {
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            String hql = "SELECT COUNT(u.email) FROM User u WHERE u.email = :email";
            Long count = session.createQuery(hql, Long.class)
                .setParameter("email", email)
                .uniqueResult();
            return count != null && count > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }













}
