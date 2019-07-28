package blog.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import blog.entity.Blog;
import blog.entity.User;

public interface BlogRepository extends JpaRepository<Blog, Integer> {

	List<Blog> findByUser(User user);
	
}
