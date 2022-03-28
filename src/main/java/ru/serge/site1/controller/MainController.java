package ru.serge.site1.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import ru.serge.site1.domain.Message;
import ru.serge.site1.domain.User;
import ru.serge.site1.repos.MessageRepos;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
public class MainController {

    private final MessageRepos messageRepos;

    public MainController(MessageRepos messageRepos) {
        this.messageRepos = messageRepos;
    }

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping
    public String home(
            Model model
    ) {
        return "home";
    }

    @GetMapping("/greeting")
    public String main(@RequestParam(required = false, defaultValue = "") String filter,
                       Model model
    ) {
        return getPage(filter, model);
    }

    @PostMapping("/greeting")
    public String add(@AuthenticationPrincipal User author,
                      @RequestParam(required = false, defaultValue = "") String filter,
                      @RequestParam String text,
                      @RequestParam String tag,
                      Model model,
                      @RequestParam("file")MultipartFile file
                      ) throws IOException {
        Message message = new Message(text, tag, author);

        if (file != null && !file.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" + resultFileName));

            message.setFilename(resultFileName);
        }

        messageRepos.save(message);
        return getPage(filter, model);
    }

    private String getPage(String filter,
                           Model model
    ) {
        Iterable<Message> messages;

        if (filter != null && !filter.isEmpty()) {
            messages = messageRepos.findByTag(filter);
        } else {
            messages = messageRepos.findAll();
        }

        model.addAttribute("filter", filter);
        model.addAttribute("messages", messages);
        return "greeting";
    }
}
