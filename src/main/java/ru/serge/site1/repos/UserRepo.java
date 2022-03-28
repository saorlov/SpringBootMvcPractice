package ru.serge.site1.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.serge.site1.domain.User;

public interface UserRepo extends JpaRepository<User, Long> {

    User findByUsername(String username);
}
