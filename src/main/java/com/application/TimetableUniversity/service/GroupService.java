package com.application.TimetableUniversity.service;
import com.application.TimetableUniversity.model.Group;
import com.application.TimetableUniversity.repository.GroupRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
@Service
public class GroupService {
    private final GroupRepository groupRepository;

    @Autowired
    public GroupService(GroupRepository groupRepository) {
        this.groupRepository = groupRepository;
    }

    public Group findById(Long id) {
        return groupRepository.getReferenceById(id);
    }

    public void saveGroup(Group group) {
        groupRepository.save(group);
    }

    public List<Group> findAll() {
        return groupRepository.findAll();
    }

    public void deleteById(Long id) {
        groupRepository.deleteById(id);
    }
}
