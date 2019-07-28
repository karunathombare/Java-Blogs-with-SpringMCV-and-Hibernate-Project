package blog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import blog.entity.Blog;
import blog.entity.User;
import blog.repository.BlogRepository;
import blog.repository.UserRepository;

@Service
public class BlogService {

	
	@Autowired
	private BlogRepository blogRepository;
	
	@Autowired
	private UserRepository userRepository ;
	
	
	public void save(Blog blog, String name) {
		User user = userRepository.findByName(name);
		blog.setUser(user);
		blogRepository.save(blog);
	}


	public void delete(int id) {
		blogRepository.delete(id);		
	}

	
}
