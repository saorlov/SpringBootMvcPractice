package ru.serge.site1.repos;

import org.springframework.data.repository.CrudRepository;
import ru.serge.site1.domain.Message;

import java.util.List;

public interface MessageRepos extends CrudRepository<Message, Long> {

    List<Message> findByTag(String tag);
}
