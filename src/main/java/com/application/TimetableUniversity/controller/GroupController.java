package com.application.TimetableUniversity.controller;
import com.application.TimetableUniversity.model.Group;
import com.application.TimetableUniversity.service.GroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;
@Controller
public class GroupController {
    @Autowired
    private final GroupService groupService;
    public GroupController(GroupService groupService) {
        this.groupService = groupService;
    }
    @GetMapping("/groups")
    public String findAll(Model model) {
        List<Group> groups = groupService.findAll();
        model.addAttribute("groups", groups);
        return "groups-list";
    }

    @GetMapping("/group-create")
    public String createGroupForm(Group group) {
        return "group-create";
    }

    @PostMapping("/group-create")
    public String createGroup(Group group) {
        groupService.saveGroup(group);
        return "redirect:/groups";
    }

    @GetMapping("group-delete/{id}")
    public String deleteGroup(@PathVariable("id") Long id) {
        groupService.deleteById(id);
        return "redirect:/groups";
    }

    @GetMapping("/group-update/{id}")
    public String updateGroupForm(@PathVariable("id") Long id, Model model) {
        Group group = groupService.findById(id);
        model.addAttribute("group", group);
        return "group-update";
    }

    @PostMapping("/group-update")
    public String updateGroup(Group group) {
        groupService.saveGroup(group);
        return "redirect:/groups";
    }
}
