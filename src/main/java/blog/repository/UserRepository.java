package blog.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import blog.entity.User;

public interface UserRepository extends JpaRepository<User, Integer> {

	User findByName(String name);

}
